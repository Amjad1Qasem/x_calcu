import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../design/color_app.dart';

Widget loadingAppWidget({Color? color}) {
  return Center(
    child: SizedBox(
      width: 100.sp,
      height: 100.sp,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
        child: CircularProgressIndicator(
          color: color ?? ColorManager.secondaryColor,
        ),
      ),
    ),
  );
}
