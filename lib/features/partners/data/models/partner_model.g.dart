// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartnerModelImpl _$$PartnerModelImplFromJson(Map<String, dynamic> json) =>
    _$PartnerModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      totalPercentageValue: json['total_percentage_value'] as String?,
    );

Map<String, dynamic> _$$PartnerModelImplToJson(_$PartnerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'total_percentage_value': instance.totalPercentageValue,
    };
