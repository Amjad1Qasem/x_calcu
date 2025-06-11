
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

void snackBar({
  required BuildContext context,
  required String title,
  bool? isErrorMessage = false,
  Color? bgColor,
  Color? iconColor,
  IconData? icon,
  Duration? duration,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration ?? const Duration(seconds: 2),
        behavior: SnackBarBehavior.fixed,
        backgroundColor:
            bgColor ?? (isErrorMessage! ? Utils(context).red : Colors.green),
        content: Row(
          children: [
            Icon(icon, color: iconColor),
            CommonSizes.hSmallestSpace,
            Expanded(
              child: Text(
                title,
                maxLines: 3,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
