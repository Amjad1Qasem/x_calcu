
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/constant/app_images.dart';

Future openDialog({
  required BuildContext context,
  required String title,
  String? supTitle,
  Widget? content,
  String? textBtn1,
  Function()? onPressedBtn1,
  String? textBtn2,
  required Function() onPressedBtn2,
  List<Widget>? actions,
  bool isActions = true,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: Utils(context)
                  .normalText
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          content: supTitle != null
              ? Text(
                  supTitle,
                  textAlign: TextAlign.center,
                  style: Utils(context).normalText,
                )
              : content,
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: isActions
              ? [
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          label: textBtn2 ?? "yes".tr(),
                          textStyle: Utils(context).buttonText.copyWith(
                              fontSize: 14.sp, color: Utils(context).primary),
                          onTap: onPressedBtn2,
                          height: 38,
                          isBorder: true,
                          width: double.infinity,
                          padding: const EdgeInsets.all(0),
                          raduis: 8,
                        ),
                      ),
                      CommonSizes.hTheSmallestSpace,
                      Expanded(
                        child: AppButton(
                          label: textBtn1 ?? "no".tr(),
                          textStyle: Utils(context).buttonText.copyWith(
                              fontSize: 14.sp, color: Utils(context).primary),
                          isBorder: true,
                          onTap: onPressedBtn1 ?? () => context.pop(),
                          height: 38,
                          padding: const EdgeInsets.all(0),
                          raduis: 8,
                        ),
                      ),
                    ],
                  ),
                ]
              : actions),
    );

Future loginRequiredDialog({required BuildContext context}) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Column(
          children: [
            SvgPicture.asset(AppImages.loginRequiredSmall),
            CommonSizes.vSmallSpace,
            Text(
              "login_required".tr(),
              style: Utils(context)
                  .normalText
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 19.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Text(
          "you_need_to_login".tr(),
          textAlign: TextAlign.center,
          style: Utils(context).normalText,
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          AppButton(
            label: "login_now".tr(),
            textStyle: Utils(context).buttonText.copyWith(fontSize: 12.sp),
            onTap: () {
              context.go('/login');
            },
            width: double.infinity,
            padding: const EdgeInsets.all(0),
            raduis: 8,
          ),
        ],
      ),
    );
