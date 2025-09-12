import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/helper/local_storage_helper.dart';

class BackupPasswordDialog extends StatefulWidget {
  final VoidCallback? onSuccess;
  final bool isReset;

  const BackupPasswordDialog({super.key, this.onSuccess, this.isReset = false});

  @override
  State<BackupPasswordDialog> createState() => _BackupPasswordDialogState();
}

class _BackupPasswordDialogState extends State<BackupPasswordDialog> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'enter_backup_password'.tr();
    }
    if (value.length < 4) {
      return 'backup_password_too_short'.tr();
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'confirm_backup_password'.tr();
    }
    if (value != _passwordController.text) {
      return 'backup_password_mismatch'.tr();
    }
    return null;
  }

  Future<void> _saveBackupPassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      await LocalStorageHelper.setBackupPassword(_passwordController.text);

      if (mounted) {
        snackBar(context: context, title: 'backup_password_created'.tr());

        Navigator.of(context).pop();
        widget.onSuccess?.call();
      }
    } catch (e) {
      if (mounted) {
        snackBar(
          context: context,
          title: 'Error saving backup password: $e',
          isErrorMessage: true,
        );
      }
    }
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
                      Iconsax.lock,
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
                          widget.isReset
                              ? 'reset_backup_password'.tr()
                              : 'create_backup_password'.tr(),
                          style: Utils(context).blackBigText.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'backup_password_description'.tr(),
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
              Text(
                'enter_backup_password'.tr(),
                style: Utils(context).normalText.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                keyboardType: TextInputType.number,
                maxLength: 6,
                validator: _validatePassword,
                decoration: InputDecoration(
                  hintText: ' ',
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

              // Confirm Password Field
              Text(
                'confirm_backup_password'.tr(),
                style: Utils(context).normalText.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                keyboardType: TextInputType.number,
                maxLength: 6,
                validator: _validateConfirmPassword,
                decoration: InputDecoration(
                  hintText: ' ',
                  counterText: '',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                      color: Utils(context).secondTextColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
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

              SizedBox(height: 24.h),

              // Buttons
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
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
                    SizedBox(width: 6.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _saveBackupPassword,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Utils(context).primary,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          widget.isReset
                              ? 'reset_backup_password'.tr()
                              : 'create_backup_password'.tr(),
                          maxLines: 2,
                          style: Utils(context).normalText.copyWith(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
