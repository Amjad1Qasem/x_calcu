import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/startup/data/boarding_model.dart';
import 'package:x_calcu/features/startup/data/startup_repo.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/data/auth_model.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/global/utils/helper/local_storage_helper.dart';

part 'startup_cubit.freezed.dart';
part 'startup_state.dart';

class StartupCubit extends Cubit<StartupState> {
  final StartUpRepo _startUpRepo;

  StartupCubit(this._startUpRepo) : super(const StartupState.loading());

  /// **Fetch onboarding data if not seen**
  // Future<void> checkOnBoardingStatus() async {
  //   emit(const StartupState.loading());
  //   await Future.delayed(const Duration(milliseconds: 1500));
  //   try {
  //     final hasSeenOnboarding = await LocalStorageHelper.hasSeenOnboarding();
  //     if (!hasSeenOnboarding) {
  //       debugPrint('saleh !hasSeenOnboarding $hasSeenOnboarding');
  //       var response = await _startUpRepo.getBoardingData();
  //       response.when(
  //         success: (data) {
  //           // getIt<CountryCubit>().getCountryCode();
  //           emit(StartupState.onboardingRequired());
  //         },
  //         failure: (error) {
  //           emit(const StartupState.error());
  //         },
  //       );
  //       return;
  //     }
  //     await checkAuthentication();
  //   } catch (e) {
  //     emit(const StartupState.error());
  //   }
  // }

  /// **Check if user is authenticated**
  Future<void> checkAuthentication() async {
    emit(const StartupState.loading());
    try {
      final hasSeenOnboarding = await LocalStorageHelper.hasSeenOnboarding();
      if (!hasSeenOnboarding) {
        return emit(StartupState.onboardingRequired());
      }

      final isLoggedIn = await LocalStorageHelper.isLoggedIn();
      if (!isLoggedIn) {
        return emit(const StartupState.unauthenticated());
      }

      await fetchUserInfo();
    } catch (e) {
      emit(const StartupState.error());
    }
  }

  /// **Fetch user account details**
  Future<void> fetchUserInfo() async {
    try {
      var response = await _startUpRepo.getInfoData();
      await response.when(
        success: (data) async {
          printWarning('fetchUser ${data.statusAccount}');
          if (data.statusAccount == 'suspended') {
            emit(StartupState.suspended(data));
          } else if (data.statusAccount == 'banned') {
            emit(StartupState.banned(data));
          } else {
            await LocalStorageHelper.setUserData(data);
            getIt<AppStateModel>().updateUserPreferencesStartup(data);
            emit(StartupState.success(data));
          }
        },
        failure: (error) {
          emit(const StartupState.error());
        },
      );
    } catch (e) {
      emit(const StartupState.error());
    }
  }

  /// update user Info for register
  Future<void> updateUserInfo() async {
    try {
      var response = await _startUpRepo.getInfoData();
      await response.when(
        success: (data) async {
          await LocalStorageHelper.setUserData(data);
          getIt<AppStateModel>().updateUserPreferencesStartup(data);
          emit(StartupState.success(data));
        },
        failure: (error) {
          emit(const StartupState.error());
        },
      );
    } catch (e) {
      emit(const StartupState.error());
    }
  }

  /// **Mark onboarding as completed**
  Future<void> completeOnBoarding() async {
    await LocalStorageHelper.setOnBoardingState(true);
    await checkAuthentication();
  }

  // Future<void> getOnBoardingData() async {
  //   emit(const StartupState.loading());
  //   var response = await _startUpRepo.getBoardingData();
  //   response.when(
  //     success: (data) {
  //       // getIt<CountryCubit>().getCountryCode();
  //       emit(StartupState.onboardingRequired());
  //     },
  //     failure: (error) {
  //       emit(const StartupState.error());
  //     },
  //   );
  // }

  /// **Logout user**
  Future<void> logout() async {
    debugPrint('logout from startup');
    await LocalStorageHelper.clearUserData();
    emit(const StartupState.unauthenticated());
  }
}
