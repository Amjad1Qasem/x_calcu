part of 'startup_cubit.dart';

@freezed
class StartupState with _$StartupState {
  const factory StartupState.loading() = _Loading;

  const factory StartupState.onboardingRequired() =
      _OnboardingRequired;

  const factory StartupState.unauthenticated() = _Unauthenticated;

  const factory StartupState.success(AuthModel accountDetails) = _Success;

  const factory StartupState.suspended(AuthModel accountDetails) = _Suspended;

  const factory StartupState.banned(AuthModel accountDetails) = _Banned;
  

  const factory StartupState.error() = _Error;
}
