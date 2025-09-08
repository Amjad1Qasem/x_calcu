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
    this.onTap,
    this.onMarkAsRead,
    this.onDelete,
  });

  final NotificationModel notification;
  final VoidCallback? onTap;
  final VoidCallback? onMarkAsRead;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Utils(context).background,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color:
                notification.isRead == true
                    ? Colors.grey.withOpacity(0.3)
                    : Utils(context).primary.withOpacity(0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Container
            Container(
              width: 50.w,
              height: 50.h,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color:
                    notification.type == NotificationType.input
                        ? const Color(0xffd4ffd5)
                        : const Color(0xffffdcdc),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                notification.type == NotificationType.input
                    ? Icons.arrow_downward
                    : Icons.arrow_upward,
                color:
                    notification.type == NotificationType.input
                        ? Colors.green
                        : Colors.red,
                size: 24.sp,
              ),
            ),
            CommonSizes.hSmallestSpace,

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Read Status
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          style: Utils(context).blackBigText.copyWith(
                            color: Utils(context).primary,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (notification.isRead != true)
                        Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: Utils(context).primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  CommonSizes.vSmallestSpace,

                  // Body
                  Text(
                    notification.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Utils(context).normalText.copyWith(
                      color: Utils(context).secondTextColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  CommonSizes.vSmallestSpace,

                  // Customer/Partner Info
                  if (notification.customerName != null ||
                      notification.partnerName != null)
                    Text(
                      '${notification.customerName ?? ''} ${notification.partnerName != null ? '- ${notification.partnerName}' : ''}',
                      style: Utils(context).normalText.copyWith(
                        color: Utils(context).primTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  CommonSizes.vSmallestSpace,

                  // Date and Amount
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FormatTime.formatDateFromDateTime(
                          notification.scheduledTime,
                        ),
                        style: Utils(context).normalText.copyWith(
                          color: Utils(context).secondTextColor,
                          fontSize: 12.sp,
                        ),
                      ),
                      if (notification.amount != null)
                        Text(
                          '${notification.amount!.toStringAsFixed(0)} SYP',
                          style: Utils(context).normalText.copyWith(
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

            // Action Buttons
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
                          value: 'mark_read',
                          child: Row(
                            children: [
                              Icon(Icons.mark_email_read, size: 16.sp),
                              SizedBox(width: 8.w),
                              Text('mark_as_read'.tr()),
                            ],
                          ),
                        ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete, size: 16.sp, color: Colors.red),
                            SizedBox(width: 8.w),
                            Text(
                              'delete'.tr(),
                              style: TextStyle(color: Colors.red),
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
      ),
    );
  }
}
