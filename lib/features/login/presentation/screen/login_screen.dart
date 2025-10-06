import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/login/presentation/widget/biometric_login_button.dart';
import 'package:x_calcu/features/login/presentation/widget/click_text_register.dart';
import 'package:x_calcu/features/login/presentation/widget/login_button.dart';
import 'package:x_calcu/features/login/presentation/widget/login_form.dart';
import 'package:x_calcu/features/login/presentation/widget/logo_avatar.dart';
import 'package:x_calcu/features/login/presentation/widget/skip_text.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  bool isFormValid = false;

  void onFieldChanged() {
    final isValid = loginForm.currentState?.validate() ?? false;
    if (isValid != isFormValid) {
      setState(() {
        isFormValid = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Skaffold(
      isAppBarNull: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LogoAvatar(),
            LoginForm(formKey: loginForm, onFieldChanged: onFieldChanged),
            CommonSizes.vBigSpace,
            LoginButton(formKey: loginForm, isFormValid: isFormValid),
            CommonSizes.vSmallestSpace,
            _buildDividerWithOr(context),
            CommonSizes.vSmallestSpace,
            const BiometricLoginButton(),

            CommonSizes.vSmallestSpace5v,

            const LoginAsGuest(),
            CommonSizes.vSmallSpace,
            const ClickTextRegister(),
            CommonSizes.vSmallSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildDividerWithOr(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Utils(context).secondTextColor.withValues(alpha: 0.3),
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
            color: Utils(context).secondTextColor.withValues(alpha: 0.3),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
