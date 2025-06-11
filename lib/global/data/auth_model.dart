import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
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
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(
      json["data"] is Map<String, dynamic> ? json["data"] : json);
}

// Helper functions for gender conversion
String? _boolFromGender(String? gender) {
  if (gender == null) return null;
  return (gender.toLowerCase() == "male") ? "male" : "female";
}

String? _genderFromBool(String? gender) {
  if (gender == null) return null;
  return gender.toLowerCase(); // Returns "male" or "female"
}

@freezed
class Interest with _$Interest {
  const factory Interest({
    int? id,
    String? name,
  }) = _Interest;

  factory Interest.fromJson(Map<String, Object?> json) =>
      _$InterestFromJson(json);
}
