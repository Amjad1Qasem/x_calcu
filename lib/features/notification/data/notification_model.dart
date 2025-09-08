import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    required DateTime createdAt,
    required NotificationType type,
    required int operationId,
    String? partnerName,
    String? customerName,
    double? amount,
    @Default(false) bool isRead,
    String? payload,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

enum NotificationType {
  @JsonValue('input')
  input,
  @JsonValue('output')
  output,
}

extension NotificationTypeExtension on NotificationType {
  String get displayName {
    switch (this) {
      case NotificationType.input:
        return 'Input Operation';
      case NotificationType.output:
        return 'Output Operation';
    }
  }

  String get localizedName {
    switch (this) {
      case NotificationType.input:
        return 'عملية دخل';
      case NotificationType.output:
        return 'عملية خرج';
    }
  }
}
