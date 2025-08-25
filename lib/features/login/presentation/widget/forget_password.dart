import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // getIt<AuthCubit>().phoneCodeCont.clear();
        // getIt<AuthCubit>().phoneCont.clear();
        // context.push(RouterPath.confirmNumberScreen);
      },
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          'forgot_password'.tr(),
          style: Utils(context).smallLable.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: Utils(context).secondTextColor,
          ),
        ),
      ),
    );
  }
}
