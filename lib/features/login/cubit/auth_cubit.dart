import 'dart:math';

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
        emit(AuthState.success(data));
      },
      failure: (error) {
        printError(error.runtimeType.toString());
        printError(error.toString());
        if (error is BadRequest) {
          validationErrors = error.errors ?? {};
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
}
