import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class StatisticCardWidget extends StatelessWidget {
  const StatisticCardWidget({
    super.key,
    required this.borderColor,
    required this.backgroundColor,
    required this.fontColor,
    required this.title,
    required this.value,
  });
  final Color borderColor;
  final Color backgroundColor;
  final Color fontColor;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: borderColor, width: 0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            maxLines: 1,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Utils(context).secondTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
          Text(
            value,
            maxLines: 1,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: fontColor,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
