part of 'setting_cubit.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState.initial() = _Initial;

  const factory SettingState.userIsVisator() = UserIsVisator;
  const factory SettingState.userIslogin() = UserIslogin;

  const factory SettingState.getUserDataLoading() = GetUserDataLoading;
}
