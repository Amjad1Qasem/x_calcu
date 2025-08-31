import 'package:freezed_annotation/freezed_annotation.dart';
part 'partner_model.freezed.dart';
part 'partner_model.g.dart';

@freezed
class PartnerModel with _$PartnerModel {
  const factory PartnerModel({
    int? id,
    String? name,
    String? phone,
    String? email,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'total_percentage_value') String? totalPercentageValue,
  }) = _PartnerModel;

  factory PartnerModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerModelFromJson(
        json["data"] is Map<String, dynamic> ? json["data"] : json,
      );
}
