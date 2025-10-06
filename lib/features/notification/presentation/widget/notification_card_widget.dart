import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_calcu/features/notification/data/notification_model.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/constant/app_images.dart';
import 'package:x_calcu/global/utils/functions/format_time.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({
    super.key,
    required this.notification,
    this.onMarkAsRead,
    this.onDelete,
  });
  final NotificationModel notification;
  final VoidCallback? onMarkAsRead;
  final VoidCallback? onDelete;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 115.h,
            width: 95.w,
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color:
                  notification.type == NotificationType.input
                      ? Color(0xffd4ffd5)
                      : Color(0xffffdcdc),
              borderRadius: BorderRadius.circular(18),
            ),
            child: SvgPicture.asset(
              notification.type == NotificationType.input
                  ? AppImages.inputNotificationImage
                  : AppImages.outputNotificationImage,
              width: 20,
              height: 20,
            ),
          ),
          CommonSizes.hSmallestSpace,
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                notification.title ?? '',

                                style: Utils(context).blackBigText.copyWith(
                                  color: Utils(context).primary,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            if (onMarkAsRead != null || onDelete != null)
                              PopupMenuButton<String>(
                                onSelected: (value) {
                                  switch (value) {
                                    case 'mark_read':
                                      onMarkAsRead?.call();
                                      break;
                                    case 'delete':
                                      onDelete?.call();
                                      break;
                                  }
                                },
                                itemBuilder:
                                    (context) => [
                                      if (notification.isRead != true)
                                        PopupMenuItem(
                                          value: 'mark_read'.tr(),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.mark_email_read,
                                                size: 16.sp,
                                              ),
                                              SizedBox(width: 8.w),
                                              Text('mark_as_read'.tr()),
                                            ],
                                          ),
                                        ),
                                      PopupMenuItem(
                                        value: 'delete'.tr(),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              size: 16.sp,
                                              color: Colors.red,
                                            ),
                                            SizedBox(width: 8.w),
                                            Text(
                                              'delete'.tr(),
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                child: Icon(
                                  Icons.more_vert,
                                  color: Utils(context).secondTextColor,
                                  size: 20.sp,
                                ),
                              ),
                          ],
                        ),

                        Padding(
                          padding: EdgeInsetsDirectional.only(end: 6.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Expanded(
                                child: Text(
                                  notification.body ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Utils(context).blackBigText.copyWith(
                                    color: Utils(context).primary,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                              CommonSizes.hTheSmallestSpace,
                              if (notification.isRead != true)
                                Center(
                                  child: Container(
                                    height: 9,
                                    width: 9,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 213, 213, 213),
                                          Color(0xff505050),
                                        ],
                                        begin: Alignment.topCenter,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        CommonSizes.vSmallestSpace,
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FormatTime.getRelativeTime(
                                notification.scheduledTime.toString(),
                              ),
                              style: Utils(context).blackBigText.copyWith(
                                color: Utils(context).primary,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
