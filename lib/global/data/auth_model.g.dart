// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthModelImpl _$$AuthModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      token: json['token'] as String?,
      country: json['country'] as String?,
      points: (json['points'] as num?)?.toInt(),
      role: (json['role'] as List<dynamic>?)?.map((e) => e as String).toList(),
      password: json['password'] as String?,
      username: json['userName'] as String?,
      email: json['email'] as String?,
      phone: json['phone_number'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
      newPassword: json['newPassword'] as String?,
      birthDate: json['birthdate'] as String?,
      nationalty: json['nationality'] as String?,
      userDescription: json['profile_description'] as String?,
      accountViews: (json['account_views'] as num?)?.toInt(),
      followingCount: (json['following_count'] as num?)?.toInt(),
      followerCount: (json['followers_count'] as num?)?.toInt(),
      isFollowing: json['is_following'] as bool?,
      statusAccount: json['status'] as String?,
      governorate: json['city'] as String?,
      userImage: json['avatar'] as String?,
      rating: json['rating'] as String?,
      averageRating: json['average_rating'] as String?,
      ratingsCount: (json['ratings_count'] as num?)?.toInt(),
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      isVerified: json['is_verified'] as bool?,
      isCvCompleted: json['is_cv_completed'] as bool?,
      myInterest:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      adsCount: (json['ads_count'] as num?)?.toInt(),
      countryId: json['country_id'] as bool?,
      cityId: json['city_id'] as bool?,
      unseenNotifications: (json['unseen_notification'] as num?)?.toInt(),
      gender: _boolFromGender(json['gender'] as String?),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$AuthModelImplToJson(_$AuthModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'token': instance.token,
      'country': instance.country,
      'points': instance.points,
      'role': instance.role,
      'password': instance.password,
      'userName': instance.username,
      if (instance.email case final value?) 'email': value,
      'phone_number': instance.phone,
      'password_confirmation': instance.passwordConfirmation,
      if (instance.newPassword case final value?) 'newPassword': value,
      'birthdate': instance.birthDate,
      'nationality': instance.nationalty,
      'profile_description': instance.userDescription,
      'account_views': instance.accountViews,
      'following_count': instance.followingCount,
      'followers_count': instance.followerCount,
      'is_following': instance.isFollowing,
      'status': instance.statusAccount,
      'city': instance.governorate,
      'avatar': instance.userImage,
      'rating': instance.rating,
      'average_rating': instance.averageRating,
      'ratings_count': instance.ratingsCount,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'is_verified': instance.isVerified,
      'is_cv_completed': instance.isCvCompleted,
      'tags': instance.myInterest,
      'ads_count': instance.adsCount,
      'country_id': instance.countryId,
      'city_id': instance.cityId,
      'unseen_notification': instance.unseenNotifications,
      'gender': _genderFromBool(instance.gender),
      'message': instance.message,
    };

_$InterestImpl _$$InterestImplFromJson(Map<String, dynamic> json) =>
    _$InterestImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$InterestImplToJson(_$InterestImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
