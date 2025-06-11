// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SystemSettingModel _$SystemSettingModelFromJson(Map<String, dynamic> json) {
  return _SystemSettingModel.fromJson(json);
}

/// @nodoc
mixin _$SystemSettingModel {
  @JsonKey(name: 'contact_phone')
  String get contactPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'app_version')
  int get appVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'google_play_link')
  String get googlePlayLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'app_store_link')
  String get appStoreLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'support_email')
  String get supportEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_stores_for_user')
  int get maxStoresForUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'maintenance_mode')
  bool get maintenanceMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'point_for_register')
  int get pointForRegister => throw _privateConstructorUsedError;
  @JsonKey(name: 'point_for_comment')
  int get pointForComment => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_ads_duration')
  int get maxAdsDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_bonus_points')
  int get referralBonusPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'daily_login_reward')
  int get dailyLoginReward => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_favorite_jobs')
  int get maxFavoriteJobs => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_currency')
  String get defaultCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'app_maintenance_mode')
  int get appMaintenanceMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'facebook_link')
  String get facebookLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'whatsapp_number')
  String get whatsappNumber => throw _privateConstructorUsedError;

  /// Serializes this SystemSettingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SystemSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SystemSettingModelCopyWith<SystemSettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemSettingModelCopyWith<$Res> {
  factory $SystemSettingModelCopyWith(
    SystemSettingModel value,
    $Res Function(SystemSettingModel) then,
  ) = _$SystemSettingModelCopyWithImpl<$Res, SystemSettingModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'contact_phone') String contactPhone,
    @JsonKey(name: 'app_version') int appVersion,
    @JsonKey(name: 'google_play_link') String googlePlayLink,
    @JsonKey(name: 'app_store_link') String appStoreLink,
    @JsonKey(name: 'support_email') String supportEmail,
    @JsonKey(name: 'max_stores_for_user') int maxStoresForUser,
    @JsonKey(name: 'maintenance_mode') bool maintenanceMode,
    @JsonKey(name: 'point_for_register') int pointForRegister,
    @JsonKey(name: 'point_for_comment') int pointForComment,
    @JsonKey(name: 'max_ads_duration') int maxAdsDuration,
    @JsonKey(name: 'referral_bonus_points') int referralBonusPoints,
    @JsonKey(name: 'daily_login_reward') int dailyLoginReward,
    @JsonKey(name: 'max_favorite_jobs') int maxFavoriteJobs,
    @JsonKey(name: 'default_currency') String defaultCurrency,
    @JsonKey(name: 'app_maintenance_mode') int appMaintenanceMode,
    @JsonKey(name: 'facebook_link') String facebookLink,
    @JsonKey(name: 'whatsapp_number') String whatsappNumber,
  });
}

/// @nodoc
class _$SystemSettingModelCopyWithImpl<$Res, $Val extends SystemSettingModel>
    implements $SystemSettingModelCopyWith<$Res> {
  _$SystemSettingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SystemSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactPhone = null,
    Object? appVersion = null,
    Object? googlePlayLink = null,
    Object? appStoreLink = null,
    Object? supportEmail = null,
    Object? maxStoresForUser = null,
    Object? maintenanceMode = null,
    Object? pointForRegister = null,
    Object? pointForComment = null,
    Object? maxAdsDuration = null,
    Object? referralBonusPoints = null,
    Object? dailyLoginReward = null,
    Object? maxFavoriteJobs = null,
    Object? defaultCurrency = null,
    Object? appMaintenanceMode = null,
    Object? facebookLink = null,
    Object? whatsappNumber = null,
  }) {
    return _then(
      _value.copyWith(
            contactPhone:
                null == contactPhone
                    ? _value.contactPhone
                    : contactPhone // ignore: cast_nullable_to_non_nullable
                        as String,
            appVersion:
                null == appVersion
                    ? _value.appVersion
                    : appVersion // ignore: cast_nullable_to_non_nullable
                        as int,
            googlePlayLink:
                null == googlePlayLink
                    ? _value.googlePlayLink
                    : googlePlayLink // ignore: cast_nullable_to_non_nullable
                        as String,
            appStoreLink:
                null == appStoreLink
                    ? _value.appStoreLink
                    : appStoreLink // ignore: cast_nullable_to_non_nullable
                        as String,
            supportEmail:
                null == supportEmail
                    ? _value.supportEmail
                    : supportEmail // ignore: cast_nullable_to_non_nullable
                        as String,
            maxStoresForUser:
                null == maxStoresForUser
                    ? _value.maxStoresForUser
                    : maxStoresForUser // ignore: cast_nullable_to_non_nullable
                        as int,
            maintenanceMode:
                null == maintenanceMode
                    ? _value.maintenanceMode
                    : maintenanceMode // ignore: cast_nullable_to_non_nullable
                        as bool,
            pointForRegister:
                null == pointForRegister
                    ? _value.pointForRegister
                    : pointForRegister // ignore: cast_nullable_to_non_nullable
                        as int,
            pointForComment:
                null == pointForComment
                    ? _value.pointForComment
                    : pointForComment // ignore: cast_nullable_to_non_nullable
                        as int,
            maxAdsDuration:
                null == maxAdsDuration
                    ? _value.maxAdsDuration
                    : maxAdsDuration // ignore: cast_nullable_to_non_nullable
                        as int,
            referralBonusPoints:
                null == referralBonusPoints
                    ? _value.referralBonusPoints
                    : referralBonusPoints // ignore: cast_nullable_to_non_nullable
                        as int,
            dailyLoginReward:
                null == dailyLoginReward
                    ? _value.dailyLoginReward
                    : dailyLoginReward // ignore: cast_nullable_to_non_nullable
                        as int,
            maxFavoriteJobs:
                null == maxFavoriteJobs
                    ? _value.maxFavoriteJobs
                    : maxFavoriteJobs // ignore: cast_nullable_to_non_nullable
                        as int,
            defaultCurrency:
                null == defaultCurrency
                    ? _value.defaultCurrency
                    : defaultCurrency // ignore: cast_nullable_to_non_nullable
                        as String,
            appMaintenanceMode:
                null == appMaintenanceMode
                    ? _value.appMaintenanceMode
                    : appMaintenanceMode // ignore: cast_nullable_to_non_nullable
                        as int,
            facebookLink:
                null == facebookLink
                    ? _value.facebookLink
                    : facebookLink // ignore: cast_nullable_to_non_nullable
                        as String,
            whatsappNumber:
                null == whatsappNumber
                    ? _value.whatsappNumber
                    : whatsappNumber // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SystemSettingModelImplCopyWith<$Res>
    implements $SystemSettingModelCopyWith<$Res> {
  factory _$$SystemSettingModelImplCopyWith(
    _$SystemSettingModelImpl value,
    $Res Function(_$SystemSettingModelImpl) then,
  ) = __$$SystemSettingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'contact_phone') String contactPhone,
    @JsonKey(name: 'app_version') int appVersion,
    @JsonKey(name: 'google_play_link') String googlePlayLink,
    @JsonKey(name: 'app_store_link') String appStoreLink,
    @JsonKey(name: 'support_email') String supportEmail,
    @JsonKey(name: 'max_stores_for_user') int maxStoresForUser,
    @JsonKey(name: 'maintenance_mode') bool maintenanceMode,
    @JsonKey(name: 'point_for_register') int pointForRegister,
    @JsonKey(name: 'point_for_comment') int pointForComment,
    @JsonKey(name: 'max_ads_duration') int maxAdsDuration,
    @JsonKey(name: 'referral_bonus_points') int referralBonusPoints,
    @JsonKey(name: 'daily_login_reward') int dailyLoginReward,
    @JsonKey(name: 'max_favorite_jobs') int maxFavoriteJobs,
    @JsonKey(name: 'default_currency') String defaultCurrency,
    @JsonKey(name: 'app_maintenance_mode') int appMaintenanceMode,
    @JsonKey(name: 'facebook_link') String facebookLink,
    @JsonKey(name: 'whatsapp_number') String whatsappNumber,
  });
}

/// @nodoc
class __$$SystemSettingModelImplCopyWithImpl<$Res>
    extends _$SystemSettingModelCopyWithImpl<$Res, _$SystemSettingModelImpl>
    implements _$$SystemSettingModelImplCopyWith<$Res> {
  __$$SystemSettingModelImplCopyWithImpl(
    _$SystemSettingModelImpl _value,
    $Res Function(_$SystemSettingModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SystemSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactPhone = null,
    Object? appVersion = null,
    Object? googlePlayLink = null,
    Object? appStoreLink = null,
    Object? supportEmail = null,
    Object? maxStoresForUser = null,
    Object? maintenanceMode = null,
    Object? pointForRegister = null,
    Object? pointForComment = null,
    Object? maxAdsDuration = null,
    Object? referralBonusPoints = null,
    Object? dailyLoginReward = null,
    Object? maxFavoriteJobs = null,
    Object? defaultCurrency = null,
    Object? appMaintenanceMode = null,
    Object? facebookLink = null,
    Object? whatsappNumber = null,
  }) {
    return _then(
      _$SystemSettingModelImpl(
        contactPhone:
            null == contactPhone
                ? _value.contactPhone
                : contactPhone // ignore: cast_nullable_to_non_nullable
                    as String,
        appVersion:
            null == appVersion
                ? _value.appVersion
                : appVersion // ignore: cast_nullable_to_non_nullable
                    as int,
        googlePlayLink:
            null == googlePlayLink
                ? _value.googlePlayLink
                : googlePlayLink // ignore: cast_nullable_to_non_nullable
                    as String,
        appStoreLink:
            null == appStoreLink
                ? _value.appStoreLink
                : appStoreLink // ignore: cast_nullable_to_non_nullable
                    as String,
        supportEmail:
            null == supportEmail
                ? _value.supportEmail
                : supportEmail // ignore: cast_nullable_to_non_nullable
                    as String,
        maxStoresForUser:
            null == maxStoresForUser
                ? _value.maxStoresForUser
                : maxStoresForUser // ignore: cast_nullable_to_non_nullable
                    as int,
        maintenanceMode:
            null == maintenanceMode
                ? _value.maintenanceMode
                : maintenanceMode // ignore: cast_nullable_to_non_nullable
                    as bool,
        pointForRegister:
            null == pointForRegister
                ? _value.pointForRegister
                : pointForRegister // ignore: cast_nullable_to_non_nullable
                    as int,
        pointForComment:
            null == pointForComment
                ? _value.pointForComment
                : pointForComment // ignore: cast_nullable_to_non_nullable
                    as int,
        maxAdsDuration:
            null == maxAdsDuration
                ? _value.maxAdsDuration
                : maxAdsDuration // ignore: cast_nullable_to_non_nullable
                    as int,
        referralBonusPoints:
            null == referralBonusPoints
                ? _value.referralBonusPoints
                : referralBonusPoints // ignore: cast_nullable_to_non_nullable
                    as int,
        dailyLoginReward:
            null == dailyLoginReward
                ? _value.dailyLoginReward
                : dailyLoginReward // ignore: cast_nullable_to_non_nullable
                    as int,
        maxFavoriteJobs:
            null == maxFavoriteJobs
                ? _value.maxFavoriteJobs
                : maxFavoriteJobs // ignore: cast_nullable_to_non_nullable
                    as int,
        defaultCurrency:
            null == defaultCurrency
                ? _value.defaultCurrency
                : defaultCurrency // ignore: cast_nullable_to_non_nullable
                    as String,
        appMaintenanceMode:
            null == appMaintenanceMode
                ? _value.appMaintenanceMode
                : appMaintenanceMode // ignore: cast_nullable_to_non_nullable
                    as int,
        facebookLink:
            null == facebookLink
                ? _value.facebookLink
                : facebookLink // ignore: cast_nullable_to_non_nullable
                    as String,
        whatsappNumber:
            null == whatsappNumber
                ? _value.whatsappNumber
                : whatsappNumber // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SystemSettingModelImpl implements _SystemSettingModel {
  const _$SystemSettingModelImpl({
    @JsonKey(name: 'contact_phone') required this.contactPhone,
    @JsonKey(name: 'app_version') required this.appVersion,
    @JsonKey(name: 'google_play_link') required this.googlePlayLink,
    @JsonKey(name: 'app_store_link') required this.appStoreLink,
    @JsonKey(name: 'support_email') required this.supportEmail,
    @JsonKey(name: 'max_stores_for_user') required this.maxStoresForUser,
    @JsonKey(name: 'maintenance_mode') required this.maintenanceMode,
    @JsonKey(name: 'point_for_register') required this.pointForRegister,
    @JsonKey(name: 'point_for_comment') required this.pointForComment,
    @JsonKey(name: 'max_ads_duration') required this.maxAdsDuration,
    @JsonKey(name: 'referral_bonus_points') required this.referralBonusPoints,
    @JsonKey(name: 'daily_login_reward') required this.dailyLoginReward,
    @JsonKey(name: 'max_favorite_jobs') required this.maxFavoriteJobs,
    @JsonKey(name: 'default_currency') required this.defaultCurrency,
    @JsonKey(name: 'app_maintenance_mode') required this.appMaintenanceMode,
    @JsonKey(name: 'facebook_link') required this.facebookLink,
    @JsonKey(name: 'whatsapp_number') required this.whatsappNumber,
  });

  factory _$SystemSettingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SystemSettingModelImplFromJson(json);

  @override
  @JsonKey(name: 'contact_phone')
  final String contactPhone;
  @override
  @JsonKey(name: 'app_version')
  final int appVersion;
  @override
  @JsonKey(name: 'google_play_link')
  final String googlePlayLink;
  @override
  @JsonKey(name: 'app_store_link')
  final String appStoreLink;
  @override
  @JsonKey(name: 'support_email')
  final String supportEmail;
  @override
  @JsonKey(name: 'max_stores_for_user')
  final int maxStoresForUser;
  @override
  @JsonKey(name: 'maintenance_mode')
  final bool maintenanceMode;
  @override
  @JsonKey(name: 'point_for_register')
  final int pointForRegister;
  @override
  @JsonKey(name: 'point_for_comment')
  final int pointForComment;
  @override
  @JsonKey(name: 'max_ads_duration')
  final int maxAdsDuration;
  @override
  @JsonKey(name: 'referral_bonus_points')
  final int referralBonusPoints;
  @override
  @JsonKey(name: 'daily_login_reward')
  final int dailyLoginReward;
  @override
  @JsonKey(name: 'max_favorite_jobs')
  final int maxFavoriteJobs;
  @override
  @JsonKey(name: 'default_currency')
  final String defaultCurrency;
  @override
  @JsonKey(name: 'app_maintenance_mode')
  final int appMaintenanceMode;
  @override
  @JsonKey(name: 'facebook_link')
  final String facebookLink;
  @override
  @JsonKey(name: 'whatsapp_number')
  final String whatsappNumber;

  @override
  String toString() {
    return 'SystemSettingModel(contactPhone: $contactPhone, appVersion: $appVersion, googlePlayLink: $googlePlayLink, appStoreLink: $appStoreLink, supportEmail: $supportEmail, maxStoresForUser: $maxStoresForUser, maintenanceMode: $maintenanceMode, pointForRegister: $pointForRegister, pointForComment: $pointForComment, maxAdsDuration: $maxAdsDuration, referralBonusPoints: $referralBonusPoints, dailyLoginReward: $dailyLoginReward, maxFavoriteJobs: $maxFavoriteJobs, defaultCurrency: $defaultCurrency, appMaintenanceMode: $appMaintenanceMode, facebookLink: $facebookLink, whatsappNumber: $whatsappNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemSettingModelImpl &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.googlePlayLink, googlePlayLink) ||
                other.googlePlayLink == googlePlayLink) &&
            (identical(other.appStoreLink, appStoreLink) ||
                other.appStoreLink == appStoreLink) &&
            (identical(other.supportEmail, supportEmail) ||
                other.supportEmail == supportEmail) &&
            (identical(other.maxStoresForUser, maxStoresForUser) ||
                other.maxStoresForUser == maxStoresForUser) &&
            (identical(other.maintenanceMode, maintenanceMode) ||
                other.maintenanceMode == maintenanceMode) &&
            (identical(other.pointForRegister, pointForRegister) ||
                other.pointForRegister == pointForRegister) &&
            (identical(other.pointForComment, pointForComment) ||
                other.pointForComment == pointForComment) &&
            (identical(other.maxAdsDuration, maxAdsDuration) ||
                other.maxAdsDuration == maxAdsDuration) &&
            (identical(other.referralBonusPoints, referralBonusPoints) ||
                other.referralBonusPoints == referralBonusPoints) &&
            (identical(other.dailyLoginReward, dailyLoginReward) ||
                other.dailyLoginReward == dailyLoginReward) &&
            (identical(other.maxFavoriteJobs, maxFavoriteJobs) ||
                other.maxFavoriteJobs == maxFavoriteJobs) &&
            (identical(other.defaultCurrency, defaultCurrency) ||
                other.defaultCurrency == defaultCurrency) &&
            (identical(other.appMaintenanceMode, appMaintenanceMode) ||
                other.appMaintenanceMode == appMaintenanceMode) &&
            (identical(other.facebookLink, facebookLink) ||
                other.facebookLink == facebookLink) &&
            (identical(other.whatsappNumber, whatsappNumber) ||
                other.whatsappNumber == whatsappNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    contactPhone,
    appVersion,
    googlePlayLink,
    appStoreLink,
    supportEmail,
    maxStoresForUser,
    maintenanceMode,
    pointForRegister,
    pointForComment,
    maxAdsDuration,
    referralBonusPoints,
    dailyLoginReward,
    maxFavoriteJobs,
    defaultCurrency,
    appMaintenanceMode,
    facebookLink,
    whatsappNumber,
  );

  /// Create a copy of SystemSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemSettingModelImplCopyWith<_$SystemSettingModelImpl> get copyWith =>
      __$$SystemSettingModelImplCopyWithImpl<_$SystemSettingModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SystemSettingModelImplToJson(this);
  }
}

abstract class _SystemSettingModel implements SystemSettingModel {
  const factory _SystemSettingModel({
    @JsonKey(name: 'contact_phone') required final String contactPhone,
    @JsonKey(name: 'app_version') required final int appVersion,
    @JsonKey(name: 'google_play_link') required final String googlePlayLink,
    @JsonKey(name: 'app_store_link') required final String appStoreLink,
    @JsonKey(name: 'support_email') required final String supportEmail,
    @JsonKey(name: 'max_stores_for_user') required final int maxStoresForUser,
    @JsonKey(name: 'maintenance_mode') required final bool maintenanceMode,
    @JsonKey(name: 'point_for_register') required final int pointForRegister,
    @JsonKey(name: 'point_for_comment') required final int pointForComment,
    @JsonKey(name: 'max_ads_duration') required final int maxAdsDuration,
    @JsonKey(name: 'referral_bonus_points')
    required final int referralBonusPoints,
    @JsonKey(name: 'daily_login_reward') required final int dailyLoginReward,
    @JsonKey(name: 'max_favorite_jobs') required final int maxFavoriteJobs,
    @JsonKey(name: 'default_currency') required final String defaultCurrency,
    @JsonKey(name: 'app_maintenance_mode')
    required final int appMaintenanceMode,
    @JsonKey(name: 'facebook_link') required final String facebookLink,
    @JsonKey(name: 'whatsapp_number') required final String whatsappNumber,
  }) = _$SystemSettingModelImpl;

  factory _SystemSettingModel.fromJson(Map<String, dynamic> json) =
      _$SystemSettingModelImpl.fromJson;

  @override
  @JsonKey(name: 'contact_phone')
  String get contactPhone;
  @override
  @JsonKey(name: 'app_version')
  int get appVersion;
  @override
  @JsonKey(name: 'google_play_link')
  String get googlePlayLink;
  @override
  @JsonKey(name: 'app_store_link')
  String get appStoreLink;
  @override
  @JsonKey(name: 'support_email')
  String get supportEmail;
  @override
  @JsonKey(name: 'max_stores_for_user')
  int get maxStoresForUser;
  @override
  @JsonKey(name: 'maintenance_mode')
  bool get maintenanceMode;
  @override
  @JsonKey(name: 'point_for_register')
  int get pointForRegister;
  @override
  @JsonKey(name: 'point_for_comment')
  int get pointForComment;
  @override
  @JsonKey(name: 'max_ads_duration')
  int get maxAdsDuration;
  @override
  @JsonKey(name: 'referral_bonus_points')
  int get referralBonusPoints;
  @override
  @JsonKey(name: 'daily_login_reward')
  int get dailyLoginReward;
  @override
  @JsonKey(name: 'max_favorite_jobs')
  int get maxFavoriteJobs;
  @override
  @JsonKey(name: 'default_currency')
  String get defaultCurrency;
  @override
  @JsonKey(name: 'app_maintenance_mode')
  int get appMaintenanceMode;
  @override
  @JsonKey(name: 'facebook_link')
  String get facebookLink;
  @override
  @JsonKey(name: 'whatsapp_number')
  String get whatsappNumber;

  /// Create a copy of SystemSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SystemSettingModelImplCopyWith<_$SystemSettingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
