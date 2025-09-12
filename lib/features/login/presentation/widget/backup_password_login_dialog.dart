import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/login/cubit/auth_cubit.dart';
import 'package:x_calcu/features/login/presentation/widget/backup_password_dialog.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/local_storage_helper.dart';

class BackupPasswordLoginDialog extends StatefulWidget {
  final VoidCallback? onSuccess;

  const BackupPasswordLoginDialog({super.key, this.onSuccess});

  @override
  State<BackupPasswordLoginDialog> createState() =>
      _BackupPasswordLoginDialogState();
}

class _BackupPasswordLoginDialogState extends State<BackupPasswordLoginDialog> {
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'enter_backup_password'.tr();
    }
    return null;
  }

  Future<void> _loginWithBackupPassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final isValid = await LocalStorageHelper.verifyBackupPassword(
        _passwordController.text,
      );

      if (isValid) {
        // Use backup password login method
        final authCubit = getIt<AuthCubit>();
        authCubit.submitBackupPasswordLogin(_passwordController.text);

        if (mounted) {
          Navigator.of(context).pop();
          widget.onSuccess?.call();
        }
      } else {
        if (mounted) {
          snackBar(
            context: context,
            title: 'backup_password_invalid'.tr(),
            isErrorMessage: true,
          );
        }
      }
    } catch (e) {
      if (mounted) {
        snackBar(context: context, title: 'Error: $e', isErrorMessage: true);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _showResetPasswordDialog() async {
    Navigator.of(context).pop();

    await showDialog(
      context: context,
      builder:
          (context) => BackupPasswordDialog(
            isReset: true,
            onSuccess: () {
              snackBar(
                context: context,
                title: 'backup_password_reset_success'.tr(),
              );
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        padding: EdgeInsets.all(24.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Utils(context).primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Iconsax.key,
                      color: Utils(context).primary,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'login_with_backup_password'.tr(),
                          style: Utils(context).blackBigText.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'enter_backup_password'.tr(),
                          style: Utils(context).normalText.copyWith(
                            fontSize: 14.sp,
                            color: Utils(context).secondTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // Password Field
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                keyboardType: TextInputType.number,
                maxLength: 6,
                validator: _validatePassword,
                decoration: InputDecoration(
                  hintText: '••••••',
                  counterText: '',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Iconsax.eye_slash : Iconsax.eye,
                      color: Utils(context).secondTextColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Utils(context).primary.withOpacity(0.3),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Utils(context).primary,
                      width: 2,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              // Forgot Password Link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _showResetPasswordDialog,
                  child: Text(
                    'forgot_backup_password'.tr(),
                    style: Utils(context).normalText.copyWith(
                      color: Utils(context).primary,
                      fontSize: 14.sp,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed:
                          _isLoading ? null : () => Navigator.of(context).pop(),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        'cancel'.tr(),
                        style: Utils(context).normalText.copyWith(
                          color: Utils(context).secondTextColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _loginWithBackupPassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Utils(context).primary,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child:
                          _isLoading
                              ? SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                              : Text(
                                'login'.tr(),
                                style: Utils(context).normalText.copyWith(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
