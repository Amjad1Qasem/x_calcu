import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/login/data/auth_repo.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/data/auth_model.dart';
import 'package:x_calcu/global/networking/failure.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/global/utils/helper/local_storage_helper.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthState.initial());

  GlobalKey<FormState> confirmPass = GlobalKey<FormState>();

  /// autoFillFormKey
  GlobalKey<FormState> autoFillFormKey = GlobalKey<FormState>();

  ///Controllers
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();

  ///Login FocusNode
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  Map<String, dynamic> validationErrors = {};

  bool isVisible = true;

  /// **Submit the login form**
  void submitLogin() async {
    emit(const AuthState.loading());
    final response = await _authRepository.loginRepo(
      email: emailCont.text,
      password: passwordCont.text,
    );
    await response.when(
      success: (data) async {
        printSuccess(data.runtimeType.toString());
        printSuccess(data.token.toString());
        printSuccess(data.toString());
        TextInput.finishAutofillContext();
        await LocalStorageHelper.setUserData(data);
        getIt<AppStateModel>().updateUserPreferences(data);
        await LocalStorageHelper.setToken(data.token ?? "");

        // Save login credentials automatically (Face ID is the primary method)
        await _saveLoginCredentials();

        emit(AuthState.success(data));
      },
      failure: (error) {
        printError(error.runtimeType.toString());
        printError(error.toString());
        if (error is BadRequest) {
          validationErrors = error.errors ?? {};
          if (validationErrors.isEmpty) {
            emit(AuthState.error(error.message));
          }
          printError('validationErrors $validationErrors');
        } else {
          emit(AuthState.error(error.message));
        }
      },
    );
  }

  /// **Toggle the visibility of the password fields**
  void togglePassword() {
    printSuccess('toggle B $isVisible');
    isVisible = !isVisible;
    emit(AuthState.passwordVisibilityToggled(isVisible));
  }

  void submitLogout() async {
    emit(const AuthState.loading());
    final response = await _authRepository.logoutRepo();
    await response.when(
      success: (data) async {
        await LocalStorageHelper.clearUserData();
        await getIt<AppStateModel>().logout();
        emailCont.clear();
        passwordCont.clear();
        emit(const AuthState.loggedOut());
      },
      failure: (error) {
        emit(AuthState.error(error.message));
      },
    );
  }

  /// **Save login credentials automatically (Face ID is the primary method)**
  Future<void> _saveLoginCredentials() async {
    try {
      await LocalStorageHelper.saveLoginCredentials(
        username: emailCont.text,
        password: passwordCont.text,
      );
      printSuccess('Login credentials saved automatically for Face ID');
    } catch (e) {
      printError('Error saving login credentials: $e');
    }
  }

  /// **Submit biometric login**
  void submitBiometricLogin() async {
    emit(const AuthState.loading());

    try {
      // Get saved user data
      final userData = await LocalStorageHelper.getUserData();
      printWarning('userData $userData');
      if (userData == null) {
        emit(AuthState.error('no_saved_user_data'.tr()));
        return;
      }

      // Check if biometric is enabled
      final isBiometricEnabled = await LocalStorageHelper.isBiometricEnabled();
      if (!isBiometricEnabled) {
        emit(AuthState.error('face_id_not_enabled'.tr()));
        return;
      }

      // Simulate successful biometric authentication
      // In a real app, this would be handled by the biometric authentication flow
      printSuccess(
        'Biometric authentication successful for user: ${userData.email}',
      );
      // Update app state with user data
      getIt<AppStateModel>().updateUserPreferences(userData);
      await LocalStorageHelper.setToken(userData.token ?? "");

      emit(AuthState.success(userData));
    } catch (e) {
      printError('Biometric login error: $e');
      emit(AuthState.error('face_id_authentication_failed'.tr()));
    }
  }
}
