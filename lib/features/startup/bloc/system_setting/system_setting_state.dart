part of 'system_setting_cubit.dart';

@freezed
class SystemSettingState with _$SystemSettingState {
  const factory SystemSettingState.initial() = _Initial;

  const factory SystemSettingState.loading() = _Loading;

  const factory SystemSettingState.loaded({required SystemSettingModel data}) =
      _Loaded;

  const factory SystemSettingState.error({required String error}) = _Error;
}
