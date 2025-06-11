// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SystemSettingModelImpl _$$SystemSettingModelImplFromJson(
  Map<String, dynamic> json,
) => _$SystemSettingModelImpl(
  contactPhone: json['contact_phone'] as String,
  appVersion: (json['app_version'] as num).toInt(),
  googlePlayLink: json['google_play_link'] as String,
  appStoreLink: json['app_store_link'] as String,
  supportEmail: json['support_email'] as String,
  maxStoresForUser: (json['max_stores_for_user'] as num).toInt(),
  maintenanceMode: json['maintenance_mode'] as bool,
  pointForRegister: (json['point_for_register'] as num).toInt(),
  pointForComment: (json['point_for_comment'] as num).toInt(),
  maxAdsDuration: (json['max_ads_duration'] as num).toInt(),
  referralBonusPoints: (json['referral_bonus_points'] as num).toInt(),
  dailyLoginReward: (json['daily_login_reward'] as num).toInt(),
  maxFavoriteJobs: (json['max_favorite_jobs'] as num).toInt(),
  defaultCurrency: json['default_currency'] as String,
  appMaintenanceMode: (json['app_maintenance_mode'] as num).toInt(),
  facebookLink: json['facebook_link'] as String,
  whatsappNumber: json['whatsapp_number'] as String,
);

Map<String, dynamic> _$$SystemSettingModelImplToJson(
  _$SystemSettingModelImpl instance,
) => <String, dynamic>{
  'contact_phone': instance.contactPhone,
  'app_version': instance.appVersion,
  'google_play_link': instance.googlePlayLink,
  'app_store_link': instance.appStoreLink,
  'support_email': instance.supportEmail,
  'max_stores_for_user': instance.maxStoresForUser,
  'maintenance_mode': instance.maintenanceMode,
  'point_for_register': instance.pointForRegister,
  'point_for_comment': instance.pointForComment,
  'max_ads_duration': instance.maxAdsDuration,
  'referral_bonus_points': instance.referralBonusPoints,
  'daily_login_reward': instance.dailyLoginReward,
  'max_favorite_jobs': instance.maxFavoriteJobs,
  'default_currency': instance.defaultCurrency,
  'app_maintenance_mode': instance.appMaintenanceMode,
  'facebook_link': instance.facebookLink,
  'whatsapp_number': instance.whatsappNumber,
};
