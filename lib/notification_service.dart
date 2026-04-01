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

part 'notification_service/notification_service_init.dart';
part 'notification_service/notification_service_permissions.dart';
part 'notification_service/notification_service_scheduling.dart';
part 'notification_service/notification_service_testing.dart';

/// Service for managing local notifications
class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  static bool _isInitialized = false;

  static Future<void> init() => _nsInit();

  static Future<bool> areNotificationsEnabled() => _nsAreNotificationsEnabled();
  static Future<bool> requestNotificationPermission() =>
      _nsRequestNotificationPermission();
  static Future<bool> requestExactAlarmPermission() =>
      _nsRequestExactAlarmPermission();
  static Future<bool> checkIOSNotificationPermissions() =>
      _nsCheckIOSNotificationPermissions();
  static Future<bool> requestIOSNotificationPermissions() =>
      _nsRequestIOSNotificationPermissions();
  static Future<bool> isNotificationChannelEnabled() =>
      _nsIsNotificationChannelEnabled();
  static Future<Map<String, bool>> checkAllNotificationPermissions() =>
      _nsCheckAllNotificationPermissions();
  static Future<Map<String, bool>> requestAllNotificationPermissions() =>
      _nsRequestAllNotificationPermissions();
  static Future<void> initializeWithPermissionChecks() =>
      _nsInitializeWithPermissionChecks();

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
  }) => _nsScheduleOperationNotification(
    id: id,
    type: type,
    clientName: clientName,
    scheduledTime: scheduledTime,
    operationId: operationId,
    partnerName: partnerName,
    customerName: customerName,
    amount: amount,
    payload: payload,
  );

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
  }) => _nsScheduleNotification(
    id: id,
    title: title,
    body: body,
    scheduledTime: scheduledTime,
    payload: payload,
    type: type,
    operationId: operationId,
    partnerName: partnerName,
    customerName: customerName,
    amount: amount,
  );

  static Future<void> showTestNotification() => _nsShowTestNotification();
  static Future<void> scheduleTestNotification() =>
      _nsScheduleTestNotification();
  static Future<void> scheduleImmediateTestNotification() =>
      _nsScheduleImmediateTestNotification();
  static Future<void> testImmediateNotification() =>
      _nsTestImmediateNotification();
  static Future<void> testBackgroundNotification() =>
      _nsTestBackgroundNotification();
  static Future<void> testIOSNotification() => _nsTestIOSNotification();
  static Future<void> testOperationNotifications() =>
      _nsTestOperationNotifications();
  static Future<void> testNotificationSystemWithErrorHandling() =>
      _nsTestNotificationSystemWithErrorHandling();
  static Future<void> testNotificationSystemComprehensive() =>
      _nsTestNotificationSystemComprehensive();
  static Future<void> testTimezoneConversion() => _nsTestTimezoneConversion();
  static Future<void> testAllNotificationPermissions() =>
      _nsTestAllNotificationPermissions();
  static Future<void> cancelNotification(int id) => _nsCancelNotification(id);
  static Future<void> cancelAll() => _nsCancelAll();
  static Future<List<PendingNotificationRequest>> getPendingNotifications() =>
      _nsGetPendingNotifications();
  static Future<void> printPendingNotifications() =>
      _nsPrintPendingNotifications();
  static Future<Map<String, dynamic>> checkNotificationSystem() =>
      _nsCheckNotificationSystem();
}
