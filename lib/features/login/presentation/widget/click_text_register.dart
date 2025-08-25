import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class ClickTextRegister extends StatelessWidget {
  const ClickTextRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(children: [const ConditionsTextWidget()]),
    );
  }
}

class ConditionsTextWidget extends StatelessWidget {
  const ConditionsTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      softWrap: true,
      text: TextSpan(
        children: [
          TextSpan(
            text: " ${"by_registering_you_agree".tr()} ",
            style: Utils(context).secondText.copyWith(fontSize: 14.sp),
          ),
          TextSpan(
            text: ' ${"terms_and_conditions".tr()}',
            style: Utils(context).normalText.copyWith(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),

            recognizer:
                TapGestureRecognizer()
                  ..onTap =
                      () => context.push(RouterPath.termsAndConditionsScreen),
          ),
          TextSpan(
            text: ' ${"and".tr()} ',
            style: Utils(context).secondText.copyWith(
              decoration: TextDecoration.underline,
              fontSize: 14.sp,
            ),
          ),
          TextSpan(
            text: ' ${"privacy_policy".tr()}',
            style: Utils(context).normalText.copyWith(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () => context.push(RouterPath.privacyPolicyScreen),
          ),
          TextSpan(
            text: " ${"we_have".tr()}",
            style: Utils(context).secondText.copyWith(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
