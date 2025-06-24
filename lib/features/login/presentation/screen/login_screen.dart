import 'package:flutter/material.dart';
import 'package:x_calcu/features/login/presentation/widget/click_text_register.dart';
import 'package:x_calcu/features/login/presentation/widget/login_button.dart';
import 'package:x_calcu/features/login/presentation/widget/login_form.dart';
import 'package:x_calcu/features/login/presentation/widget/logo_avatar.dart';
import 'package:x_calcu/features/login/presentation/widget/skip_text.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/common_sizes.dart';

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
    return SafeArea(
      child: Skaffold(
        isAppBarNull: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // GestureDetector(
                  //   onTap: () => showLanguageBottomSheet(context),
                  //   child: CircleAvatar(
                  //     backgroundColor: Utils(context).primary,
                  //     child: Icon(
                  //       Icons.translate,
                  //       color: Colors.white,
                  //       size: 14.sp,
                  //     ),
                  //   ),
                  // ),
                  const SkipText(),
                ],
              ),
              CommonSizes.vSmallestSpace,
              const LogoAvatar(),
              CommonSizes.vBigSpace,
              Column(
                children: [
                  LoginForm(formKey: loginForm, onFieldChanged: onFieldChanged),
                  CommonSizes.vBiggestSpace,
                  LoginButton(formKey: loginForm, isFormValid: isFormValid),
                  CommonSizes.vSmallSpace,
                  const ClickTextRegister(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
