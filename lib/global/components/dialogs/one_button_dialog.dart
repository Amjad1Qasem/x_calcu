
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

void showOneButtonDialog(BuildContext context, String title, String message,
    String buttonText, dynamic Function()? onTap) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: Utils(context).greyTextBlod,
          textAlign: TextAlign.center,
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: Utils(context).primaryText.copyWith(fontSize: 14.sp),
              ),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          AppButton(padding: EdgeInsets.zero, onTap: onTap, label: buttonText)
        ],
      );
    },
  );
}
