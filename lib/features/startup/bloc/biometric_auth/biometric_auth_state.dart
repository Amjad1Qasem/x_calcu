// biometric_auth_state.dart
part of 'biometric_auth_cubit.dart';

@freezed
class BiometricAuthState with _$BiometricAuthState {
  const factory BiometricAuthState.initial() = _Initial;
  const factory BiometricAuthState.loading() = _Loading;
  const factory BiometricAuthState.authenticated() = _Authenticated;
  const factory BiometricAuthState.failed() = _Failed;
  const factory BiometricAuthState.notSupported() = _NotSupported;
  const factory BiometricAuthState.error({required String error}) = _Error;
}
