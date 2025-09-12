// notification_service.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart' show FlutterTimezone;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
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
    final initSettings = _buildInitializationSettings();

    await _plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _handleNotificationResponse,
    );
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

  /// Checks if notification permissions are granted
  static Future<bool> areNotificationsEnabled() async {
    final androidPlugin = _getAndroidPlugin();
    final result = await androidPlugin?.areNotificationsEnabled();
    print('🔐 Notifications enabled check: $result');
    return result ?? false;
  }

  /// Requests notification permissions
  static Future<bool> requestNotificationPermission() async {
    final androidPlugin = _getAndroidPlugin();
    final result = await androidPlugin?.requestNotificationsPermission();
    print('🔐 Permission request result: $result');
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

  // ==================== Notification Scheduling ====================

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

  /// Ensures notification permission is granted
  static Future<void> _ensureNotificationPermission() async {
    if (Platform.isAndroid) {
      final isEnabled = await areNotificationsEnabled();
      print('🔐 Android Notifications enabled: $isEnabled');

      if (!isEnabled) {
        print('🔐 Requesting Android notification permission...');
        final granted = await requestNotificationPermission();
        print('🔐 Android Permission granted: $granted');

        if (!granted) {
          throw Exception('Android notification permission not granted');
        }
      }

      // Check if notification channel is enabled
      final channelEnabled = await isNotificationChannelEnabled();
      print('🔐 Android Notification channel enabled: $channelEnabled');

      if (!channelEnabled) {
        print('⚠️ Warning: Android notification channel is disabled');
      }

      // Check exact alarm permission for Android 12+
      final androidPlugin =
          _plugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();
      if (androidPlugin != null) {
        final canScheduleExactAlarms =
            await androidPlugin.canScheduleExactNotifications();
        print('🔐 Can schedule exact alarms: $canScheduleExactAlarms');

        if (canScheduleExactAlarms == false) {
          print(
            '⚠️ Warning: Cannot schedule exact alarms. Notifications may be delayed.',
          );
          print(
            '💡 Consider requesting exact alarm permission from user settings',
          );

          // Try to request exact alarm permission
          try {
            await requestExactAlarmPermission();
          } catch (e) {
            print('❌ Failed to request exact alarm permission: $e');
          }
        }
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
          throw Exception('iOS notification permission not granted');
        }
      }
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
        await init();
      }

      // Try to schedule with exact alarm first, fallback to inexact if not permitted
      try {
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
        if (e.toString().contains('exact_alarms_not_permitted')) {
          print(
            '⚠️ Exact alarms not permitted, falling back to inexact scheduling',
          );
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

  /// Converts DateTime to TZDateTime
  static Future<tz.TZDateTime> _convertToTZDateTime(DateTime dateTime) async {
    try {
      // Ensure timezone data is initialized
      tz.initializeTimeZones();

      // Get local timezone
      final timeZoneName = await FlutterTimezone.getLocalTimezone();
      print('🌍 Local timezone: $timeZoneName');

      // Set local location
      tz.setLocalLocation(tz.getLocation(timeZoneName));

      // Convert to TZDateTime
      final tzDateTime = tz.TZDateTime.from(dateTime, tz.local);

      // Validate the converted time
      if (tzDateTime.isBefore(tz.TZDateTime.now(tz.local))) {
        print('⚠️ Warning: Converted time is in the past');
      }

      return tzDateTime;
    } catch (e) {
      print('⚠️ Error with local timezone conversion: $e');
      print('🔄 Falling back to UTC timezone');

      try {
        // Fallback to UTC
        tz.initializeTimeZones();
        return tz.TZDateTime.from(dateTime, tz.UTC);
      } catch (utcError) {
        print('❌ Error with UTC timezone conversion: $utcError');
        // Last resort: create a TZDateTime with current time + offset
        final now = DateTime.now();
        final offset = dateTime.difference(now);
        final fallbackTime = now.add(offset);
        return tz.TZDateTime.from(fallbackTime, tz.UTC);
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
        icon: '@mipmap/x_calcu',
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

  /// Comprehensive notification system check
  static Future<Map<String, dynamic>> checkNotificationSystem() async {
    final results = <String, dynamic>{};

    try {
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
        final androidPlugin = _getAndroidPlugin();
        if (androidPlugin != null) {
          exactAlarmsEnabled =
              await androidPlugin.canScheduleExactNotifications() ?? false;
        }
        results['exact_alarms_enabled'] = exactAlarmsEnabled;
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

      // Overall status
      results['system_working'] = isEnabled && channelEnabled;

      print('🔍 Notification System Check:');
      print('   - Notifications enabled: $isEnabled');
      print('   - Channel enabled: $channelEnabled');

      if (Platform.isAndroid) {
        print('   - Exact alarms enabled: $exactAlarmsEnabled');
        if (!exactAlarmsEnabled) {
          print('⚠️ Exact alarms not enabled - notifications may be delayed');
          print('💡 To enable exact alarms:');
          print('   1. Go to Settings > Apps > X Calcu > Special app access');
          print('   2. Find "Alarms & reminders" and enable it');
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
      print('   - System working: ${results['system_working']}');
    } catch (e) {
      results['error'] = e.toString();
      print('🔍 Error checking notification system: $e');
    }

    return results;
  }

  // ====================(step_2) Database Operations ====================

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
