import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

void snackBar({
  required BuildContext context,
  required String title,
  bool? isErrorMessage = false,
  Color? bgColor,
  Color? iconColor,
  IconData? icon,
  Duration? duration,
  String? subtitle,
}) {
  // Determine colors and icons based on message type
  Color backgroundColor;
  Color textColor;
  IconData messageIcon;
  Color messageIconColor;

  if (isErrorMessage == true) {
    backgroundColor = bgColor ?? const Color(0xFFFF5252); // Modern red
    textColor = Colors.white;
    messageIcon = icon ?? Iconsax.warning_2;
    messageIconColor = iconColor ?? Colors.white;
  } else {
    backgroundColor = bgColor ?? const Color(0xFF4CAF50); // Modern green
    textColor = Colors.white;
    messageIcon = icon ?? Iconsax.tick_circle;
    messageIconColor = iconColor ?? Colors.white;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: duration ?? const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: backgroundColor.withValues(alpha: 0.3),
              offset: const Offset(0, 4),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon container with background
            Container(
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(messageIcon, color: messageIconColor, size: 20.sp),
            ),
            SizedBox(width: 12.w),

            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      height: 1.2,
                    ),
                  ),
                  if (subtitle != null && subtitle.isNotEmpty) ...[
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColor.withValues(alpha: 0.9),
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Close button
            GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              child: Container(
                padding: EdgeInsets.all(4.sp),
                child: Icon(
                  Iconsax.close_circle,
                  color: textColor.withValues(alpha: 0.8),
                  size: 18.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Specialized methods for different message types
void showSuccessSnackBar({
  required BuildContext context,
  required String title,
  String? subtitle,
  Duration? duration,
}) {
  snackBar(
    context: context,
    title: title,
    subtitle: subtitle,
    isErrorMessage: false,
    duration: duration,
  );
}

void showErrorSnackBar({
  required BuildContext context,
  required String title,
  String? subtitle,
  Duration? duration,
}) {
  snackBar(
    context: context,
    title: title,
    subtitle: subtitle,
    isErrorMessage: true,
    duration: duration,
  );
}

void showInfoSnackBar({
  required BuildContext context,
  required String title,
  String? subtitle,
  Duration? duration,
}) {
  snackBar(
    context: context,
    title: title,
    subtitle: subtitle,
    bgColor: const Color(0xFF2196F3), // Blue for info
    icon: Iconsax.info_circle,
    duration: duration,
  );
}

void showWarningSnackBar({
  required BuildContext context,
  required String title,
  String? subtitle,
  Duration? duration,
}) {
  snackBar(
    context: context,
    title: title,
    subtitle: subtitle,
    bgColor: const Color(0xFFFF9800), // Orange for warning
    icon: Iconsax.warning_2,
    duration: duration,
  );
}
