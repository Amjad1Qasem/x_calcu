import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/notification/data/notification_model.dart';
import 'package:x_calcu/features/notification/data/notification_repo.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

part 'notification_state.dart';
part 'notification_cubit.freezed.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo _notificationRepo;

  NotificationCubit(this._notificationRepo)
    : super(const NotificationState.initial());

  // ==================== Data Loading ====================

  /// Loads all notifications
  Future<void> loadNotifications() async {
    emit(const NotificationState.loading());

    try {
      final notifications = await _notificationRepo.getAllNotifications();
      emit(NotificationState.loaded(notifications: notifications));
      printSuccess('Notifications _Cubit $notifications');
    } catch (e) {
      emit(
        NotificationState.error(message: 'Failed to load notifications: $e'),
      );
    }
  }

  /// Loads active notifications (only those that have reached their scheduled time)
  Future<void> loadActiveNotifications() async {
    emit(const NotificationState.loading());

    try {
      final notifications = await _notificationRepo.getActiveNotifications();
      emit(NotificationState.loaded(notifications: notifications));
      printSuccess('Active notifications loaded: ${notifications.length}');
    } catch (e) {
      emit(
        NotificationState.error(
          message: 'Failed to load active notifications: $e',
        ),
      );
    }
  }

  /// Loads all notifications including immediate ones
  Future<void> loadAllNotificationsIncludingImmediate() async {
    emit(const NotificationState.loading());

    try {
      final notifications =
          await _notificationRepo.getAllNotificationsIncludingImmediate();
      emit(NotificationState.loaded(notifications: notifications));
      printSuccess(
        'All notifications (including immediate) loaded: ${notifications.length}',
      );
    } catch (e) {
      printError('Error loading notifications: $e');
      emit(
        NotificationState.error(
          message: 'Failed to load all notifications: $e',
        ),
      );
    }
  }

  /// Loads notifications by type
  Future<void> loadNotificationsByType(NotificationType type) async {
    emit(const NotificationState.loading());

    try {
      final notifications = await _notificationRepo.getNotificationsByType(
        type,
      );
      emit(NotificationState.loaded(notifications: notifications));
    } catch (e) {
      emit(
        NotificationState.error(message: 'Failed to load notifications: $e'),
      );
    }
  }

  /// Loads unread notifications
  Future<void> loadUnreadNotifications() async {
    emit(const NotificationState.loading());

    try {
      final notifications = await _notificationRepo.getUnreadNotifications();
      emit(NotificationState.loaded(notifications: notifications));
    } catch (e) {
      emit(
        NotificationState.error(
          message: 'Failed to load unread notifications: $e',
        ),
      );
    }
  }

  // ==================== Notification Management ====================

  /// Saves a new notification
  Future<void> saveNotification(NotificationModel notification) async {
    try {
      await _notificationRepo.saveNotification(notification);
      // Reload notifications to reflect the change
      await loadNotifications();
    } catch (e) {
      emit(NotificationState.error(message: 'Failed to save notification: $e'));
    }
  }

  /// Marks a notification as read
  Future<void> markAsRead(int notificationId) async {
    try {
      await _notificationRepo.markAsRead(notificationId);
      // Reload notifications to reflect the change
      await loadNotifications();
    } catch (e) {
      emit(
        NotificationState.error(
          message: 'Failed to mark notification as read: $e',
        ),
      );
    }
  }

  /// Marks all notifications as read
  Future<void> markAllAsRead() async {
    try {
      await _notificationRepo.markAllAsRead();
      // Reload notifications to reflect the change
      await loadNotifications();
    } catch (e) {
      emit(
        NotificationState.error(
          message: 'Failed to mark all notifications as read: $e',
        ),
      );
    }
  }

  /// Deletes a notification
  Future<void> deleteNotification(int notificationId) async {
    try {
      await _notificationRepo.deleteNotification(notificationId);
      // Reload notifications to reflect the change
      await loadNotifications();
    } catch (e) {
      emit(
        NotificationState.error(message: 'Failed to delete notification: $e'),
      );
    }
  }

  /// Deletes all notifications
  Future<void> deleteAllNotifications() async {
    try {
      await _notificationRepo.deleteAllNotifications();
      emit(const NotificationState.loaded(notifications: []));
    } catch (e) {
      emit(
        NotificationState.error(
          message: 'Failed to delete all notifications: $e',
        ),
      );
    }
  }

  /// Auto-deletes old notifications when count exceeds 15
  Future<void> autoDeleteOldNotifications() async {
    try {
      await _notificationRepo.autoDeleteOldNotifications();
      await loadActiveNotifications(); // إعادة تحميل الإشعارات النشطة
    } catch (e) {
      emit(
        NotificationState.error(
          message: 'Failed to auto-delete notifications: $e',
        ),
      );
    }
  }

  /// Debug method to check database contents
  Future<void> debugDatabaseContents() async {
    try {
      await _notificationRepo.debugDatabaseContents();
    } catch (e) {
      printError('Error debugging database: $e');
    }
  }

  /// Reset database (for debugging)
  Future<void> resetDatabase() async {
    try {
      await _notificationRepo.resetDatabase();
      printSuccess('Database reset successfully');
    } catch (e) {
      printError('Error resetting database: $e');
    }
  }

  // ==================== Statistics ====================

  /// Gets notification count
  Future<int> getNotificationCount() async {
    try {
      return await _notificationRepo.getNotificationCount();
    } catch (e) {
      return 0;
    }
  }

  /// Gets unread notification count
  Future<int> getUnreadNotificationCount() async {
    try {
      return await _notificationRepo.getUnreadNotificationCount();
    } catch (e) {
      return 0;
    }
  }

  // ==================== Filtering ====================

  /// Filters notifications by type
  void filterByType(NotificationType? type) {
    final currentState = state;
    if (currentState is Loaded) {
      if (type == null) {
        // Show all notifications
        emit(
          NotificationState.loaded(notifications: currentState.notifications),
        );
      } else {
        // Filter by type
        final filteredNotifications =
            currentState.notifications
                .where((notification) => notification.type == type)
                .toList();
        emit(NotificationState.loaded(notifications: filteredNotifications));
      }
    } else {
      // If not loaded yet, load all notifications first
      loadNotifications();
    }
  }

  /// Searches notifications
  void searchNotifications(String query) {
    final currentState = state;
    if (currentState is Loaded) {
      if (query.isEmpty) {
        // Show all notifications
        emit(
          NotificationState.loaded(notifications: currentState.notifications),
        );
      } else {
        // Search in title and body
        final searchResults =
            currentState.notifications
                .where(
                  (notification) =>
                      notification.title.toLowerCase().contains(
                        query.toLowerCase(),
                      ) ||
                      notification.body.toLowerCase().contains(
                        query.toLowerCase(),
                      ) ||
                      (notification.customerName?.toLowerCase().contains(
                            query.toLowerCase(),
                          ) ??
                          false) ||
                      (notification.partnerName?.toLowerCase().contains(
                            query.toLowerCase(),
                          ) ??
                          false),
                )
                .toList();
        emit(NotificationState.loaded(notifications: searchResults));
      }
    }
  }
}
