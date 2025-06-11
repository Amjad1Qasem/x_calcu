import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String? telescopeName;
  String? manufacturingCompany;
  String? language;
  double? aperature;
  double? focalLength;
  double? focalNumber;

  ProfileModel({
    this.telescopeName,
    this.manufacturingCompany,
    this.language,
    this.aperature,
    this.focalLength,
    this.focalNumber,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        telescopeName: json["name"],
        manufacturingCompany: json["manufacturer"],
        // language: json["language"],
        aperature: json["aperture"]?.toDouble(),
        focalLength: json["focal_length"]?.toDouble(),
        focalNumber: json["focal_ratio"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": telescopeName,
        "manufacturer": manufacturingCompany,
        // "language": language,
        "aperture": aperature,
        "focal_length": focalLength,
        "focal_ratio": focalNumber,
      };
}
