// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationsModelImpl _$$NotificationsModelImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationsModelImpl(
  title: json['title'] as String?,
  message: json['message'] as String?,
  date: json['date'] as String?,
  isRead: json['isRead'] as bool?,
  type: $enumDecode(_$NotificationsTypeEnumMap, json['type']),
);

Map<String, dynamic> _$$NotificationsModelImplToJson(
  _$NotificationsModelImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'message': instance.message,
  'date': instance.date,
  'isRead': instance.isRead,
  'type': _$NotificationsTypeEnumMap[instance.type]!,
};

const _$NotificationsTypeEnumMap = {
  NotificationsType.input: 'input',
  NotificationsType.outPut: 'outPut',
};
