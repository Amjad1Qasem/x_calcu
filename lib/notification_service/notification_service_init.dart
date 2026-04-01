part of '../notification_service.dart';

Future<void> _nsInit() async {
  if (NotificationService._isInitialized) {
    print('🔔 Notification service already initialized');
    return;
  }

  await _nsInitializeTimeZones();
  await _nsInitializePlugin();
  NotificationService._isInitialized = true;
  print('🔔 Notification service initialized successfully');
}

Future<void> _nsInitializeTimeZones() async {
  tz.initializeTimeZones();
}

Future<void> _nsInitializePlugin() async {
  try {
    final initSettings = _nsBuildInitializationSettings();

    final result = await NotificationService._plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _nsHandleNotificationResponse,
    );

    print('🔔 Plugin initialization result: $result');
  } catch (e) {
    print('❌ Error initializing notification plugin: $e');
    try {
      final defaultSettings = InitializationSettings(
        android: const AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: _nsBuildIOSInitSettings(),
      );

      await NotificationService._plugin.initialize(
        defaultSettings,
        onDidReceiveNotificationResponse: _nsHandleNotificationResponse,
      );
      print('🔔 Plugin initialized with default settings');
    } catch (e2) {
      print('❌ Error with default settings: $e2');
      rethrow;
    }
  }
}

InitializationSettings _nsBuildInitializationSettings() {
  return InitializationSettings(
    android: _nsBuildAndroidInitSettings(),
    iOS: _nsBuildIOSInitSettings(),
  );
}

AndroidInitializationSettings _nsBuildAndroidInitSettings() {
  return const AndroidInitializationSettings('@mipmap/x_calcu');
}

DarwinInitializationSettings _nsBuildIOSInitSettings() {
  return DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    requestCriticalPermission: false,
    requestProvisionalPermission: false,
    defaultPresentAlert: true,
    defaultPresentBadge: true,
    defaultPresentSound: true,
    defaultPresentBanner: true,
    defaultPresentList: true,
  );
}

void _nsHandleNotificationResponse(NotificationResponse details) {
  if (details.payload == 'go_to_notifications') {
    // TODO: Navigate to notifications screen
  }
}
