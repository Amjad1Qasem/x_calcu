part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = ThemeInitial;
  // const factory ThemeState.loading() = Loading;
  const factory ThemeState.fetched(ThemeMode themeMode) = ThemeFetched;
  const ThemeState._(); // Private constructor for Freezed
  ThemeMode get themeMode =>
      this is ThemeFetched ? (this as ThemeFetched).themeMode : ThemeMode.light;
}
