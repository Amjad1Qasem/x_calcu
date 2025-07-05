import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

// Partners Card Widget
class PartnersCard extends StatelessWidget {
  const PartnersCard({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 2.w),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 13.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Partner1',
                      overflow: TextOverflow.ellipsis,
                      style: Utils(
                        context,
                      ).secondText.copyWith(fontWeight: FontWeight.w700),
                    ),
                    CommonSizes.vSmallestSpace,
                    CommonSizes.vSmallestSpace,
                    nameAnDate(context),
                  ],
                ),
              ),
              // CommonSizes.vPluSmallerSpace,
              AppButton(
                onTap: () {},
                label: 'Total: 10 million',
                icon: Iconsax.money_recive_copy,
                padding: EdgeInsets.zero,
                isCustomRadius: true,
                raduis: 16.r,
                textStyle: Utils(
                  context,
                ).buttonText.copyWith(color: Utils(context).secondTextColor),
                color: Utils(context).primaryContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row nameAnDate(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Iconsax.sms_tracking_copy,
                size: 20.sp,
                color: Utils(context).primary,
              ),
              CommonSizes.hTheSmallestSpace,
              Expanded(
                child: Text(
                  'email1@gmail.com',
                  overflow: TextOverflow.ellipsis,
                  style: Utils(context).normalText.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Spacer(),
        CommonSizes.hSmallerSpace,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Iconsax.call_copy, size: 20.sp, color: Utils(context).primary),
            CommonSizes.hTheSmallestSpace,
            Text(
              '963 994744907',
              overflow: TextOverflow.ellipsis,
              style: Utils(context).normalText.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
