import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/login/cubit/auth_cubit.dart';
import 'package:x_calcu/features/login/presentation/widget/backup_password_login_dialog.dart';
import 'package:x_calcu/features/startup/bloc/biometric_auth/biometric_auth_cubit.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/local_storage_helper.dart';

class BiometricLoginButton extends StatefulWidget {
  const BiometricLoginButton({super.key});

  @override
  State<BiometricLoginButton> createState() => _BiometricLoginButtonState();
}

class _BiometricLoginButtonState extends State<BiometricLoginButton> {
  late final BiometricAuthCubit _biometricCubit;
  late final AuthCubit _authCubit;
  bool _isBiometricAvailable = false;
  bool _isBiometricEnabled = false;
  bool _hasBackupPassword = false;

  @override
  void initState() {
    super.initState();
    _biometricCubit = getIt<BiometricAuthCubit>();
    _authCubit = getIt<AuthCubit>();
    _checkBiometricStatus();
  }

  Future<void> _checkBiometricStatus() async {
    final isAvailable = await _biometricCubit.isBiometricAvailable();
    final isEnabled = await _biometricCubit.isBiometricEnabled();
    final hasBackupPassword = await LocalStorageHelper.hasBackupPassword();

    if (mounted) {
      setState(() {
        _isBiometricAvailable = isAvailable;
        _isBiometricEnabled = isEnabled;
        _hasBackupPassword = hasBackupPassword;
      });
    }
  }

  Future<void> _handleBiometricLogin() async {
    if (!_isBiometricAvailable) {
      snackBar(
        context: context,
        title: 'face_id_not_available'.tr(),
        isErrorMessage: true,
      );
      return;
    }

    if (!_isBiometricEnabled) {
      snackBar(
        context: context,
        title: 'face_id_not_enabled'.tr(),
        isErrorMessage: true,
      );
      return;
    }

    // Start biometric authentication
    await _biometricCubit.authenticateUser();
  }

  @override
  Widget build(BuildContext context) {
    // Don't show button if biometric is not available
    if (!_isBiometricAvailable) {
      return const SizedBox.shrink();
    }

    return BlocListener<BiometricAuthCubit, BiometricAuthState>(
      bloc: _biometricCubit,
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          authenticated: () {
            // Biometric authentication successful, proceed with login
            _authCubit.submitBiometricLogin();
          },
          failed: () {
            snackBar(
              context: context,
              title: 'face_id_authentication_failed'.tr(),
              isErrorMessage: true,
            );
          },
          notSupported: () {
            snackBar(
              context: context,
              title: 'face_id_not_available'.tr(),
              isErrorMessage: true,
            );
          },
          error: (error) {
            // Check if the error is about biometric not being enabled
            if (error.contains('face_id_not_enabled')) {
              snackBar(
                context: context,
                title: 'face_id_not_enabled'.tr(),
                isErrorMessage: true,
              );
            } else {
              snackBar(
                context: context,
                title: 'face_id_authentication_failed'.tr(),
                isErrorMessage: true,
              );
            }
          },
        );
      },
      child: BlocBuilder<BiometricAuthCubit, BiometricAuthState>(
        bloc: _biometricCubit,
        builder: (context, state) {
          final isLoading = state is Loading;

          return Container(
            margin: EdgeInsets.symmetric(vertical: 8.h),
            child: Column(
              children: [
                // Divider with "OR" text
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Utils(context).secondTextColor.withOpacity(0.3),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'or'.tr(),
                        style: Utils(context).normalText.copyWith(
                          color: Utils(context).secondTextColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Utils(context).secondTextColor.withOpacity(0.3),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                // Biometric login button
                GestureDetector(
                  onTap: isLoading ? null : _handleBiometricLogin,
                  child: Container(
                    width: double.infinity,
                    height: 56.h,
                    decoration: BoxDecoration(
                      color:
                          _isBiometricEnabled
                              ? Utils(context).primary.withOpacity(0.1)
                              : Utils(context).primaryContainer,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color:
                            _isBiometricEnabled
                                ? Utils(context).primary
                                : Utils(context).primary.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isLoading)
                          SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Utils(context).primary,
                              ),
                            ),
                          )
                        else
                          Icon(
                            Iconsax.scan,
                            color:
                                _isBiometricEnabled
                                    ? Utils(context).primary
                                    : Utils(context).secondTextColor,
                            size: 24.sp,
                          ),
                        SizedBox(width: 12.w),
                        Text(
                          _isBiometricEnabled
                              ? 'login_with_face_id'.tr()
                              : 'use_face_id_to_login'.tr(),
                          style: Utils(context).normalText.copyWith(
                            color:
                                _isBiometricEnabled
                                    ? Utils(context).primary
                                    : Utils(context).secondTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                if (!_isBiometricEnabled) ...[
                  SizedBox(height: 8.h),
                  Text(
                    'face_id_not_enabled'.tr(),
                    style: Utils(context).normalText.copyWith(
                      color: Utils(context).secondTextColor,
                      fontSize: 12.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],

                // Show backup password option if biometric is enabled but failed
                if (_isBiometricEnabled && _hasBackupPassword) ...[
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder:
                            (context) => BackupPasswordLoginDialog(
                              onSuccess: () {
                                // Login successful, navigate to main screen
                                // This will be handled by the AuthCubit listener
                              },
                            ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 16.w,
                      ),
                      decoration: BoxDecoration(
                        color: Utils(context).primaryContainer,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Utils(context).primary.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Iconsax.key,
                            color: Utils(context).primary,
                            size: 16.sp,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'login_with_backup_password'.tr(),
                            style: Utils(context).normalText.copyWith(
                              color: Utils(context).primary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
