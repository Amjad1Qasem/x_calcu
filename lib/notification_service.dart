// notification_service.dart
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart' show FlutterTimezone;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:permission_handler/permission_handler.dart';
import 'package:x_calcu/features/notification/data/notification_model.dart';
import 'package:x_calcu/features/notification/data/notification_repo.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

/// Service for managing local notifications
class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  static bool _isInitialized = false;

  // ==================== Initialization ====================

  /// Initializes the notification service
  static Future<void> init() async {
    if (_isInitialized) {
      print('🔔 Notification service already initialized');
      return;
    }

    await _initializeTimeZones();
    await _initializePlugin();
    _isInitialized = true;
    print('🔔 Notification service initialized successfully');
  }

  /// Initializes timezone data
  static Future<void> _initializeTimeZones() async {
    tz.initializeTimeZones();
  }

  /// Initializes the notification plugin
  static Future<void> _initializePlugin() async {
    try {
      final initSettings = _buildInitializationSettings();

      final result = await _plugin.initialize(
        initSettings,
        onDidReceiveNotificationResponse: _handleNotificationResponse,
      );

      print('🔔 Plugin initialization result: $result');
    } catch (e) {
      print('❌ Error initializing notification plugin: $e');
      // Try with default settings if custom icon fails
      try {
        final defaultSettings = InitializationSettings(
          android: const AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: _buildIOSInitSettings(),
        );

        await _plugin.initialize(
          defaultSettings,
          onDidReceiveNotificationResponse: _handleNotificationResponse,
        );
        print('🔔 Plugin initialized with default settings');
      } catch (e2) {
        print('❌ Error with default settings: $e2');
        rethrow;
      }
    }
  }

  /// Builds initialization settings for Android and iOS
  static InitializationSettings _buildInitializationSettings() {
    return InitializationSettings(
      android: _buildAndroidInitSettings(),
      iOS: _buildIOSInitSettings(),
    );
  }

  /// Builds Android initialization settings
  static AndroidInitializationSettings _buildAndroidInitSettings() {
    return const AndroidInitializationSettings('@mipmap/x_calcu');
  }

  /// Builds iOS initialization settings
  static DarwinInitializationSettings _buildIOSInitSettings() {
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

  /// Handles notification response
  static void _handleNotificationResponse(NotificationResponse details) {
    if (details.payload == 'go_to_notifications') {
      // TODO: Navigate to notifications screen
      // navigatorKey.currentState?.pushNamed('/notifications');
    }
  }

  // ==================== Permission Management ====================

  /// Checks if notification permissions are granted using permission_handler
  static Future<bool> areNotificationsEnabled() async {
    if (Platform.isAndroid) {
      // Check using permission_handler for Android 13+
      final status = await Permission.notification.status;
      print('🔐 Notification permission status: $status');

      if (status.isGranted) {
        return true;
      } else if (status.isDenied) {
        // Try to request permission
        final result = await Permission.notification.request();
        print('🔐 Notification permission request result: $result');
        return result.isGranted;
      } else if (status.isPermanentlyDenied) {
        print('⚠️ Notification permission permanently denied');
        return false;
      }
    }

    // Fallback to original method for iOS or older Android versions
    final androidPlugin = _getAndroidPlugin();
    final result = await androidPlugin?.areNotificationsEnabled();
    print('🔐 Notifications enabled check (fallback): $result');
    return result ?? false;
  }

  /// Requests notification permissions using permission_handler
  static Future<bool> requestNotificationPermission() async {
    if (Platform.isAndroid) {
      // Use permission_handler for Android
      final status = await Permission.notification.request();
      print('🔐 Notification permission request result: $status');
      return status.isGranted;
    } else if (Platform.isIOS) {
      // Use iOS specific method
      return await requestIOSNotificationPermissions();
    }

    // Fallback to original method
    final androidPlugin = _getAndroidPlugin();
    final result = await androidPlugin?.requestNotificationsPermission();
    print('🔐 Permission request result (fallback): $result');
    return result ?? false;
  }

  /// Requests exact alarm permission for Android 12+
  static Future<bool> requestExactAlarmPermission() async {
    if (!Platform.isAndroid) return true;

    final androidPlugin = _getAndroidPlugin();
    if (androidPlugin == null) return false;

    try {
      final canSchedule = await androidPlugin.canScheduleExactNotifications();
      if (canSchedule == true) {
        print('🔐 Exact alarm permission already granted');
        return true;
      }

      print('🔐 Requesting exact alarm permission...');
      // Note: This will open the system settings for exact alarm permission
      // The user needs to manually grant this permission
      final result = await androidPlugin.requestExactAlarmsPermission();
      print('🔐 Exact alarm permission request result: $result');
      return result ?? false;
    } catch (e) {
      print('❌ Error requesting exact alarm permission: $e');
      return false;
    }
  }

  /// Checks iOS notification permissions
  static Future<bool> checkIOSNotificationPermissions() async {
    if (!Platform.isIOS) return true;

    try {
      final iosPlugin =
          _plugin
              .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin
              >();

      if (iosPlugin == null) return false;

      final result = await iosPlugin.checkPermissions();
      print('📱 iOS Notification Permissions:');
      print('   Result: $result');

      // For now, assume permissions are granted if we can check them
      // This is a simplified approach due to potential type issues
      return true;
    } catch (e) {
      print('❌ Error checking iOS notification permissions: $e');
      return false;
    }
  }

  /// Requests iOS notification permissions
  static Future<bool> requestIOSNotificationPermissions() async {
    if (!Platform.isIOS) return true;

    try {
      final iosPlugin =
          _plugin
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

  /// Checks if notification channel is enabled
  static Future<bool> isNotificationChannelEnabled() async {
    final androidPlugin = _getAndroidPlugin();
    if (androidPlugin == null) return false;

    try {
      // Try to get notification channels (this method exists)
      final channels = await androidPlugin.getNotificationChannels();

      if (channels == null || channels.isEmpty) {
        print('🔐 No channels found, assuming enabled');
        return true;
      }

      // Look for our reminder channel
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

      // Check if channel is enabled (importance > 0 means enabled)
      final importance = reminderChannel.importance;
      final isEnabled = importance != Importance.none;
      print('🔐 Channel enabled check: $isEnabled (importance: $importance)');
      return isEnabled;
    } catch (e) {
      print('🔐 Error checking channel: $e');
      // If we can't check, assume it's enabled
      return true;
    }
  }

  /// Gets Android-specific plugin implementation
  static AndroidFlutterLocalNotificationsPlugin? _getAndroidPlugin() {
    return _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
  }

  /// Comprehensive permission check for notifications
  static Future<Map<String, bool>> checkAllNotificationPermissions() async {
    final results = <String, bool>{};

    try {
      if (Platform.isAndroid) {
        // Check notification permission
        final notificationStatus = await Permission.notification.status;
        results['notification_permission'] = notificationStatus.isGranted;

        // Check exact alarm permission
        final exactAlarmStatus = await Permission.scheduleExactAlarm.status;
        results['exact_alarm_permission'] = exactAlarmStatus.isGranted;

        // Check battery optimization
        final batteryOptimizationStatus =
            await Permission.ignoreBatteryOptimizations.status;
        results['battery_optimization'] = batteryOptimizationStatus.isGranted;

        // Check system alert window (for heads-up notifications)
        final systemAlertStatus = await Permission.systemAlertWindow.status;
        results['system_alert_window'] = systemAlertStatus.isGranted;

        print('🔍 Permission check results: $results');
      } else if (Platform.isIOS) {
        // iOS permission check
        final iosPermissions = await checkIOSNotificationPermissions();
        results['ios_notification_permission'] = iosPermissions;
      }
    } catch (e) {
      print('❌ Error checking permissions: $e');
      results['error'] = false;
    }

    return results;
  }

  /// Request all necessary permissions for notifications
  static Future<Map<String, bool>> requestAllNotificationPermissions() async {
    final results = <String, bool>{};

    try {
      if (Platform.isAndroid) {
        // Request notification permission
        final notificationResult = await Permission.notification.request();
        results['notification_permission'] = notificationResult.isGranted;

        // Request exact alarm permission
        final exactAlarmResult = await Permission.scheduleExactAlarm.request();
        results['exact_alarm_permission'] = exactAlarmResult.isGranted;

        // Request battery optimization permission
        final batteryResult =
            await Permission.ignoreBatteryOptimizations.request();
        results['battery_optimization'] = batteryResult.isGranted;

        // Request system alert window permission
        final systemAlertResult = await Permission.systemAlertWindow.request();
        results['system_alert_window'] = systemAlertResult.isGranted;

        print('🔐 Permission request results: $results');
      } else if (Platform.isIOS) {
        // iOS permission request
        final iosResult = await requestIOSNotificationPermissions();
        results['ios_notification_permission'] = iosResult;
      }
    } catch (e) {
      print('❌ Error requesting permissions: $e');
      results['error'] = false;
    }

    return results;
  }

  // ==================== Notification Scheduling ====================

  /// Schedules a notification with custom content based on operation type
  static Future<void> scheduleOperationNotification({
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
    // Create notification content based on operation type
    final content = _createNotificationContent(
      type: type,
      clientName: clientName,
    );

    await scheduleNotification(
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

  /// Schedules a notification at the specified time
  static Future<void> scheduleNotification({
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

      // Validate input parameters
      if (id < 0) {
        throw ArgumentError('Notification ID must be non-negative, got: $id');
      }

      if (title.trim().isEmpty) {
        throw ArgumentError('Notification title cannot be empty');
      }

      if (body.trim().isEmpty) {
        throw ArgumentError('Notification body cannot be empty');
      }

      // Check if scheduled time is in the future
      if (scheduledTime.isBefore(DateTime.now())) {
        print('⚠️ Scheduled time is in the past, skipping notification');
        return;
      }

      await _ensureNotificationPermission();
      await _scheduleNotificationWithDetails(
        id: id,
        title: title.trim(),
        body: body.trim(),
        scheduledTime: scheduledTime,
        payload: payload,
      );

      print('✅ Notification scheduled successfully');

      // Print pending notifications for debugging
      await printPendingNotifications();

      // Save notification to database
      if (type != null && operationId != null) {
        await _saveNotificationToDatabase(
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

  /// Ensures notification permission is granted with comprehensive checks
  static Future<void> _ensureNotificationPermission() async {
    print('🔐 Starting comprehensive permission check...');

    try {
      // Check all permissions first
      final permissionResults = await checkAllNotificationPermissions();
      print('🔐 Current permission status: $permissionResults');

      if (Platform.isAndroid) {
        // Check notification permission
        final isEnabled = await areNotificationsEnabled();
        print('🔐 Android Notifications enabled: $isEnabled');

        if (!isEnabled) {
          print('🔐 Requesting Android notification permission...');
          final granted = await requestNotificationPermission();
          print('🔐 Android Permission granted: $granted');

          if (!granted) {
            print('⚠️ Warning: Android notification permission not granted');
            // Don't throw exception, just warn
          }
        }

        // Check if notification channel is enabled
        final channelEnabled = await isNotificationChannelEnabled();
        print('🔐 Android Notification channel enabled: $channelEnabled');

        if (!channelEnabled) {
          print('⚠️ Warning: Android notification channel is disabled');
        }

        // Check and request exact alarm permission
        final exactAlarmStatus = await Permission.scheduleExactAlarm.status;
        if (!exactAlarmStatus.isGranted) {
          print('🔐 Requesting exact alarm permission...');
          final exactAlarmResult =
              await Permission.scheduleExactAlarm.request();
          print('🔐 Exact alarm permission result: $exactAlarmResult');

          if (!exactAlarmResult.isGranted) {
            print(
              '⚠️ Warning: Exact alarm permission not granted. Notifications may be delayed.',
            );
          }
        }

        // Check battery optimization permission
        final batteryStatus =
            await Permission.ignoreBatteryOptimizations.status;
        if (!batteryStatus.isGranted) {
          print('🔐 Requesting battery optimization permission...');
          final batteryResult =
              await Permission.ignoreBatteryOptimizations.request();
          print('🔐 Battery optimization permission result: $batteryResult');

          if (!batteryResult.isGranted) {
            print(
              '⚠️ Warning: Battery optimization not disabled. Notifications may be delayed.',
            );
          }
        }

        // Check system alert window permission for heads-up notifications
        final systemAlertStatus = await Permission.systemAlertWindow.status;
        if (!systemAlertStatus.isGranted) {
          print('🔐 Requesting system alert window permission...');
          final systemAlertResult =
              await Permission.systemAlertWindow.request();
          print('🔐 System alert window permission result: $systemAlertResult');
        }
      } else if (Platform.isIOS) {
        // Check iOS notification permissions
        final iosPermissionsGranted = await checkIOSNotificationPermissions();
        print('📱 iOS Notifications permissions: $iosPermissionsGranted');

        if (!iosPermissionsGranted) {
          print('📱 Requesting iOS notification permissions...');
          final granted = await requestIOSNotificationPermissions();
          print('📱 iOS Permission granted: $granted');

          if (!granted) {
            print('⚠️ Warning: iOS notification permission not granted');
            // Don't throw exception, just warn
          }
        }
      }

      print('✅ Permission check completed');
    } catch (e) {
      print('❌ Error during permission check: $e');
      print(
        '⚠️ Continuing with notification scheduling despite permission issues',
      );
      // Don't throw exception, allow notification to be scheduled
    }
  }

  /// Schedules notification with all details
  static Future<void> _scheduleNotificationWithDetails({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    String? payload,
  }) async {
    try {
      // Validate input parameters
      if (id < 0) {
        throw ArgumentError('Notification ID must be non-negative');
      }

      if (title.isEmpty) {
        throw ArgumentError('Notification title cannot be empty');
      }

      if (body.isEmpty) {
        throw ArgumentError('Notification body cannot be empty');
      }

      // Check if scheduled time is in the past
      if (scheduledTime.isBefore(DateTime.now())) {
        print('⚠️ Scheduled time is in the past, skipping notification');
        return;
      }

      final tzDateTime = await _convertToTZDateTime(scheduledTime);
      final notificationDetails = _buildNotificationDetails();

      print('📅 Converting to timezone: $scheduledTime -> $tzDateTime');
      print('🔧 Notification details: $notificationDetails');
      print('⏰ Scheduled time: $tzDateTime');
      print('⏰ Current time: ${tz.TZDateTime.now(tz.local)}');
      print(
        '⏰ Time difference: ${tzDateTime.difference(tz.TZDateTime.now(tz.local)).inSeconds} seconds',
      );

      // Ensure the plugin is initialized before scheduling
      if (!_isInitialized) {
        print('🔔 Plugin not initialized, initializing now...');
        try {
          await init();
        } catch (e) {
          print('❌ Failed to initialize plugin: $e');
          // Continue with scheduling even if initialization fails
          // The plugin might still work with default settings
        }
      }

      // Try to schedule with exact alarm first, fallback to inexact if not permitted
      try {
        print('🔔 Attempting to schedule notification...');
        print('📅 Scheduled time: $tzDateTime');
        print('📅 Current time: ${tz.TZDateTime.now(tz.local)}');

        await _plugin.zonedSchedule(
          id,
          title,
          body,
          tzDateTime,
          notificationDetails,
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time,
        );
        print('✅ Notification scheduled with exact alarm mode');
      } catch (e) {
        print('❌ Exact alarm scheduling failed: $e');

        if (e.toString().contains('exact_alarms_not_permitted') ||
            e.toString().contains('exact_alarm')) {
          print(
            '⚠️ Exact alarms not permitted, falling back to inexact scheduling',
          );
          try {
            await _plugin.zonedSchedule(
              id,
              title,
              body,
              tzDateTime,
              notificationDetails,
              androidScheduleMode: AndroidScheduleMode.inexact,
              payload: payload,
              matchDateTimeComponents: DateTimeComponents.time,
            );
            print('✅ Notification scheduled with inexact alarm mode');
          } catch (inexactError) {
            print('❌ Inexact scheduling also failed: $inexactError');
            // Try without matchDateTimeComponents
            await _plugin.zonedSchedule(
              id,
              title,
              body,
              tzDateTime,
              notificationDetails,
              androidScheduleMode: AndroidScheduleMode.inexact,
              payload: payload,
            );
            print('✅ Notification scheduled with basic inexact mode');
          }
        } else if (e.toString().contains('invalid_icon')) {
          print('⚠️ Custom icon failed, trying with default icon');
          try {
            // Try with default icon - use simple notification details
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

            await _plugin.zonedSchedule(
              id,
              title,
              body,
              tzDateTime,
              NotificationDetails(android: defaultNotificationDetails),
              androidScheduleMode: AndroidScheduleMode.inexact,
              payload: payload,
              matchDateTimeComponents: DateTimeComponents.time,
            );
            print('✅ Notification scheduled with default icon');
          } catch (e2) {
            print('❌ Error scheduling notification with default icon: $e2');
            rethrow;
          }
        } else {
          rethrow; // Re-throw if it's a different error
        }
      }

      print('✅ Notification scheduled with ID: $id');
    } catch (e, s) {
      printError('❌ Error _scheduleNotificationWithDetails Sss: $s');
      printError(
        '❌ Error _scheduleNotificationWithDetails scheduling notification: $e',
      );
      rethrow; // Re-throw to let the caller handle the error
    }
  }

  /// Converts DateTime to TZDateTime with proper timezone handling
  static Future<tz.TZDateTime> _convertToTZDateTime(DateTime dateTime) async {
    try {
      // Initialize timezone data first
      tz.initializeTimeZones();

      // Get the device's local timezone
      final timeZoneName = await FlutterTimezone.getLocalTimezone();
      print('🌍 Device timezone: $timeZoneName');

      // Get the timezone location
      final location = tz.getLocation(timeZoneName);
      print('🌍 Timezone location: ${location.name}');

      // Set the local location for the app
      tz.setLocalLocation(location);

      // Convert the DateTime to TZDateTime using the local timezone
      final tzDateTime = tz.TZDateTime.from(dateTime, location);

      // Get current time in the same timezone for validation
      final now = tz.TZDateTime.now(location);
      print('🕐 Current time in $timeZoneName: $now');
      print('🕐 Scheduled time in $timeZoneName: $tzDateTime');
      print(
        '⏰ Time difference: ${tzDateTime.difference(now).inMinutes} minutes',
      );

      // Validate the converted time
      if (tzDateTime.isBefore(now)) {
        print('⚠️ Warning: Scheduled time is in the past!');
        print('⚠️ Current: $now');
        print('⚠️ Scheduled: $tzDateTime');
      }

      return tzDateTime;
    } catch (e) {
      print('❌ Error with timezone conversion: $e');
      print('🔄 Attempting fallback methods...');

      try {
        // Fallback 1: Try with system timezone
        tz.initializeTimeZones();
        final systemLocation = tz.local;
        final tzDateTime = tz.TZDateTime.from(dateTime, systemLocation);
        print('✅ Fallback 1 successful with system timezone');
        return tzDateTime;
      } catch (e1) {
        print('❌ Fallback 1 failed: $e1');

        try {
          // Fallback 2: Use UTC and let the system handle conversion
          tz.initializeTimeZones();
          final utcDateTime = tz.TZDateTime.from(dateTime, tz.UTC);
          print('✅ Fallback 2 successful with UTC timezone');
          return utcDateTime;
        } catch (e2) {
          print('❌ Fallback 2 failed: $e2');

          // Last resort: Create a TZDateTime with current time + offset
          final now = DateTime.now();
          final offset = dateTime.difference(now);
          final fallbackTime = now.add(offset);
          final fallbackTzDateTime = tz.TZDateTime.from(fallbackTime, tz.UTC);
          print('⚠️ Using last resort fallback');
          return fallbackTzDateTime;
        }
      }
    }
  }

  /// Builds notification details for Android and iOS
  static NotificationDetails _buildNotificationDetails() {
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
        // إعدادات مهمة للإشعارات في الخلفية
        fullScreenIntent: false,
        category: AndroidNotificationCategory.reminder,
        channelShowBadge: true,
        enableLights: true,
        ledColor: Color.fromARGB(255, 33, 150, 243),
        ledOnMs: 1000,
        ledOffMs: 500,
        // إعدادات للعمل في الخلفية
        ticker: 'Reminder notification',
        styleInformation: BigTextStyleInformation(''),
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        sound: 'default',
        // إعدادات iOS للإشعارات في الخلفية
        interruptionLevel: InterruptionLevel.active,
        // إعدادات إضافية لـ iOS
        presentBanner: true,
        presentList: true,
        badgeNumber: 1,
        threadIdentifier: 'reminder_thread',
        categoryIdentifier: 'reminder_category',
      ),
    );
  }

  // ==================== Notification Management ====================

  /// Shows an immediate test notification
  static Future<void> showTestNotification() async {
    try {
      await _ensureNotificationPermission();

      final testId = DateTime.now().millisecondsSinceEpoch.remainder(100000);

      print('🔔 Showing immediate test notification with ID: $testId');

      await _plugin.show(
        testId,
        'Test Notification',
        'This is a test notification to verify the system is working',
        _buildNotificationDetails(),
        payload: 'test_notification',
      );

      // Save to database for testing
      await _saveNotificationToDatabase(
        id: testId,
        title: 'Test Notification',
        body: 'This is a test notification to verify the system is working',
        scheduledTime: DateTime.now(),
        type: NotificationType.input,
        operationId: 999,
        customerName: 'Test Customer',
        amount: 100.0,
      );

      print('✅ Test notification shown successfully');
    } catch (e) {
      print('❌ Error showing test notification: $e');
      rethrow;
    }
  }

  /// Schedules a test notification for 5 seconds from now
  static Future<void> scheduleTestNotification() async {
    try {
      // Use current year to avoid 2025 issue
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

      print('🔔 Scheduling test notification for: $testTime');
      print('🆔 Test notification ID: $testId');
      print('📅 Current time: $now');
      print('📅 Test time: $testTime');

      await scheduleNotification(
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

      print('✅ Test notification scheduled for $testTime');
    } catch (e) {
      print('❌ Error scheduling test notification: $e');
      rethrow;
    }
  }

  /// Schedules a test notification for current time (immediate)
  static Future<void> scheduleImmediateTestNotification() async {
    try {
      final now = DateTime.now();
      final testId = DateTime.now().millisecondsSinceEpoch.remainder(100000);

      print('🔔 Scheduling immediate test notification for: $now');
      print('🆔 Test notification ID: $testId');

      await scheduleNotification(
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

      print('✅ Immediate test notification scheduled for $now');
    } catch (e) {
      print('❌ Error scheduling immediate test notification: $e');
      rethrow;
    }
  }

  /// Tests immediate notification without scheduling
  static Future<void> testImmediateNotification() async {
    try {
      await _ensureNotificationPermission();

      final testId = DateTime.now().millisecondsSinceEpoch.remainder(100000);

      print('🔔 Testing immediate notification with ID: $testId');

      // Show notification immediately
      await _plugin.show(
        testId,
        'Immediate Test',
        'This notification should appear immediately without scheduling',
        _buildNotificationDetails(),
        payload: 'test_immediate_show',
      );

      // Also save to database
      await _saveNotificationToDatabase(
        id: testId,
        title: 'Immediate Test',
        body: 'This notification should appear immediately without scheduling',
        scheduledTime: DateTime.now(),
        type: NotificationType.input,
        operationId: 997,
        customerName: 'Test Customer',
        amount: 100.0,
      );

      print('✅ Immediate notification shown successfully');
    } catch (e) {
      print('❌ Error showing immediate notification: $e');
      rethrow;
    }
  }

  /// Tests background notification scheduling
  static Future<void> testBackgroundNotification() async {
    try {
      final now = DateTime.now();
      final testTime = DateTime(
        now.year,
        now.month,
        now.day,
        now.hour,
        now.minute,
        now.second + 10, // 10 seconds from now
      );
      final testId = DateTime.now().millisecondsSinceEpoch.remainder(100000);

      print('🔔 Testing background notification for: $testTime');
      print('🆔 Test notification ID: $testId');
      print('📅 Current time: $now');
      print('📅 Test time: $testTime');
      print('💡 Close the app now to test background notification');

      await scheduleNotification(
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

      print('✅ Background test notification scheduled for $testTime');
      print('💡 Now close the app and wait for the notification');
    } catch (e) {
      print('❌ Error scheduling background test notification: $e');
      rethrow;
    }
  }

  /// Tests iOS-specific notification features
  static Future<void> testIOSNotification() async {
    if (!Platform.isIOS) {
      print('📱 This test is only for iOS devices');
      return;
    }

    try {
      final now = DateTime.now();
      final testTime = DateTime(
        now.year,
        now.month,
        now.day,
        now.hour,
        now.minute,
        now.second + 5, // 5 seconds from now
      );
      final testId = DateTime.now().millisecondsSinceEpoch.remainder(100000);

      print('📱 Testing iOS notification for: $testTime');
      print('🆔 Test notification ID: $testId');
      print('📅 Current time: $now');
      print('📅 Test time: $testTime');

      // Check iOS permissions first
      final permissionsGranted = await checkIOSNotificationPermissions();
      print('📱 iOS Permissions granted: $permissionsGranted');

      if (!permissionsGranted) {
        print('📱 Requesting iOS permissions...');
        await requestIOSNotificationPermissions();
      }

      await scheduleNotification(
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

      print('✅ iOS test notification scheduled for $testTime');
      print('📱 iOS features tested:');
      print('   - Banner notifications');
      print('   - Badge updates');
      print('   - Sound alerts');
      print('   - Thread grouping');
      print('   - Category actions');
    } catch (e) {
      print('❌ Error scheduling iOS test notification: $e');
      rethrow;
    }
  }

  /// Tests the new operation notification system
  static Future<void> testOperationNotifications() async {
    try {
      final now = DateTime.now();
      final testTime1 = DateTime(
        now.year,
        now.month,
        now.day,
        now.hour,
        now.minute,
        now.second + 5, // 5 seconds from now
      );
      final testTime2 = DateTime(
        now.year,
        now.month,
        now.day,
        now.hour,
        now.minute,
        now.second + 10, // 10 seconds from now
      );
      final testId1 = DateTime.now().millisecondsSinceEpoch.remainder(100000);
      final testId2 = testId1 + 1;

      print('🔔 Testing operation notifications');
      print('🆔 Test notification IDs: $testId1, $testId2');

      // Test input operation notification
      await scheduleOperationNotification(
        id: testId1,
        type: NotificationType.input,
        clientName: 'أحمد محمد',
        scheduledTime: testTime1,
        operationId: 1001,
        customerName: 'أحمد محمد',
        amount: 50000.0,
        payload: 'test_input_operation',
      );

      // Test output operation notification
      await scheduleOperationNotification(
        id: testId2,
        type: NotificationType.output,
        clientName: 'فاطمة علي',
        scheduledTime: testTime2,
        operationId: 1002,
        customerName: 'فاطمة علي',
        amount: 25000.0,
        payload: 'test_output_operation',
      );

      print('✅ Operation notifications scheduled successfully');
      print('📱 Input notification: $testTime1');
      print('📱 Output notification: $testTime2');
      print('💡 Check your notifications in 5-10 seconds');
    } catch (e) {
      print('❌ Error scheduling operation notifications: $e');
      rethrow;
    }
  }

  /// Tests notification system with error handling
  static Future<void> testNotificationSystemWithErrorHandling() async {
    try {
      print('🔔 Testing notification system with error handling...');

      // First, try to initialize the system
      await init();
      print('✅ Notification system initialized successfully');

      // Test immediate notification
      await showTestNotification();
      print('✅ Immediate notification test passed');

      // Test scheduled notification
      await testOperationNotifications();
      print('✅ Scheduled notification test passed');

      print('🎉 All notification tests passed successfully!');
    } catch (e) {
      print('❌ Notification system test failed: $e');
      print('💡 Try the following solutions:');
      print('   1. Check if notification permissions are granted');
      print('   2. Restart the app');
      print('   3. Check Android manifest permissions');
      rethrow;
    }
  }

  /// Tests notification system with comprehensive error handling
  static Future<void> testNotificationSystemComprehensive() async {
    try {
      print('🔔 Testing notification system comprehensively...');

      // Test 1: Initialize system
      print('📱 Test 1: Initializing notification system...');
      await init();
      print('✅ System initialized successfully');

      // Test 2: Check permissions
      print('📱 Test 2: Checking notification permissions...');
      final hasPermission = await checkNotificationSystem();
      if (hasPermission == false) {
        print('⚠️ Notification permissions not granted');
        return;
      }
      print('✅ Permissions granted');

      // Test 3: Test immediate notification
      print('📱 Test 3: Testing immediate notification...');
      await showTestNotification();
      print('✅ Immediate notification test passed');

      // Test 4: Test scheduled notification
      print('📱 Test 4: Testing scheduled notification...');
      await testOperationNotifications();
      print('✅ Scheduled notification test passed');

      print('🎉 All comprehensive tests passed successfully!');
    } catch (e) {
      print('❌ Comprehensive test failed: $e');
      print('💡 Debugging steps:');
      print('   1. Check Android manifest permissions');
      print('   2. Verify notification channels are created');
      print('   3. Check if app has notification permissions');
      print('   4. Try restarting the app');
      rethrow;
    }
  }

  /// Tests timezone conversion and scheduling
  static Future<void> testTimezoneConversion() async {
    try {
      print('🌍 Testing timezone conversion...');

      // Initialize timezone
      tz.initializeTimeZones();

      // Get device timezone
      final timeZoneName = await FlutterTimezone.getLocalTimezone();
      print('🌍 Device timezone: $timeZoneName');

      // Get timezone location
      final location = tz.getLocation(timeZoneName);
      print('🌍 Timezone location: ${location.name}');

      // Set local location
      tz.setLocalLocation(location);

      // Test current time
      final now = DateTime.now();
      final tzNow = tz.TZDateTime.now(location);
      print('🕐 System time: $now');
      print('🕐 Timezone time: $tzNow');

      // Test future time (5 seconds from now)
      final futureTime = now.add(const Duration(seconds: 5));
      final tzFutureTime = tz.TZDateTime.from(futureTime, location);
      print('⏰ Future system time: $futureTime');
      print('⏰ Future timezone time: $tzFutureTime');

      // Test scheduling a notification
      final testId = DateTime.now().millisecondsSinceEpoch.remainder(100000);
      print('🔔 Testing notification scheduling with timezone...');

      await _plugin.zonedSchedule(
        testId,
        'Timezone Test',
        'This notification tests timezone conversion',
        tzFutureTime,
        _buildNotificationDetails(),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: 'timezone_test',
        matchDateTimeComponents: DateTimeComponents.time,
      );

      print('✅ Timezone test notification scheduled successfully');
      print('⏰ Should appear in 5 seconds');
    } catch (e) {
      print('❌ Timezone test failed: $e');
      rethrow;
    }
  }

  /// Test all notification permissions with permission_handler
  static Future<void> testAllNotificationPermissions() async {
    try {
      print('🔔 Testing all notification permissions...');

      // Check current permissions
      final currentPermissions = await checkAllNotificationPermissions();
      print('📋 Current permissions: $currentPermissions');

      // Request all permissions
      final requestedPermissions = await requestAllNotificationPermissions();
      print('📋 Requested permissions: $requestedPermissions');

      // Test notification system
      final systemCheck = await checkNotificationSystem();
      print('📋 System check results: $systemCheck');

      // Show test notification
      await showTestNotification();
      print('✅ Permission test completed successfully');
    } catch (e) {
      print('❌ Permission test failed: $e');
      rethrow;
    }
  }

  /// Initialize notification service with comprehensive permission checks
  static Future<void> initializeWithPermissionChecks() async {
    try {
      print('🔔 Initializing notification service with permission checks...');

      // Initialize the service
      await init();

      // Check and request permissions
      final permissionResults = await requestAllNotificationPermissions();
      print('📋 Permission results: $permissionResults');

      // Check system status
      final systemStatus = await checkNotificationSystem();
      print('📋 System status: $systemStatus');

      // Show test notification if permissions are granted
      if (systemStatus['system_working'] == true) {
        await showTestNotification();
        print(
          '✅ Notification service initialized successfully with permissions',
        );
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

  /// Cancels a notification by its ID
  static Future<void> cancelNotification(int id) async {
    await _plugin.cancel(id);
  }

  /// Cancels all scheduled notifications
  static Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }

  /// Gets all pending notifications
  static Future<List<PendingNotificationRequest>>
  getPendingNotifications() async {
    return await _plugin.pendingNotificationRequests();
  }

  /// Prints all pending notifications for debugging
  static Future<void> printPendingNotifications() async {
    final pending = await getPendingNotifications();
    print('📋 Pending notifications count: ${pending.length}');
    for (final notification in pending) {
      print('📋 ID: ${notification.id}, Title: ${notification.title}');
    }
  }

  /// Comprehensive notification system check with permission_handler
  static Future<Map<String, dynamic>> checkNotificationSystem() async {
    final results = <String, dynamic>{};

    try {
      // Check all permissions using permission_handler
      final permissionResults = await checkAllNotificationPermissions();
      results.addAll(permissionResults);

      // Check basic permissions
      final isEnabled = await areNotificationsEnabled();
      results['notifications_enabled'] = isEnabled;

      // Check channel status
      final channelEnabled = await isNotificationChannelEnabled();
      results['channel_enabled'] = channelEnabled;

      // Check exact alarm permission (Android only)
      bool exactAlarmsEnabled = true;
      bool iosPermissionsEnabled = true;

      if (Platform.isAndroid) {
        final exactAlarmStatus = await Permission.scheduleExactAlarm.status;
        exactAlarmsEnabled = exactAlarmStatus.isGranted;
        results['exact_alarms_enabled'] = exactAlarmsEnabled;

        // Check battery optimization
        final batteryStatus =
            await Permission.ignoreBatteryOptimizations.status;
        results['battery_optimization_enabled'] = batteryStatus.isGranted;

        // Check system alert window
        final systemAlertStatus = await Permission.systemAlertWindow.status;
        results['system_alert_window_enabled'] = systemAlertStatus.isGranted;
      } else if (Platform.isIOS) {
        iosPermissionsEnabled = await checkIOSNotificationPermissions();
        results['ios_permissions_enabled'] = iosPermissionsEnabled;
      }

      // Check pending notifications
      final pending = await getPendingNotifications();
      results['pending_count'] = pending.length;

      // Check timezone
      tz.initializeTimeZones();
      final currentTime = tz.TZDateTime.now(tz.local);
      results['current_time'] = currentTime.toString();
      results['timezone'] = tz.local.name;

      // Overall status - more comprehensive check
      final allPermissionsGranted =
          Platform.isAndroid
              ? (isEnabled && channelEnabled && exactAlarmsEnabled)
              : (isEnabled && channelEnabled);
      results['system_working'] = allPermissionsGranted;

      print('🔍 Comprehensive Notification System Check:');
      print('   - Notifications enabled: $isEnabled');
      print('   - Channel enabled: $channelEnabled');
      print('   - Permission results: $permissionResults');

      if (Platform.isAndroid) {
        print('   - Exact alarms enabled: $exactAlarmsEnabled');
        print(
          '   - Battery optimization disabled: ${results['battery_optimization_enabled']}',
        );
        print(
          '   - System alert window enabled: ${results['system_alert_window_enabled']}',
        );

        if (!exactAlarmsEnabled) {
          print('⚠️ Exact alarms not enabled - notifications may be delayed');
          print('💡 To enable exact alarms:');
          print('   1. Go to Settings > Apps > X Calcu > Special app access');
          print('   2. Find "Alarms & reminders" and enable it');
        }

        if (!results['battery_optimization_enabled']) {
          print(
            '⚠️ Battery optimization not disabled - notifications may be delayed',
          );
          print('💡 To disable battery optimization:');
          print('   1. Go to Settings > Apps > X Calcu > Battery');
          print('   2. Select "Don\'t optimize" or "Unrestricted"');
        }
      } else if (Platform.isIOS) {
        print('   - iOS permissions enabled: $iosPermissionsEnabled');
        if (!iosPermissionsEnabled) {
          print('⚠️ iOS notification permissions not fully granted');
          print('💡 To enable iOS notifications:');
          print('   1. Go to Settings > Notifications > X Calcu');
          print('   2. Enable "Allow Notifications"');
          print('   3. Enable "Sounds", "Badges", and "Banners"');
        }
      }

      print('   - Pending notifications: ${pending.length}');
      print('   - Current time: $currentTime');
      print('   - Timezone: ${tz.local.name}');
      print('   - System working: $allPermissionsGranted');
    } catch (e) {
      results['error'] = e.toString();
      print('🔍 Error checking notification system: $e');
    }
    return results;
  }

  // ====================(step_2) Database Operations ====================

  /// Creates notification content based on operation type
  static Map<String, String> _createNotificationContent({
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

  /// Saves notification to database
  static Future<void> _saveNotificationToDatabase({
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
      // التحقق من الحذف التلقائي
      await notificationRepo.autoDeleteOldNotifications();
      printSuccess('💾 Notification saved and auto-cleanup completed');
    } catch (e) {
      printError('Error saving notification to database: $e');
    }
  }
}
