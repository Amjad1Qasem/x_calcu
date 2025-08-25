import 'package:freezed_annotation/freezed_annotation.dart';
part 'partner_model.freezed.dart';
part 'partner_model.g.dart';

@freezed
class PartnerModel with _$PartnerModel {
  const factory PartnerModel({
    int? id,
    String? name,
    String? number,
    String? email,
  }) = _PartnerModel;

  factory PartnerModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerModelFromJson(
        json["data"] is Map<String, dynamic> ? json["data"] : json,
      );
}
