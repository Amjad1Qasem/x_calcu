import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

Widget homeAppBar(BuildContext context) {
  // int notificationsCount = getIt<AppStateModel>().getMissedNotifications();

  return SliverAppBar(
    pinned: true,
    floating: true,
    snap: true,
    elevation: 0,
    surfaceTintColor: Utils(context).background,
    backgroundColor: Utils(context).background,
    centerTitle: true,
    title: Text(
      'home_screen'.tr(),
      style: Utils(context).blueHeadlineText.copyWith(fontSize: 16.sp),
    ),
    leading: Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Badge(
        // isLabelVisible: notificationsCount == 0,
        isLabelVisible: false,
        backgroundColor: Utils(context).secondary,
        label: Container(
          width: 1.w,
          height: 1.w,
          decoration: BoxDecoration(
            color: Utils(context).secondary,
            shape: BoxShape.circle,
          ),
        ),
        /*
                 Text(
                  // notificationsCount.toString(),
                  '',
                  // '10',
                  style: Utils(context).normalText.copyWith(fontSize: 12.sp),
                ),
                */
        alignment: AlignmentDirectional.topStart,
        offset: const Offset(3, 5),
        child: IconButton(
          onPressed: () => context.push(RouterPath.mainLayout, extra: 1),
          icon: Icon(Iconsax.notification_copy, color: Utils(context).primary),
        ),
      ),
    ),
  );
}
