import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/notification/data/notifications_model.dart';
import 'package:x_calcu/features/notification/presentation/widget/notification_card_widget.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/common_sizes.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Skaffold(
      isAppBarNull: false,
      isBack: false,
      title: 'partners'.tr(),
      body: ListView.separated(
        padding: EdgeInsets.only(bottom: 80.sp),
        shrinkWrap: true,
        itemCount: fakeNotifications.length,
        separatorBuilder: (context, index) => CommonSizes.vSmallestSpace,
        itemBuilder: (context, index) {
          final notification = fakeNotifications[index];
          return NotificationCardWidget(item: notification);
        },
      ),
    );
  }
}
