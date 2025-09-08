import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/notification/cubit/notification_cubit.dart';
import 'package:x_calcu/features/notification/data/notification_model.dart';
import 'package:x_calcu/features/notification/presentation/widget/notification_card_widget.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late final NotificationCubit _notificationCubit;

  @override
  void initState() {
    super.initState();
    _notificationCubit = getIt<NotificationCubit>();
    _loadNotifications();
  }

  void _loadNotifications() {
    // Always load active notifications only (those that have reached their scheduled time)
    // This ensures notifications only appear when their time has come
    _notificationCubit.loadActiveNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _notificationCubit,
      child: Skaffold(
        isAppBarNull: false,
        isBack: false,
        title: 'notification'.tr(),
        body: BlocBuilder<NotificationCubit, NotificationState>(
          bloc: _notificationCubit,
          builder: (context, state) {
            return state.when(
              initial: () => _buildLoadingWidget(),
              loading: () => _buildLoadingWidget(),
              loaded: (notifications) => _buildNotificationsList(notifications),
              error: (message) => _buildErrorWidget(message),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorWidget(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64.sp, color: Colors.red),
          CommonSizes.vSmallestSpace,
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp),
          ),
          CommonSizes.vSmallestSpace,
          ElevatedButton(
            onPressed: _loadNotifications,
            child: Text('retry'.tr()),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsList(List<NotificationModel> notifications) {
    if (notifications.isEmpty) {
      return _buildEmptyWidget();
    }

    return RefreshIndicator(
      onRefresh: () async => _loadNotifications(),
      child: ListView.separated(
        padding: EdgeInsets.only(bottom: 80.sp),
        shrinkWrap: true,
        itemCount: notifications.length,
        separatorBuilder: (context, index) => CommonSizes.vSmallestSpace,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationCardWidget(
            notification: notification,
            onTap: () => _onNotificationTap(notification),
            onMarkAsRead: () => _onMarkAsRead(notification.id),
            onDelete: () => _onDeleteNotification(notification.id),
          );
        },
      ),
    );
  }

  Widget _buildEmptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_none, size: 64.sp, color: Colors.grey),
          CommonSizes.vSmallestSpace,
          Text(
            'no_notifications'.tr(),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          CommonSizes.vSmallestSpace,
          Text(
            'no_notifications_description'.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  void _onNotificationTap(NotificationModel notification) {
    // Mark as read when tapped
    _notificationCubit.markAsRead(notification.id);

    // TODO: Navigate to operation details
    // NavigationHelper.goToOperationDetails(context, notification.operationId);
  }

  void _onMarkAsRead(int notificationId) {
    _notificationCubit.markAsRead(notificationId);
  }

  void _onDeleteNotification(int notificationId) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('delete_notification'.tr()),
            content: Text('delete_notification_confirmation'.tr()),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('cancel'.tr()),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _notificationCubit.deleteNotification(notificationId);
                },
                child: Text('delete'.tr()),
              ),
            ],
          ),
    );
  }
}
