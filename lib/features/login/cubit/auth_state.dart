part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  ///**Login**
  const factory AuthState.loading() = Loading;

  const factory AuthState.success(AuthModel user) = Success;

  const factory AuthState.suspended(AuthModel accountDetails) = Suspended;

  const factory AuthState.banned(AuthModel accountDetails) = Banned;

  const factory AuthState.error(String message) = Error;
  const factory AuthState.passwordVisibilityToggled(bool isVisible) =
      PasswordVisibilityToggled;

  const factory AuthState.loggedOut() = LoggedOut;
}
