import 'package:freezed_annotation/freezed_annotation.dart';
part 'system_setting_model.freezed.dart';
part 'system_setting_model.g.dart';

@freezed
class SystemSettingModel with _$SystemSettingModel {
  const factory SystemSettingModel({
    @JsonKey(name: 'contact_phone') required String contactPhone,
    @JsonKey(name: 'app_version') required int appVersion,
    @JsonKey(name: 'google_play_link') required String googlePlayLink,
    @JsonKey(name: 'app_store_link') required String appStoreLink,
    @JsonKey(name: 'support_email') required String supportEmail,
    @JsonKey(name: 'max_stores_for_user') required int maxStoresForUser,
    @JsonKey(name: 'maintenance_mode') required bool maintenanceMode,
    @JsonKey(name: 'point_for_register') required int pointForRegister,
    @JsonKey(name: 'point_for_comment') required int pointForComment,
    @JsonKey(name: 'max_ads_duration') required int maxAdsDuration,
    @JsonKey(name: 'referral_bonus_points') required int referralBonusPoints,
    @JsonKey(name: 'daily_login_reward') required int dailyLoginReward,
    @JsonKey(name: 'max_favorite_jobs') required int maxFavoriteJobs,
    @JsonKey(name: 'default_currency') required String defaultCurrency,
    @JsonKey(name: 'app_maintenance_mode') required int appMaintenanceMode,
    @JsonKey(name: 'facebook_link') required String facebookLink,
    @JsonKey(name: 'whatsapp_number') required String whatsappNumber,
  }) = _SystemSettingModel;

  factory SystemSettingModel.fromJson(Map<String, dynamic> json) =>
      _$SystemSettingModelFromJson(json);
}
