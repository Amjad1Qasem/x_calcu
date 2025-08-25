import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

Widget partnersAppBar(BuildContext context, {bool? isBack = false}) {
  return SliverAppBar(
    pinned: true,
    
    leading:
        isBack == true
            ? GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                color: Utils(context).appBarIconsColor,
                Icons.arrow_back_ios_rounded,
                size: 18.sp,
              ),
            )
            : SizedBox(),
    floating: true,
    snap: true,
    elevation: 0,
    toolbarHeight: 50.h,
    surfaceTintColor: Utils(context).background,
    backgroundColor: Utils(context).background,
    centerTitle: true,
    title: Text(
      'partners'.tr(),
      style: Utils(context).blueHeadlineText.copyWith(fontSize: 16.sp),
    ),
  );
}
