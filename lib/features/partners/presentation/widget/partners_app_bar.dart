import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/partners/cubit/partners/partner_cubit.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

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
    actions: [
      GestureDetector(
        onTap: () {
          // Toggle between asc and desc based on current value
          final newOrderBy =
              getIt<PartnerCubit>().orderBy == 'asc' ? 'desc' : 'asc';
          getIt<PartnerCubit>().setOrderBy(newOrderBy);
        },
        child: Icon(Iconsax.sort_copy, size: 21.sp),
      ),
    ],
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
