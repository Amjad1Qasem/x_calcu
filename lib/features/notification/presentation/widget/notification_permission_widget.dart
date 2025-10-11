import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:x_calcu/notification_service.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class NotificationPermissionWidget extends StatefulWidget {
  final VoidCallback? onPermissionGranted;
  final VoidCallback? onPermissionDenied;

  const NotificationPermissionWidget({
    super.key,
    this.onPermissionGranted,
    this.onPermissionDenied,
  });

  @override
  State<NotificationPermissionWidget> createState() =>
      _NotificationPermissionWidgetState();
}

class _NotificationPermissionWidgetState
    extends State<NotificationPermissionWidget> {
  bool _isLoading = false;
  Map<String, bool> _permissionStatus = {};
  String _statusMessage = '';

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  /// Check current permission status
  Future<void> _checkPermissions() async {
    setState(() {
      _isLoading = true;
      _statusMessage = 'checking_permissions'.tr();
    });

    try {
      final permissions =
          await NotificationService.checkAllNotificationPermissions();
      setState(() {
        _permissionStatus = permissions.map(
          (key, value) => MapEntry(key, value),
        );
        _statusMessage = _getStatusMessage();
        _isLoading = false;
      });
    } catch (e) {
      printError('Error checking permissions: $e');
      setState(() {
        _statusMessage = 'error_checking_permissions'.tr();
        _isLoading = false;
      });
    }
  }

  /// Request all necessary permissions
  Future<void> _requestPermissions() async {
    setState(() {
      _isLoading = true;
      _statusMessage = 'requesting_permissions'.tr();
    });

    try {
      final results =
          await NotificationService.requestAllNotificationPermissions();
      setState(() {
        _permissionStatus = results.map((key, value) => MapEntry(key, value));
        _statusMessage = _getStatusMessage();
        _isLoading = false;
      });

      // Check if all critical permissions are granted
      final allGranted = _areAllCriticalPermissionsGranted();
      if (allGranted) {
        widget.onPermissionGranted?.call();
      } else {
        widget.onPermissionDenied?.call();
      }
    } catch (e) {
      printError('Error requesting permissions: $e');
      setState(() {
        _statusMessage = 'error_requesting_permissions'.tr();
        _isLoading = false;
      });
      widget.onPermissionDenied?.call();
    }
  }

  /// Check if all critical permissions are granted
  bool _areAllCriticalPermissionsGranted() {
    if (Platform.isAndroid) {
      return _permissionStatus['notification_permission'] == true &&
          _permissionStatus['exact_alarm_permission'] == true;
    } else if (Platform.isIOS) {
      return _permissionStatus['ios_notification_permission'] == true;
    }
    return false;
  }

  /// Get status message based on permission results
  String _getStatusMessage() {
    if (_permissionStatus.isEmpty) {
      return 'no_permission_data'.tr();
    }

    final allGranted = _areAllCriticalPermissionsGranted();
    if (allGranted) {
      return 'all_permissions_granted'.tr();
    } else {
      return 'some_permissions_missing'.tr();
    }
  }

  /// Open app settings
  Future<void> _openAppSettings() async {
    try {
      await openAppSettings();
    } catch (e) {
      printError('Error opening app settings: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        color: Utils(context).primaryContainer,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color:
              _areAllCriticalPermissionsGranted()
                  ? Utils(context).primary
                  : Utils(context).red,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(
                Iconsax.notification_copy,
                color:
                    _areAllCriticalPermissionsGranted()
                        ? Utils(context).primary
                        : Utils(context).red,
                size: 24.sp,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  'notification_permissions'.tr(),
                  style: Utils(context).blackBigText.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Status message
          Text(
            _statusMessage,
            style: Utils(context).normalText.copyWith(
              fontSize: 14.sp,
              color:
                  _areAllCriticalPermissionsGranted()
                      ? Utils(context).primary
                      : Utils(context).red,
            ),
          ),

          SizedBox(height: 16.h),

          // Permission details
          if (_permissionStatus.isNotEmpty) ...[
            Text(
              'permission_details'.tr(),
              style: Utils(context).normalText.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            ..._buildPermissionItems(),
            SizedBox(height: 16.h),
          ],

          // Action buttons
          Column(
            children: [
              AppButton(
                padding: EdgeInsets.zero,
                onTap: _isLoading ? null : _requestPermissions,
                label:
                    _isLoading ? 'requesting'.tr() : 'request_permissions'.tr(),

                color: Utils(context).secondTextColor,
              ),
              SizedBox(height: 12.h),
              AppButton(
                padding: EdgeInsets.zero,
                onTap: _openAppSettings,
                label: 'open_settings'.tr(),

                color: Utils(context).secondTextColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Build permission items list
  List<Widget> _buildPermissionItems() {
    final items = <Widget>[];

    if (Platform.isAndroid) {
      items.addAll([
        _buildPermissionItem(
          'notification_permission',
          'notification_permission_label'.tr(),
          'notification_permission_desc'.tr(),
        ),
        _buildPermissionItem(
          'exact_alarm_permission',
          'exact_alarm_permission_label'.tr(),
          'exact_alarm_permission_desc'.tr(),
        ),
        _buildPermissionItem(
          'battery_optimization',
          'battery_optimization_label'.tr(),
          'battery_optimization_desc'.tr(),
        ),
        _buildPermissionItem(
          'system_alert_window',
          'system_alert_window_label'.tr(),
          'system_alert_window_desc'.tr(),
        ),
      ]);
    } else if (Platform.isIOS) {
      items.add(
        _buildPermissionItem(
          'ios_notification_permission',
          'ios_notification_permission_label'.tr(),
          'ios_notification_permission_desc'.tr(),
        ),
      );
    }

    return items;
  }

  /// Build individual permission item
  Widget _buildPermissionItem(String key, String label, String description) {
    final isGranted = _permissionStatus[key] ?? false;

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color:
            isGranted
                ? Utils(context).primary.withOpacity(0.1)
                : Utils(context).red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color:
              isGranted
                  ? Utils(context).primary.withOpacity(0.3)
                  : Utils(context).red.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            isGranted ? Iconsax.tick_circle : Iconsax.close_circle,
            color: isGranted ? Utils(context).primary : Utils(context).red,
            size: 20.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Utils(context).normalText.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: Utils(context).secondText.copyWith(fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
