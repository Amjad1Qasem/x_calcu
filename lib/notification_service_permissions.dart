part of 'notification_service.dart';

Future<bool> _nsAreNotificationsEnabled() async {
  if (Platform.isAndroid) {
    final status = await Permission.notification.status;
    print('🔐 Notification permission status: $status');

    if (status.isGranted) return true;
    if (status.isDenied) {
      final result = await Permission.notification.request();
      print('🔐 Notification permission request result: $result');
      return result.isGranted;
    }
    if (status.isPermanentlyDenied) {
      print('⚠️ Notification permission permanently denied');
      return false;
    }
  }

  final androidPlugin = _nsGetAndroidPlugin();
  final result = await androidPlugin?.areNotificationsEnabled();
  print('🔐 Notifications enabled check (fallback): $result');
  return result ?? false;
}

Future<bool> _nsRequestNotificationPermission() async {
  if (Platform.isAndroid) {
    final status = await Permission.notification.request();
    print('🔐 Notification permission request result: $status');
    return status.isGranted;
  } else if (Platform.isIOS) {
    return _nsRequestIOSNotificationPermissions();
  }

  final androidPlugin = _nsGetAndroidPlugin();
  final result = await androidPlugin?.requestNotificationsPermission();
  print('🔐 Permission request result (fallback): $result');
  return result ?? false;
}

Future<bool> _nsRequestExactAlarmPermission() async {
  if (!Platform.isAndroid) return true;

  final androidPlugin = _nsGetAndroidPlugin();
  if (androidPlugin == null) return false;

  try {
    final canSchedule = await androidPlugin.canScheduleExactNotifications();
    if (canSchedule == true) {
      print('🔐 Exact alarm permission already granted');
      return true;
    }

    print('🔐 Requesting exact alarm permission...');
    final result = await androidPlugin.requestExactAlarmsPermission();
    print('🔐 Exact alarm permission request result: $result');
    return result ?? false;
  } catch (e) {
    print('❌ Error requesting exact alarm permission: $e');
    return false;
  }
}

Future<bool> _nsCheckIOSNotificationPermissions() async {
  if (!Platform.isIOS) return true;

  try {
    final iosPlugin =
        NotificationService._plugin
            .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin
            >();

    if (iosPlugin == null) return false;

    final result = await iosPlugin.checkPermissions();
    print('📱 iOS Notification Permissions:');
    print('   Result: $result');
    return true;
  } catch (e) {
    print('❌ Error checking iOS notification permissions: $e');
    return false;
  }
}

Future<bool> _nsRequestIOSNotificationPermissions() async {
  if (!Platform.isIOS) return true;

  try {
    final iosPlugin =
        NotificationService._plugin
            .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin
            >();

    if (iosPlugin == null) return false;

    print('📱 Requesting iOS notification permissions...');
    final result = await iosPlugin.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
      critical: false,
      provisional: false,
    );

    print('📱 iOS Permission request result: $result');
    return result ?? false;
  } catch (e) {
    print('❌ Error requesting iOS notification permissions: $e');
    return false;
  }
}

Future<bool> _nsIsNotificationChannelEnabled() async {
  final androidPlugin = _nsGetAndroidPlugin();
  if (androidPlugin == null) return false;

  try {
    final channels = await androidPlugin.getNotificationChannels();
    if (channels == null || channels.isEmpty) {
      print('🔐 No channels found, assuming enabled');
      return true;
    }

    AndroidNotificationChannel? reminderChannel;
    for (final channel in channels) {
      if (channel.id == 'reminder_channel') {
        reminderChannel = channel;
        break;
      }
    }

    if (reminderChannel == null) {
      print('🔐 Channel not found, assuming enabled');
      return true;
    }

    final importance = reminderChannel.importance;
    final isEnabled = importance != Importance.none;
    print('🔐 Channel enabled check: $isEnabled (importance: $importance)');
    return isEnabled;
  } catch (e) {
    print('🔐 Error checking channel: $e');
    return true;
  }
}

AndroidFlutterLocalNotificationsPlugin? _nsGetAndroidPlugin() {
  return NotificationService._plugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();
}

Future<Map<String, bool>> _nsCheckAllNotificationPermissions() async {
  final results = <String, bool>{};

  try {
    if (Platform.isAndroid) {
      final notificationStatus = await Permission.notification.status;
      results['notification_permission'] = notificationStatus.isGranted;

      final exactAlarmStatus = await Permission.scheduleExactAlarm.status;
      results['exact_alarm_permission'] = exactAlarmStatus.isGranted;

      final batteryOptimizationStatus =
          await Permission.ignoreBatteryOptimizations.status;
      results['battery_optimization'] = batteryOptimizationStatus.isGranted;

      final systemAlertStatus = await Permission.systemAlertWindow.status;
      results['system_alert_window'] = systemAlertStatus.isGranted;

      print('🔍 Permission check results: $results');
    } else if (Platform.isIOS) {
      final iosPermissions = await _nsCheckIOSNotificationPermissions();
      results['ios_notification_permission'] = iosPermissions;
    }
  } catch (e) {
    print('❌ Error checking permissions: $e');
    results['error'] = false;
  }

  return results;
}

Future<Map<String, bool>> _nsRequestAllNotificationPermissions() async {
  final results = <String, bool>{};

  try {
    if (Platform.isAndroid) {
      final notificationResult = await Permission.notification.request();
      results['notification_permission'] = notificationResult.isGranted;

      final exactAlarmResult = await Permission.scheduleExactAlarm.request();
      results['exact_alarm_permission'] = exactAlarmResult.isGranted;

      final batteryResult =
          await Permission.ignoreBatteryOptimizations.request();
      results['battery_optimization'] = batteryResult.isGranted;

      final systemAlertResult = await Permission.systemAlertWindow.request();
      results['system_alert_window'] = systemAlertResult.isGranted;

      print('🔐 Permission request results: $results');
    } else if (Platform.isIOS) {
      final iosResult = await _nsRequestIOSNotificationPermissions();
      results['ios_notification_permission'] = iosResult;
    }
  } catch (e) {
    print('❌ Error requesting permissions: $e');
    results['error'] = false;
  }

  return results;
}

Future<void> _nsInitializeWithPermissionChecks() async {
  try {
    print('🔔 Initializing notification service with permission checks...');
    await _nsInit();

    final permissionResults = await _nsRequestAllNotificationPermissions();
    print('📋 Permission results: $permissionResults');

    final systemStatus = await _nsCheckNotificationSystem();
    print('📋 System status: $systemStatus');

    if (systemStatus['system_working'] == true) {
      await _nsShowTestNotification();
      print('✅ Notification service initialized successfully with permissions');
    } else {
      print(
        '⚠️ Notification service initialized but some permissions are missing',
      );
    }
  } catch (e) {
    print('❌ Error initializing notification service: $e');
    rethrow;
  }
}
