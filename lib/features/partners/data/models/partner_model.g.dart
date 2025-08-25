// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartnerModelImpl _$$PartnerModelImplFromJson(Map<String, dynamic> json) =>
    _$PartnerModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      number: json['number'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$PartnerModelImplToJson(_$PartnerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'email': instance.email,
    };
