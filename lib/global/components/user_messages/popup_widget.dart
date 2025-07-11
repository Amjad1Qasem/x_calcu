import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/constant/app_images.dart';


Future<void> openDialog({
  required BuildContext context,
  String? title,
  String? message,
  IconData? icon,
  double? iconSize,
  Color? iconColor,
  Color? iconBackgroundColor,
  String? confirmText,
  String? cancelText,
  bool sameActionType = false,
  Function()? onConfirm,
  Function()? onCancel,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Container(
                height: MediaQuery.of(context).size.height * 0.16,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: iconBackgroundColor ?? Colors.blue[50],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: iconSize ?? 60.sp,
                    color: iconColor ?? Colors.blue,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                children: [
                  if (title != null)
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  if (message != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      message,
                      style: TextStyle(fontSize: 14.sp),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const SizedBox(height: 24),
                  Row(
                    // textDirection: TextDirection.ltr,
                    children: [
                      Expanded(
                        child:
                            sameActionType
                                ? OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: Utils(context).primary,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    onConfirm?.call();
                                  },
                                  child: Text(
                                    confirmText ?? 'yes'.tr(),
                                    style: TextStyle(
                                      color: Utils(context).primary,
                                    ),
                                  ),
                                )
                                : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Utils(context).primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    onConfirm?.call();
                                  },
                                  child: Text(
                                    confirmText ?? 'yes'.tr(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                      ),
                      const SizedBox(width: 12),
                      if (onCancel != null)
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Utils(context).primary),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              onCancel.call();
                            },
                            child: Text(
                              cancelText ?? 'cancel'.tr(),
                              style: TextStyle(color: Utils(context).primary),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future loginRequiredDialog({required BuildContext context}) => showDialog(
  context: context,
  builder:
      (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          children: [
            SvgPicture.asset(AppImages.loginRequiredSmall),
            CommonSizes.vSmallSpace,
            Text(
              "login_required".tr(),
              style: Utils(context).normalText.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 19.sp,
              ),
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
