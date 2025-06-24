import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../design/color_app.dart';
import '../app_button.dart';

showDialogBox(BuildContext context, String message, {void Function()? onTap}) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.r)),
        ),
        title: Text(
          textAlign: TextAlign.center,
          message,
          style: TextStyle(fontSize: 20.sp),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          AppButton(
            label: 'تم'.tr(),
            width: 600.w,
            color: ColorManager.primaryColor,
            onTap:
                onTap ??
                () {
                  Navigator.pop(context);
                },
          ),
        ],
      );
    },
  );
}

showConfirmDialogBox(
  BuildContext context,
  String message, {
  void Function()? onTap,
}) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.r)),
        ),
        // titleTextStyle: TextStyle(),
        title: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40.sp),
        ),
        actions: <Widget>[
          Row(
            children: [
              Expanded(
                child: AppButton(
                  label: 'ok',
                  onTap:
                      onTap ??
                      () {
                        Navigator.pop(context);
                      },
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: AppButton(
                  label: 'no',
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
