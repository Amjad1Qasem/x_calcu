part of 'localization_bloc.dart';

@freezed
class LocalizationState with _$LocalizationState {
  const factory LocalizationState.initial() = LocalizationInitial;
  const factory LocalizationState.fetched(Locale locale) = LocalizationFetched;
  
  //  Add this getter to always have access to the locale
  const LocalizationState._(); // Private constructor for Freezed
  Locale get locale => this is LocalizationFetched ? (this as LocalizationFetched).locale : const Locale('ar');

}


