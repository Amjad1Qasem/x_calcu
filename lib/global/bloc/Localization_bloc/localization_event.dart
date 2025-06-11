part of 'localization_bloc.dart';

@freezed
class LocalizationEvent with _$LocalizationEvent {
 const factory LocalizationEvent.fetchLocalization() = FetchLocalization;
  const factory LocalizationEvent.setEnglish(BuildContext context) = SetEnglish;
  const factory LocalizationEvent.setArabic(BuildContext context) = SetArabic;
}
