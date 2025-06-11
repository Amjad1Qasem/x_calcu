// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boarding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoardingImpl _$$BoardingImplFromJson(Map<String, dynamic> json) =>
    _$BoardingImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BoardingImplToJson(_$BoardingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'order': instance.order,
    };
