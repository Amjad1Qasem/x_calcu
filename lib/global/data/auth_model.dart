import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    int? id,
    String? name,
    String? email,
    @JsonKey(name: "access_token") required String? token,
    @JsonKey(name: "userName") required String? username,
    @JsonKey(name: "updated_at") required String? updatedAt,
    @JsonKey(name: "created_at") required String? createdAt,
    @JsonKey(name: "email_verified_at") required String? emailVerifiedAt,
    String? message,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(
    json["data"] is Map<String, dynamic> ? json["data"] : json,
  );
}
