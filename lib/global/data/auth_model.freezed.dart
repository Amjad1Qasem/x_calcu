// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) {
  return _AuthModel.fromJson(json);
}

/// @nodoc
mixin _$AuthModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  List<String>? get role => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: "userName")
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: "email", includeIfNull: false)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "password_confirmation")
  String? get passwordConfirmation => throw _privateConstructorUsedError;
  @JsonKey(name: "newPassword", includeIfNull: false)
  String? get newPassword => throw _privateConstructorUsedError;
  @JsonKey(name: "birthdate")
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: "nationality")
  String? get nationalty => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_description")
  String? get userDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "account_views")
  int? get accountViews => throw _privateConstructorUsedError;
  @JsonKey(name: "following_count")
  int? get followingCount => throw _privateConstructorUsedError;
  @JsonKey(name: "followers_count")
  int? get followerCount => throw _privateConstructorUsedError;
  @JsonKey(name: "is_following")
  bool? get isFollowing => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get statusAccount => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String? get governorate => throw _privateConstructorUsedError;
  @JsonKey(name: "avatar")
  String? get userImage => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "average_rating")
  String? get averageRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'ratings_count')
  int? get ratingsCount => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "is_verified")
  bool? get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: "is_cv_completed")
  bool? get isCvCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: "tags")
  List<String>? get myInterest => throw _privateConstructorUsedError;
  @JsonKey(name: "ads_count")
  int? get adsCount => throw _privateConstructorUsedError;
  @JsonKey(name: "country_id")
  bool? get countryId => throw _privateConstructorUsedError;
  @JsonKey(name: "city_id")
  bool? get cityId => throw _privateConstructorUsedError;
  @JsonKey(name: "unseen_notification")
  int? get unseenNotifications => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _boolFromGender, toJson: _genderFromBool)
  String? get gender => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this AuthModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthModelCopyWith<AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthModelCopyWith<$Res> {
  factory $AuthModelCopyWith(AuthModel value, $Res Function(AuthModel) then) =
      _$AuthModelCopyWithImpl<$Res, AuthModel>;
  @useResult
  $Res call({
    int? id,
    String? name,
    String? token,
    String? country,
    int? points,
    List<String>? role,
    String? password,
    @JsonKey(name: "userName") String? username,
    @JsonKey(name: "email", includeIfNull: false) String? email,
    @JsonKey(name: "phone_number") String? phone,
    @JsonKey(name: "password_confirmation") String? passwordConfirmation,
    @JsonKey(name: "newPassword", includeIfNull: false) String? newPassword,
    @JsonKey(name: "birthdate") String? birthDate,
    @JsonKey(name: "nationality") String? nationalty,
    @JsonKey(name: "profile_description") String? userDescription,
    @JsonKey(name: "account_views") int? accountViews,
    @JsonKey(name: "following_count") int? followingCount,
    @JsonKey(name: "followers_count") int? followerCount,
    @JsonKey(name: "is_following") bool? isFollowing,
    @JsonKey(name: "status") String? statusAccount,
    @JsonKey(name: "city") String? governorate,
    @JsonKey(name: "avatar") String? userImage,
    String? rating,
    @JsonKey(name: "average_rating") String? averageRating,
    @JsonKey(name: 'ratings_count') int? ratingsCount,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "is_verified") bool? isVerified,
    @JsonKey(name: "is_cv_completed") bool? isCvCompleted,
    @JsonKey(name: "tags") List<String>? myInterest,
    @JsonKey(name: "ads_count") int? adsCount,
    @JsonKey(name: "country_id") bool? countryId,
    @JsonKey(name: "city_id") bool? cityId,
    @JsonKey(name: "unseen_notification") int? unseenNotifications,
    @JsonKey(fromJson: _boolFromGender, toJson: _genderFromBool) String? gender,
    String? message,
  });
}

/// @nodoc
class _$AuthModelCopyWithImpl<$Res, $Val extends AuthModel>
    implements $AuthModelCopyWith<$Res> {
  _$AuthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? token = freezed,
    Object? country = freezed,
    Object? points = freezed,
    Object? role = freezed,
    Object? password = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? passwordConfirmation = freezed,
    Object? newPassword = freezed,
    Object? birthDate = freezed,
    Object? nationalty = freezed,
    Object? userDescription = freezed,
    Object? accountViews = freezed,
    Object? followingCount = freezed,
    Object? followerCount = freezed,
    Object? isFollowing = freezed,
    Object? statusAccount = freezed,
    Object? governorate = freezed,
    Object? userImage = freezed,
    Object? rating = freezed,
    Object? averageRating = freezed,
    Object? ratingsCount = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? isVerified = freezed,
    Object? isCvCompleted = freezed,
    Object? myInterest = freezed,
    Object? adsCount = freezed,
    Object? countryId = freezed,
    Object? cityId = freezed,
    Object? unseenNotifications = freezed,
    Object? gender = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            token:
                freezed == token
                    ? _value.token
                    : token // ignore: cast_nullable_to_non_nullable
                        as String?,
            country:
                freezed == country
                    ? _value.country
                    : country // ignore: cast_nullable_to_non_nullable
                        as String?,
            points:
                freezed == points
                    ? _value.points
                    : points // ignore: cast_nullable_to_non_nullable
                        as int?,
            role:
                freezed == role
                    ? _value.role
                    : role // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            password:
                freezed == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String?,
            username:
                freezed == username
                    ? _value.username
                    : username // ignore: cast_nullable_to_non_nullable
                        as String?,
            email:
                freezed == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String?,
            phone:
                freezed == phone
                    ? _value.phone
                    : phone // ignore: cast_nullable_to_non_nullable
                        as String?,
            passwordConfirmation:
                freezed == passwordConfirmation
                    ? _value.passwordConfirmation
                    : passwordConfirmation // ignore: cast_nullable_to_non_nullable
                        as String?,
            newPassword:
                freezed == newPassword
                    ? _value.newPassword
                    : newPassword // ignore: cast_nullable_to_non_nullable
                        as String?,
            birthDate:
                freezed == birthDate
                    ? _value.birthDate
                    : birthDate // ignore: cast_nullable_to_non_nullable
                        as String?,
            nationalty:
                freezed == nationalty
                    ? _value.nationalty
                    : nationalty // ignore: cast_nullable_to_non_nullable
                        as String?,
            userDescription:
                freezed == userDescription
                    ? _value.userDescription
                    : userDescription // ignore: cast_nullable_to_non_nullable
                        as String?,
            accountViews:
                freezed == accountViews
                    ? _value.accountViews
                    : accountViews // ignore: cast_nullable_to_non_nullable
                        as int?,
            followingCount:
                freezed == followingCount
                    ? _value.followingCount
                    : followingCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            followerCount:
                freezed == followerCount
                    ? _value.followerCount
                    : followerCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            isFollowing:
                freezed == isFollowing
                    ? _value.isFollowing
                    : isFollowing // ignore: cast_nullable_to_non_nullable
                        as bool?,
            statusAccount:
                freezed == statusAccount
                    ? _value.statusAccount
                    : statusAccount // ignore: cast_nullable_to_non_nullable
                        as String?,
            governorate:
                freezed == governorate
                    ? _value.governorate
                    : governorate // ignore: cast_nullable_to_non_nullable
                        as String?,
            userImage:
                freezed == userImage
                    ? _value.userImage
                    : userImage // ignore: cast_nullable_to_non_nullable
                        as String?,
            rating:
                freezed == rating
                    ? _value.rating
                    : rating // ignore: cast_nullable_to_non_nullable
                        as String?,
            averageRating:
                freezed == averageRating
                    ? _value.averageRating
                    : averageRating // ignore: cast_nullable_to_non_nullable
                        as String?,
            ratingsCount:
                freezed == ratingsCount
                    ? _value.ratingsCount
                    : ratingsCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            isVerified:
                freezed == isVerified
                    ? _value.isVerified
                    : isVerified // ignore: cast_nullable_to_non_nullable
                        as bool?,
            isCvCompleted:
                freezed == isCvCompleted
                    ? _value.isCvCompleted
                    : isCvCompleted // ignore: cast_nullable_to_non_nullable
                        as bool?,
            myInterest:
                freezed == myInterest
                    ? _value.myInterest
                    : myInterest // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            adsCount:
                freezed == adsCount
                    ? _value.adsCount
                    : adsCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            countryId:
                freezed == countryId
                    ? _value.countryId
                    : countryId // ignore: cast_nullable_to_non_nullable
                        as bool?,
            cityId:
                freezed == cityId
                    ? _value.cityId
                    : cityId // ignore: cast_nullable_to_non_nullable
                        as bool?,
            unseenNotifications:
                freezed == unseenNotifications
                    ? _value.unseenNotifications
                    : unseenNotifications // ignore: cast_nullable_to_non_nullable
                        as int?,
            gender:
                freezed == gender
                    ? _value.gender
                    : gender // ignore: cast_nullable_to_non_nullable
                        as String?,
            message:
                freezed == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthModelImplCopyWith<$Res>
    implements $AuthModelCopyWith<$Res> {
  factory _$$AuthModelImplCopyWith(
    _$AuthModelImpl value,
    $Res Function(_$AuthModelImpl) then,
  ) = __$$AuthModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? name,
    String? token,
    String? country,
    int? points,
    List<String>? role,
    String? password,
    @JsonKey(name: "userName") String? username,
    @JsonKey(name: "email", includeIfNull: false) String? email,
    @JsonKey(name: "phone_number") String? phone,
    @JsonKey(name: "password_confirmation") String? passwordConfirmation,
    @JsonKey(name: "newPassword", includeIfNull: false) String? newPassword,
    @JsonKey(name: "birthdate") String? birthDate,
    @JsonKey(name: "nationality") String? nationalty,
    @JsonKey(name: "profile_description") String? userDescription,
    @JsonKey(name: "account_views") int? accountViews,
    @JsonKey(name: "following_count") int? followingCount,
    @JsonKey(name: "followers_count") int? followerCount,
    @JsonKey(name: "is_following") bool? isFollowing,
    @JsonKey(name: "status") String? statusAccount,
    @JsonKey(name: "city") String? governorate,
    @JsonKey(name: "avatar") String? userImage,
    String? rating,
    @JsonKey(name: "average_rating") String? averageRating,
    @JsonKey(name: 'ratings_count') int? ratingsCount,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "is_verified") bool? isVerified,
    @JsonKey(name: "is_cv_completed") bool? isCvCompleted,
    @JsonKey(name: "tags") List<String>? myInterest,
    @JsonKey(name: "ads_count") int? adsCount,
    @JsonKey(name: "country_id") bool? countryId,
    @JsonKey(name: "city_id") bool? cityId,
    @JsonKey(name: "unseen_notification") int? unseenNotifications,
    @JsonKey(fromJson: _boolFromGender, toJson: _genderFromBool) String? gender,
    String? message,
  });
}

/// @nodoc
class __$$AuthModelImplCopyWithImpl<$Res>
    extends _$AuthModelCopyWithImpl<$Res, _$AuthModelImpl>
    implements _$$AuthModelImplCopyWith<$Res> {
  __$$AuthModelImplCopyWithImpl(
    _$AuthModelImpl _value,
    $Res Function(_$AuthModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? token = freezed,
    Object? country = freezed,
    Object? points = freezed,
    Object? role = freezed,
    Object? password = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? passwordConfirmation = freezed,
    Object? newPassword = freezed,
    Object? birthDate = freezed,
    Object? nationalty = freezed,
    Object? userDescription = freezed,
    Object? accountViews = freezed,
    Object? followingCount = freezed,
    Object? followerCount = freezed,
    Object? isFollowing = freezed,
    Object? statusAccount = freezed,
    Object? governorate = freezed,
    Object? userImage = freezed,
    Object? rating = freezed,
    Object? averageRating = freezed,
    Object? ratingsCount = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? isVerified = freezed,
    Object? isCvCompleted = freezed,
    Object? myInterest = freezed,
    Object? adsCount = freezed,
    Object? countryId = freezed,
    Object? cityId = freezed,
    Object? unseenNotifications = freezed,
    Object? gender = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _$AuthModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        token:
            freezed == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String?,
        country:
            freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                    as String?,
        points:
            freezed == points
                ? _value.points
                : points // ignore: cast_nullable_to_non_nullable
                    as int?,
        role:
            freezed == role
                ? _value._role
                : role // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        password:
            freezed == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String?,
        username:
            freezed == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                    as String?,
        email:
            freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String?,
        phone:
            freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                    as String?,
        passwordConfirmation:
            freezed == passwordConfirmation
                ? _value.passwordConfirmation
                : passwordConfirmation // ignore: cast_nullable_to_non_nullable
                    as String?,
        newPassword:
            freezed == newPassword
                ? _value.newPassword
                : newPassword // ignore: cast_nullable_to_non_nullable
                    as String?,
        birthDate:
            freezed == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                    as String?,
        nationalty:
            freezed == nationalty
                ? _value.nationalty
                : nationalty // ignore: cast_nullable_to_non_nullable
                    as String?,
        userDescription:
            freezed == userDescription
                ? _value.userDescription
                : userDescription // ignore: cast_nullable_to_non_nullable
                    as String?,
        accountViews:
            freezed == accountViews
                ? _value.accountViews
                : accountViews // ignore: cast_nullable_to_non_nullable
                    as int?,
        followingCount:
            freezed == followingCount
                ? _value.followingCount
                : followingCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        followerCount:
            freezed == followerCount
                ? _value.followerCount
                : followerCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        isFollowing:
            freezed == isFollowing
                ? _value.isFollowing
                : isFollowing // ignore: cast_nullable_to_non_nullable
                    as bool?,
        statusAccount:
            freezed == statusAccount
                ? _value.statusAccount
                : statusAccount // ignore: cast_nullable_to_non_nullable
                    as String?,
        governorate:
            freezed == governorate
                ? _value.governorate
                : governorate // ignore: cast_nullable_to_non_nullable
                    as String?,
        userImage:
            freezed == userImage
                ? _value.userImage
                : userImage // ignore: cast_nullable_to_non_nullable
                    as String?,
        rating:
            freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                    as String?,
        averageRating:
            freezed == averageRating
                ? _value.averageRating
                : averageRating // ignore: cast_nullable_to_non_nullable
                    as String?,
        ratingsCount:
            freezed == ratingsCount
                ? _value.ratingsCount
                : ratingsCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        isVerified:
            freezed == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                    as bool?,
        isCvCompleted:
            freezed == isCvCompleted
                ? _value.isCvCompleted
                : isCvCompleted // ignore: cast_nullable_to_non_nullable
                    as bool?,
        myInterest:
            freezed == myInterest
                ? _value._myInterest
                : myInterest // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        adsCount:
            freezed == adsCount
                ? _value.adsCount
                : adsCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        countryId:
            freezed == countryId
                ? _value.countryId
                : countryId // ignore: cast_nullable_to_non_nullable
                    as bool?,
        cityId:
            freezed == cityId
                ? _value.cityId
                : cityId // ignore: cast_nullable_to_non_nullable
                    as bool?,
        unseenNotifications:
            freezed == unseenNotifications
                ? _value.unseenNotifications
                : unseenNotifications // ignore: cast_nullable_to_non_nullable
                    as int?,
        gender:
            freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                    as String?,
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthModelImpl implements _AuthModel {
  const _$AuthModelImpl({
    this.id,
    this.name,
    this.token,
    this.country,
    this.points,
    final List<String>? role,
    this.password,
    @JsonKey(name: "userName") this.username,
    @JsonKey(name: "email", includeIfNull: false) this.email,
    @JsonKey(name: "phone_number") this.phone,
    @JsonKey(name: "password_confirmation") this.passwordConfirmation,
    @JsonKey(name: "newPassword", includeIfNull: false) this.newPassword,
    @JsonKey(name: "birthdate") this.birthDate,
    @JsonKey(name: "nationality") this.nationalty,
    @JsonKey(name: "profile_description") this.userDescription,
    @JsonKey(name: "account_views") this.accountViews,
    @JsonKey(name: "following_count") this.followingCount,
    @JsonKey(name: "followers_count") this.followerCount,
    @JsonKey(name: "is_following") this.isFollowing,
    @JsonKey(name: "status") this.statusAccount,
    @JsonKey(name: "city") this.governorate,
    @JsonKey(name: "avatar") this.userImage,
    this.rating,
    @JsonKey(name: "average_rating") this.averageRating,
    @JsonKey(name: 'ratings_count') this.ratingsCount,
    @JsonKey(name: "updated_at") this.updatedAt,
    @JsonKey(name: "created_at") this.createdAt,
    @JsonKey(name: "is_verified") this.isVerified,
    @JsonKey(name: "is_cv_completed") this.isCvCompleted,
    @JsonKey(name: "tags") final List<String>? myInterest,
    @JsonKey(name: "ads_count") this.adsCount,
    @JsonKey(name: "country_id") this.countryId,
    @JsonKey(name: "city_id") this.cityId,
    @JsonKey(name: "unseen_notification") this.unseenNotifications,
    @JsonKey(fromJson: _boolFromGender, toJson: _genderFromBool) this.gender,
    this.message,
  }) : _role = role,
       _myInterest = myInterest;

  factory _$AuthModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? token;
  @override
  final String? country;
  @override
  final int? points;
  final List<String>? _role;
  @override
  List<String>? get role {
    final value = _role;
    if (value == null) return null;
    if (_role is EqualUnmodifiableListView) return _role;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? password;
  @override
  @JsonKey(name: "userName")
  final String? username;
  @override
  @JsonKey(name: "email", includeIfNull: false)
  final String? email;
  @override
  @JsonKey(name: "phone_number")
  final String? phone;
  @override
  @JsonKey(name: "password_confirmation")
  final String? passwordConfirmation;
  @override
  @JsonKey(name: "newPassword", includeIfNull: false)
  final String? newPassword;
  @override
  @JsonKey(name: "birthdate")
  final String? birthDate;
  @override
  @JsonKey(name: "nationality")
  final String? nationalty;
  @override
  @JsonKey(name: "profile_description")
  final String? userDescription;
  @override
  @JsonKey(name: "account_views")
  final int? accountViews;
  @override
  @JsonKey(name: "following_count")
  final int? followingCount;
  @override
  @JsonKey(name: "followers_count")
  final int? followerCount;
  @override
  @JsonKey(name: "is_following")
  final bool? isFollowing;
  @override
  @JsonKey(name: "status")
  final String? statusAccount;
  @override
  @JsonKey(name: "city")
  final String? governorate;
  @override
  @JsonKey(name: "avatar")
  final String? userImage;
  @override
  final String? rating;
  @override
  @JsonKey(name: "average_rating")
  final String? averageRating;
  @override
  @JsonKey(name: 'ratings_count')
  final int? ratingsCount;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "is_verified")
  final bool? isVerified;
  @override
  @JsonKey(name: "is_cv_completed")
  final bool? isCvCompleted;
  final List<String>? _myInterest;
  @override
  @JsonKey(name: "tags")
  List<String>? get myInterest {
    final value = _myInterest;
    if (value == null) return null;
    if (_myInterest is EqualUnmodifiableListView) return _myInterest;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "ads_count")
  final int? adsCount;
  @override
  @JsonKey(name: "country_id")
  final bool? countryId;
  @override
  @JsonKey(name: "city_id")
  final bool? cityId;
  @override
  @JsonKey(name: "unseen_notification")
  final int? unseenNotifications;
  @override
  @JsonKey(fromJson: _boolFromGender, toJson: _genderFromBool)
  final String? gender;
  @override
  final String? message;

  @override
  String toString() {
    return 'AuthModel(id: $id, name: $name, token: $token, country: $country, points: $points, role: $role, password: $password, username: $username, email: $email, phone: $phone, passwordConfirmation: $passwordConfirmation, newPassword: $newPassword, birthDate: $birthDate, nationalty: $nationalty, userDescription: $userDescription, accountViews: $accountViews, followingCount: $followingCount, followerCount: $followerCount, isFollowing: $isFollowing, statusAccount: $statusAccount, governorate: $governorate, userImage: $userImage, rating: $rating, averageRating: $averageRating, ratingsCount: $ratingsCount, updatedAt: $updatedAt, createdAt: $createdAt, isVerified: $isVerified, isCvCompleted: $isCvCompleted, myInterest: $myInterest, adsCount: $adsCount, countryId: $countryId, cityId: $cityId, unseenNotifications: $unseenNotifications, gender: $gender, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.points, points) || other.points == points) &&
            const DeepCollectionEquality().equals(other._role, _role) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.nationalty, nationalty) ||
                other.nationalty == nationalty) &&
            (identical(other.userDescription, userDescription) ||
                other.userDescription == userDescription) &&
            (identical(other.accountViews, accountViews) ||
                other.accountViews == accountViews) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.statusAccount, statusAccount) ||
                other.statusAccount == statusAccount) &&
            (identical(other.governorate, governorate) ||
                other.governorate == governorate) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.ratingsCount, ratingsCount) ||
                other.ratingsCount == ratingsCount) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isCvCompleted, isCvCompleted) ||
                other.isCvCompleted == isCvCompleted) &&
            const DeepCollectionEquality().equals(
              other._myInterest,
              _myInterest,
            ) &&
            (identical(other.adsCount, adsCount) ||
                other.adsCount == adsCount) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.cityId, cityId) || other.cityId == cityId) &&
            (identical(other.unseenNotifications, unseenNotifications) ||
                other.unseenNotifications == unseenNotifications) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    name,
    token,
    country,
    points,
    const DeepCollectionEquality().hash(_role),
    password,
    username,
    email,
    phone,
    passwordConfirmation,
    newPassword,
    birthDate,
    nationalty,
    userDescription,
    accountViews,
    followingCount,
    followerCount,
    isFollowing,
    statusAccount,
    governorate,
    userImage,
    rating,
    averageRating,
    ratingsCount,
    updatedAt,
    createdAt,
    isVerified,
    isCvCompleted,
    const DeepCollectionEquality().hash(_myInterest),
    adsCount,
    countryId,
    cityId,
    unseenNotifications,
    gender,
    message,
  ]);

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthModelImplCopyWith<_$AuthModelImpl> get copyWith =>
      __$$AuthModelImplCopyWithImpl<_$AuthModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthModelImplToJson(this);
  }
}

abstract class _AuthModel implements AuthModel {
  const factory _AuthModel({
    final int? id,
    final String? name,
    final String? token,
    final String? country,
    final int? points,
    final List<String>? role,
    final String? password,
    @JsonKey(name: "userName") final String? username,
    @JsonKey(name: "email", includeIfNull: false) final String? email,
    @JsonKey(name: "phone_number") final String? phone,
    @JsonKey(name: "password_confirmation") final String? passwordConfirmation,
    @JsonKey(name: "newPassword", includeIfNull: false)
    final String? newPassword,
    @JsonKey(name: "birthdate") final String? birthDate,
    @JsonKey(name: "nationality") final String? nationalty,
    @JsonKey(name: "profile_description") final String? userDescription,
    @JsonKey(name: "account_views") final int? accountViews,
    @JsonKey(name: "following_count") final int? followingCount,
    @JsonKey(name: "followers_count") final int? followerCount,
    @JsonKey(name: "is_following") final bool? isFollowing,
    @JsonKey(name: "status") final String? statusAccount,
    @JsonKey(name: "city") final String? governorate,
    @JsonKey(name: "avatar") final String? userImage,
    final String? rating,
    @JsonKey(name: "average_rating") final String? averageRating,
    @JsonKey(name: 'ratings_count') final int? ratingsCount,
    @JsonKey(name: "updated_at") final String? updatedAt,
    @JsonKey(name: "created_at") final String? createdAt,
    @JsonKey(name: "is_verified") final bool? isVerified,
    @JsonKey(name: "is_cv_completed") final bool? isCvCompleted,
    @JsonKey(name: "tags") final List<String>? myInterest,
    @JsonKey(name: "ads_count") final int? adsCount,
    @JsonKey(name: "country_id") final bool? countryId,
    @JsonKey(name: "city_id") final bool? cityId,
    @JsonKey(name: "unseen_notification") final int? unseenNotifications,
    @JsonKey(fromJson: _boolFromGender, toJson: _genderFromBool)
    final String? gender,
    final String? message,
  }) = _$AuthModelImpl;

  factory _AuthModel.fromJson(Map<String, dynamic> json) =
      _$AuthModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get token;
  @override
  String? get country;
  @override
  int? get points;
  @override
  List<String>? get role;
  @override
  String? get password;
  @override
  @JsonKey(name: "userName")
  String? get username;
  @override
  @JsonKey(name: "email", includeIfNull: false)
  String? get email;
  @override
  @JsonKey(name: "phone_number")
  String? get phone;
  @override
  @JsonKey(name: "password_confirmation")
  String? get passwordConfirmation;
  @override
  @JsonKey(name: "newPassword", includeIfNull: false)
  String? get newPassword;
  @override
  @JsonKey(name: "birthdate")
  String? get birthDate;
  @override
  @JsonKey(name: "nationality")
  String? get nationalty;
  @override
  @JsonKey(name: "profile_description")
  String? get userDescription;
  @override
  @JsonKey(name: "account_views")
  int? get accountViews;
  @override
  @JsonKey(name: "following_count")
  int? get followingCount;
  @override
  @JsonKey(name: "followers_count")
  int? get followerCount;
  @override
  @JsonKey(name: "is_following")
  bool? get isFollowing;
  @override
  @JsonKey(name: "status")
  String? get statusAccount;
  @override
  @JsonKey(name: "city")
  String? get governorate;
  @override
  @JsonKey(name: "avatar")
  String? get userImage;
  @override
  String? get rating;
  @override
  @JsonKey(name: "average_rating")
  String? get averageRating;
  @override
  @JsonKey(name: 'ratings_count')
  int? get ratingsCount;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "is_verified")
  bool? get isVerified;
  @override
  @JsonKey(name: "is_cv_completed")
  bool? get isCvCompleted;
  @override
  @JsonKey(name: "tags")
  List<String>? get myInterest;
  @override
  @JsonKey(name: "ads_count")
  int? get adsCount;
  @override
  @JsonKey(name: "country_id")
  bool? get countryId;
  @override
  @JsonKey(name: "city_id")
  bool? get cityId;
  @override
  @JsonKey(name: "unseen_notification")
  int? get unseenNotifications;
  @override
  @JsonKey(fromJson: _boolFromGender, toJson: _genderFromBool)
  String? get gender;
  @override
  String? get message;

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthModelImplCopyWith<_$AuthModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Interest _$InterestFromJson(Map<String, dynamic> json) {
  return _Interest.fromJson(json);
}

/// @nodoc
mixin _$Interest {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this Interest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Interest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InterestCopyWith<Interest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterestCopyWith<$Res> {
  factory $InterestCopyWith(Interest value, $Res Function(Interest) then) =
      _$InterestCopyWithImpl<$Res, Interest>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$InterestCopyWithImpl<$Res, $Val extends Interest>
    implements $InterestCopyWith<$Res> {
  _$InterestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Interest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InterestImplCopyWith<$Res>
    implements $InterestCopyWith<$Res> {
  factory _$$InterestImplCopyWith(
    _$InterestImpl value,
    $Res Function(_$InterestImpl) then,
  ) = __$$InterestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$InterestImplCopyWithImpl<$Res>
    extends _$InterestCopyWithImpl<$Res, _$InterestImpl>
    implements _$$InterestImplCopyWith<$Res> {
  __$$InterestImplCopyWithImpl(
    _$InterestImpl _value,
    $Res Function(_$InterestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Interest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _$InterestImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InterestImpl implements _Interest {
  const _$InterestImpl({this.id, this.name});

  factory _$InterestImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterestImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'Interest(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of Interest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InterestImplCopyWith<_$InterestImpl> get copyWith =>
      __$$InterestImplCopyWithImpl<_$InterestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterestImplToJson(this);
  }
}

abstract class _Interest implements Interest {
  const factory _Interest({final int? id, final String? name}) = _$InterestImpl;

  factory _Interest.fromJson(Map<String, dynamic> json) =
      _$InterestImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of Interest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InterestImplCopyWith<_$InterestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
