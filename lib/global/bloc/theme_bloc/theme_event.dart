part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.fetchTheme() = FetchTheme;
  const factory ThemeEvent.setDark() = SetDark;
  const factory ThemeEvent.setLight() = SetLight;
}
