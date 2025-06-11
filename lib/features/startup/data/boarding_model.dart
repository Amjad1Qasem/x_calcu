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

// class UnbordingContent {
//   String? image;
//   String? title;
//   String? body;

//   UnbordingContent({this.image, this.title, this.body});
// }

List<Boarding> boardingData = [
  Boarding(
    title: "أعلن لدينا، وتميز عن الجميع",
    description:
        """لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور
أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد""",
    image: AppImages.firstBoarding,
  ),
  Boarding(
    title: "اكتشف. تواصل. اشتري!",
    description:
        """لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور
أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد""",
    image: AppImages.secondBoarding,
  ),
  Boarding(
    title: "احصل على نقاط وهدايا",
    description:
        """لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور
أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد""",
    image: AppImages.thirdBoarding,
  ),
];
