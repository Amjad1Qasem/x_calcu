// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthModelImpl _$$AuthModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      token: json['access_token'] as String?,
      username: json['userName'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$AuthModelImplToJson(_$AuthModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'access_token': instance.token,
      'userName': instance.username,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'email_verified_at': instance.emailVerifiedAt,
      'message': instance.message,
    };
