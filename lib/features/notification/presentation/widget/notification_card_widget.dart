import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_calcu/features/notification/data/notifications_model.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/constant/app_images.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({super.key, required this.item});
  final NotificationsModel item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 115.h,
            width: 95.w,
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color:
                  item.type == NotificationsType.input
                      ? Color(0xffd4ffd5)
                      : Color(0xffffdcdc),
              borderRadius: BorderRadius.circular(18),
            ),
            child: SvgPicture.asset(
              item.type == NotificationsType.input
                  ? AppImages.inputNotificationImage
                  : AppImages.outputNotificationImage,
              width: 20,
              height: 20,
            ),
          ),
          CommonSizes.hSmallestSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title ?? '',

                    style: Utils(context).blackBigText.copyWith(
                      color: Utils(context).primary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          item.message ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Utils(context).blackBigText.copyWith(
                            color: Utils(context).primary,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      CommonSizes.hTheSmallestSpace,
                      Container(
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
                          // borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ],
                  ),
                  CommonSizes.vSmallestSpace,
                  Text(
                    item.date ?? '',
                    style: Utils(context).blackBigText.copyWith(
                      color: Utils(context).primary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
