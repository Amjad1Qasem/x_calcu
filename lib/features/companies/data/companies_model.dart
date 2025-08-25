import 'package:freezed_annotation/freezed_annotation.dart';
part 'companies_model.freezed.dart';
part 'companies_model.g.dart';

@freezed
class CompaniesModel with _$CompaniesModel {
  const factory CompaniesModel({
    int? id,
    String? name,
    String? number,
    String? email,
  }) = _CompaniesModel;

  factory CompaniesModel.fromJson(Map<String, dynamic> json) =>
      _$CompaniesModelFromJson(
        json["data"] is Map<String, dynamic> ? json["data"] : json,
      );
}
