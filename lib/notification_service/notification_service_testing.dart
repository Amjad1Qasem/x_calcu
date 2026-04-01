part of '../notification_service.dart';

Future<void> _nsShowTestNotification() async {
  try {
    await _nsEnsureNotificationPermission();
    final testId = DateTime.now().millisecondsSinceEpoch.remainder(100000);

    await NotificationService._plugin.show(
      testId,
      'Test Notification',
      'This is a test notification to verify the system is working',
      _nsBuildNotificationDetails(),
      payload: 'test_notification',
    );

    await _nsSaveNotificationToDatabase(
      id: testId,
      title: 'Test Notification',
      body: 'This is a test notification to verify the system is working',
      scheduledTime: DateTime.now(),
      type: NotificationType.input,
      operationId: 999,
      customerName: 'Test Customer',
      amount: 100.0,
    );
  } catch (e) {
    print('❌ Error showing test notification: $e');
    rethrow;
  }
}

Future<void> _nsScheduleTestNotification() async {
  final now = DateTime.now();
  final testTime = DateTime(
    now.year,
    now.month,
    now.day,
    now.hour,
    now.minute,
    now.second + 5,
  );
  final testId = DateTime.now().millisecondsSinceEpoch.remainder(100000);
  await _nsScheduleNotification(
    id: testId,
    title: 'Test Scheduled Notification',
    body: 'This notification was scheduled 5 seconds ago',
    scheduledTime: testTime,
    payload: 'test_scheduled',
    type: NotificationType.input,
    operationId: 999,
    partnerName: 'Test Partner',
    customerName: 'Test Customer',
    amount: 1000.0,
  );
}

Future<void> _nsScheduleImmediateTestNotification() async {
  final now = DateTime.now();
  final testId = DateTime.now().millisecondsSinceEpoch.remainder(100000);
  await _nsScheduleNotification(
    id: testId,
    title: 'Immediate Test Notification',
    body: 'This notification should appear immediately',
    scheduledTime: now,
    payload: 'test_immediate',
    type: NotificationType.input,
    operationId: 998,
    partnerName: 'Test Partner',
    customerName: 'Test Customer',
    amount: 500.0,
  );
}

Future<void> _nsTestImmediateNotification() async {
  await _nsEnsureNotificationPermission();
  final testId = DateTime.now().millisecondsSinceEpoch.remainder(100000);
  await NotificationService._plugin.show(
    testId,
    'Immediate Test',
    'This notification should appear immediately without scheduling',
    _nsBuildNotificationDetails(),
    payload: 'test_immediate_show',
  );
}

Future<void> _nsTestBackgroundNotification() async {
  final now = DateTime.now();
  final testTime = DateTime(
    now.year,
    now.month,
    now.day,
    now.hour,
    now.minute,
    now.second + 10,
  );
  final testId = DateTime.now().millisecondsSinceEpoch.remainder(100000);
  await _nsScheduleNotification(
    id: testId,
    title: 'Background Test Notification',
    body: 'This notification should appear even when the app is closed',
    scheduledTime: testTime,
    payload: 'test_background',
    type: NotificationType.input,
    operationId: 996,
    partnerName: 'Test Partner',
    customerName: 'Test Customer',
    amount: 2000.0,
  );
}

Future<void> _nsTestIOSNotification() async {
  if (!Platform.isIOS) return;
  final now = DateTime.now();
  final testTime = DateTime(
    now.year,
    now.month,
    now.day,
    now.hour,
    now.minute,
    now.second + 5,
  );
  final testId = DateTime.now().millisecondsSinceEpoch.remainder(100000);
  final permissionsGranted = await _nsCheckIOSNotificationPermissions();
  if (!permissionsGranted) await _nsRequestIOSNotificationPermissions();
  await _nsScheduleNotification(
    id: testId,
    title: 'iOS Test Notification',
    body: 'This is a test notification for iOS with enhanced features',
    scheduledTime: testTime,
    payload: 'test_ios',
    type: NotificationType.input,
    operationId: 995,
    partnerName: 'iOS Test Partner',
    customerName: 'iOS Test Customer',
    amount: 1500.0,
  );
}

Future<void> _nsTestOperationNotifications() async {
  final now = DateTime.now();
  final testTime1 = DateTime(
    now.year,
    now.month,
    now.day,
    now.hour,
    now.minute,
    now.second + 5,
  );
  final testTime2 = DateTime(
    now.year,
    now.month,
    now.day,
    now.hour,
    now.minute,
    now.second + 10,
  );
  final testId1 = DateTime.now().millisecondsSinceEpoch.remainder(100000);
  final testId2 = testId1 + 1;

  await _nsScheduleOperationNotification(
    id: testId1,
    type: NotificationType.input,
    clientName: 'أحمد محمد',
    scheduledTime: testTime1,
    operationId: 1001,
    customerName: 'أحمد محمد',
    amount: 50000.0,
    payload: 'test_input_operation',
  );

  await _nsScheduleOperationNotification(
    id: testId2,
    type: NotificationType.output,
    clientName: 'فاطمة علي',
    scheduledTime: testTime2,
    operationId: 1002,
    customerName: 'فاطمة علي',
    amount: 25000.0,
    payload: 'test_output_operation',
  );
}

Future<void> _nsTestNotificationSystemWithErrorHandling() async {
  await _nsInit();
  await _nsShowTestNotification();
  await _nsTestOperationNotifications();
}

Future<void> _nsTestNotificationSystemComprehensive() async {
  await _nsInit();
  await _nsCheckNotificationSystem();
  await _nsShowTestNotification();
  await _nsTestOperationNotifications();
}

Future<void> _nsTestTimezoneConversion() async {
  tz.initializeTimeZones();
  final timeZoneName = await FlutterTimezone.getLocalTimezone();
  final location = tz.getLocation(timeZoneName);
  tz.setLocalLocation(location);
  final now = DateTime.now();
  final tzFutureTime = tz.TZDateTime.from(
    now.add(const Duration(seconds: 5)),
    location,
  );
  final testId = DateTime.now().millisecondsSinceEpoch.remainder(100000);
  await NotificationService._plugin.zonedSchedule(
    testId,
    'Timezone Test',
    'This notification tests timezone conversion',
    tzFutureTime,
    _nsBuildNotificationDetails(),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    payload: 'timezone_test',
    matchDateTimeComponents: DateTimeComponents.time,
  );
}

Future<void> _nsTestAllNotificationPermissions() async {
  await _nsCheckAllNotificationPermissions();
  await _nsRequestAllNotificationPermissions();
  await _nsCheckNotificationSystem();
  await _nsShowTestNotification();
}

Future<void> _nsCancelNotification(int id) async {
  await NotificationService._plugin.cancel(id);
}

Future<void> _nsCancelAll() async {
  await NotificationService._plugin.cancelAll();
}

Future<List<PendingNotificationRequest>> _nsGetPendingNotifications() async {
  return NotificationService._plugin.pendingNotificationRequests();
}

Future<void> _nsPrintPendingNotifications() async {
  final pending = await _nsGetPendingNotifications();
  print('📋 Pending notifications count: ${pending.length}');
  for (final notification in pending) {
    print('📋 ID: ${notification.id}, Title: ${notification.title}');
  }
}

Future<Map<String, dynamic>> _nsCheckNotificationSystem() async {
  final results = <String, dynamic>{};

  try {
    final permissionResults = await _nsCheckAllNotificationPermissions();
    results.addAll(permissionResults);

    final isEnabled = await _nsAreNotificationsEnabled();
    results['notifications_enabled'] = isEnabled;

    final channelEnabled = await _nsIsNotificationChannelEnabled();
    results['channel_enabled'] = channelEnabled;

    bool exactAlarmsEnabled = true;
    bool iosPermissionsEnabled = true;

    if (Platform.isAndroid) {
      final exactAlarmStatus = await Permission.scheduleExactAlarm.status;
      exactAlarmsEnabled = exactAlarmStatus.isGranted;
      results['exact_alarms_enabled'] = exactAlarmsEnabled;

      final batteryStatus = await Permission.ignoreBatteryOptimizations.status;
      results['battery_optimization_enabled'] = batteryStatus.isGranted;

      final systemAlertStatus = await Permission.systemAlertWindow.status;
      results['system_alert_window_enabled'] = systemAlertStatus.isGranted;
    } else if (Platform.isIOS) {
      iosPermissionsEnabled = await _nsCheckIOSNotificationPermissions();
      results['ios_permissions_enabled'] = iosPermissionsEnabled;
    }

    final pending = await _nsGetPendingNotifications();
    results['pending_count'] = pending.length;

    tz.initializeTimeZones();
    final currentTime = tz.TZDateTime.now(tz.local);
    results['current_time'] = currentTime.toString();
    results['timezone'] = tz.local.name;

    final allPermissionsGranted =
        Platform.isAndroid
            ? (isEnabled && channelEnabled && exactAlarmsEnabled)
            : (isEnabled && channelEnabled);
    results['system_working'] = allPermissionsGranted;
  } catch (e) {
    results['error'] = e.toString();
  }
  return results;
}
