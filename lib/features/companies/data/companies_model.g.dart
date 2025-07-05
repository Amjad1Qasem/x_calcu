// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompaniesModelImpl _$$CompaniesModelImplFromJson(Map<String, dynamic> json) =>
    _$CompaniesModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      number: json['number'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$CompaniesModelImplToJson(
  _$CompaniesModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'number': instance.number,
  'email': instance.email,
};
