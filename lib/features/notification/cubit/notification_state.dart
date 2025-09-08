part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;

  const factory NotificationState.loading() = Loading;

  const factory NotificationState.loaded({
    required List<NotificationModel> notifications,
  }) = Loaded;

  const factory NotificationState.error({required String message}) = Error;
}
