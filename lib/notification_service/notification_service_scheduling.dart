part of '../notification_service.dart';

Future<void> _nsScheduleOperationNotification({
  required int id,
  required NotificationType type,
  required String clientName,
  required DateTime scheduledTime,
  int? operationId,
  String? partnerName,
  String? customerName,
  double? amount,
  String? payload,
}) async {
  final content = _nsCreateNotificationContent(
    type: type,
    clientName: clientName,
  );
  await _nsScheduleNotification(
    id: id,
    title: content['title']!,
    body: content['body']!,
    scheduledTime: scheduledTime,
    payload: payload,
    type: type,
    operationId: operationId,
    partnerName: partnerName,
    customerName: customerName,
    amount: amount,
  );
}

Future<void> _nsScheduleNotification({
  required int id,
  required String title,
  required String body,
  required DateTime scheduledTime,
  String? payload,
  NotificationType? type,
  int? operationId,
  String? partnerName,
  String? customerName,
  double? amount,
}) async {
  try {
    print('🔔 Scheduling notification: $title at $scheduledTime');

    if (id < 0)
      throw ArgumentError('Notification ID must be non-negative, got: $id');
    if (title.trim().isEmpty)
      throw ArgumentError('Notification title cannot be empty');
    if (body.trim().isEmpty)
      throw ArgumentError('Notification body cannot be empty');
    if (scheduledTime.isBefore(DateTime.now())) {
      print('⚠️ Scheduled time is in the past, skipping notification');
      return;
    }

    await _nsEnsureNotificationPermission();
    await _nsScheduleNotificationWithDetails(
      id: id,
      title: title.trim(),
      body: body.trim(),
      scheduledTime: scheduledTime,
      payload: payload,
    );

    print('✅ Notification scheduled successfully');
    await _nsPrintPendingNotifications();

    if (type != null && operationId != null) {
      await _nsSaveNotificationToDatabase(
        id: id,
        title: title.trim(),
        body: body.trim(),
        scheduledTime: scheduledTime,
        type: type,
        operationId: operationId,
        partnerName: partnerName,
        customerName: customerName,
        amount: amount,
        payload: payload,
      );
      print('💾 Notification saved to database');
    }
  } catch (e, s) {
    print('❌ Error scheduling notification: $e');
    print('❌ Stack trace: $s');
    rethrow;
  }
}

Future<void> _nsEnsureNotificationPermission() async {
  print('🔐 Starting comprehensive permission check...');
  try {
    final permissionResults = await _nsCheckAllNotificationPermissions();
    print('🔐 Current permission status: $permissionResults');

    if (Platform.isAndroid) {
      final isEnabled = await _nsAreNotificationsEnabled();
      print('🔐 Android Notifications enabled: $isEnabled');
      if (!isEnabled) {
        final granted = await _nsRequestNotificationPermission();
        print('🔐 Android Permission granted: $granted');
      }

      final channelEnabled = await _nsIsNotificationChannelEnabled();
      print('🔐 Android Notification channel enabled: $channelEnabled');

      final exactAlarmStatus = await Permission.scheduleExactAlarm.status;
      if (!exactAlarmStatus.isGranted) {
        final exactAlarmResult = await Permission.scheduleExactAlarm.request();
        print('🔐 Exact alarm permission result: $exactAlarmResult');
      }

      final batteryStatus = await Permission.ignoreBatteryOptimizations.status;
      if (!batteryStatus.isGranted) {
        final batteryResult =
            await Permission.ignoreBatteryOptimizations.request();
        print('🔐 Battery optimization permission result: $batteryResult');
      }

      final systemAlertStatus = await Permission.systemAlertWindow.status;
      if (!systemAlertStatus.isGranted) {
        final systemAlertResult = await Permission.systemAlertWindow.request();
        print('🔐 System alert window permission result: $systemAlertResult');
      }
    } else if (Platform.isIOS) {
      final iosPermissionsGranted = await _nsCheckIOSNotificationPermissions();
      if (!iosPermissionsGranted) {
        final granted = await _nsRequestIOSNotificationPermissions();
        print('📱 iOS Permission granted: $granted');
      }
    }
    print('✅ Permission check completed');
  } catch (e) {
    print('❌ Error during permission check: $e');
    print(
      '⚠️ Continuing with notification scheduling despite permission issues',
    );
  }
}

Future<void> _nsScheduleNotificationWithDetails({
  required int id,
  required String title,
  required String body,
  required DateTime scheduledTime,
  String? payload,
}) async {
  try {
    if (id < 0) throw ArgumentError('Notification ID must be non-negative');
    if (title.isEmpty)
      throw ArgumentError('Notification title cannot be empty');
    if (body.isEmpty) throw ArgumentError('Notification body cannot be empty');
    if (scheduledTime.isBefore(DateTime.now())) return;

    final tzDateTime = await _nsConvertToTZDateTime(scheduledTime);
    final notificationDetails = _nsBuildNotificationDetails();

    if (!NotificationService._isInitialized) {
      try {
        await _nsInit();
      } catch (_) {}
    }

    try {
      await NotificationService._plugin.zonedSchedule(
        id,
        title,
        body,
        tzDateTime,
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: payload,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } catch (e) {
      if (e.toString().contains('exact_alarms_not_permitted') ||
          e.toString().contains('exact_alarm')) {
        await NotificationService._plugin.zonedSchedule(
          id,
          title,
          body,
          tzDateTime,
          notificationDetails,
          androidScheduleMode: AndroidScheduleMode.inexact,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time,
        );
      } else if (e.toString().contains('invalid_icon')) {
        final defaultNotificationDetails = AndroidNotificationDetails(
          'reminder_channel',
          'Reminders',
          channelDescription: 'Reminder notifications for due payments',
          importance: Importance.max,
          priority: Priority.high,
          icon: '@drawable/ic_stat_x',
          enableVibration: true,
          playSound: true,
          showWhen: true,
          autoCancel: false,
          ongoing: false,
        );
        await NotificationService._plugin.zonedSchedule(
          id,
          title,
          body,
          tzDateTime,
          NotificationDetails(android: defaultNotificationDetails),
          androidScheduleMode: AndroidScheduleMode.inexact,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time,
        );
      } else {
        rethrow;
      }
    }
  } catch (e, s) {
    printError('❌ Error _scheduleNotificationWithDetails Sss: $s');
    printError(
      '❌ Error _scheduleNotificationWithDetails scheduling notification: $e',
    );
    rethrow;
  }
}

Future<tz.TZDateTime> _nsConvertToTZDateTime(DateTime dateTime) async {
  try {
    tz.initializeTimeZones();
    final timeZoneName = await FlutterTimezone.getLocalTimezone();
    final location = tz.getLocation(timeZoneName);
    tz.setLocalLocation(location);
    return tz.TZDateTime.from(dateTime, location);
  } catch (_) {
    try {
      tz.initializeTimeZones();
      return tz.TZDateTime.from(dateTime, tz.local);
    } catch (_) {
      tz.initializeTimeZones();
      return tz.TZDateTime.from(dateTime, tz.UTC);
    }
  }
}

NotificationDetails _nsBuildNotificationDetails() {
  return const NotificationDetails(
    android: AndroidNotificationDetails(
      'reminder_channel',
      'Reminders',
      channelDescription: 'Reminder notifications for due payments',
      importance: Importance.max,
      priority: Priority.high,
      icon: '@drawable/ic_notification',
      enableVibration: true,
      playSound: true,
      showWhen: true,
      autoCancel: false,
      ongoing: false,
      visibility: NotificationVisibility.public,
      fullScreenIntent: false,
      category: AndroidNotificationCategory.reminder,
      channelShowBadge: true,
      enableLights: true,
      ledColor: Color.fromARGB(255, 33, 150, 243),
      ledOnMs: 1000,
      ledOffMs: 500,
      ticker: 'Reminder notification',
      styleInformation: BigTextStyleInformation(''),
    ),
    iOS: DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: 'default',
      interruptionLevel: InterruptionLevel.active,
      presentBanner: true,
      presentList: true,
      badgeNumber: 1,
      threadIdentifier: 'reminder_thread',
      categoryIdentifier: 'reminder_category',
    ),
  );
}

Map<String, String> _nsCreateNotificationContent({
  required NotificationType type,
  required String clientName,
}) {
  switch (type) {
    case NotificationType.input:
      return {
        'title': 'input_notification_title'.tr(),
        'body': 'input_notification_body'.tr().replaceAll(
          '{clientName}',
          clientName,
        ),
      };
    case NotificationType.output:
      return {
        'title': 'output_notification_title'.tr(),
        'body': 'output_notification_body'.tr().replaceAll(
          '{clientName}',
          clientName,
        ),
      };
  }
}

Future<void> _nsSaveNotificationToDatabase({
  required int id,
  required String title,
  required String body,
  required DateTime scheduledTime,
  required NotificationType type,
  required int operationId,
  String? partnerName,
  String? customerName,
  double? amount,
  String? payload,
}) async {
  try {
    final notificationRepo = NotificationRepo();
    final notification = NotificationModel(
      id: id,
      title: title,
      body: body,
      scheduledTime: scheduledTime,
      createdAt: DateTime.now(),
      type: type,
      operationId: operationId,
      partnerName: partnerName,
      customerName: customerName,
      amount: amount,
      isRead: false,
      payload: payload,
    );
    await notificationRepo.saveNotification(notification);
    await notificationRepo.autoDeleteOldNotifications();
    printSuccess('💾 Notification saved and auto-cleanup completed');
  } catch (e) {
    printError('Error saving notification to database: $e');
  }
}
