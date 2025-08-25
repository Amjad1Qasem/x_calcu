import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/global/utils/constant/app_images.dart';

part 'boarding_model.freezed.dart';
part 'boarding_model.g.dart';

@freezed
class Boarding with _$Boarding {
  const factory Boarding({
    int? id,
    String? title,
    String? image,
    String? description,
    int? order,
  }) = _Boarding;

  factory Boarding.fromJson(Map<String, Object?> json) =>
      _$BoardingFromJson(json);
}

List<Boarding> boardingData = [
  Boarding(
    title: "boarding_title_1",
    description: "boarding_description_1",
    image: AppImages.firstBoarding,
  ),
  Boarding(
    title: "boarding_title_2",
    description: "boarding_description_2",
    image: AppImages.secondBoarding,
  ),
  Boarding(
    title: "boarding_title_3",
    description: "boarding_description_3",
    image: AppImages.thirdBoarding,
  ),
];
