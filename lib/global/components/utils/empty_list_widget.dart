
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/constant/app_images.dart';

class EmptyListWidget extends StatelessWidget {
  final String? message;
  final String? image;
  final VoidCallback? onRetry;
  final double? height;

  const EmptyListWidget({
    this.message,
    this.image,
    this.onRetry,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double defaultHeight = screenHeight * 0.4;
    final double containerHeight = height ?? defaultHeight;

    return Center(
      child: Container(
        width: 500.w,
        height: containerHeight,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildWarningIcon(containerHeight),
            _buildMessageText(context, containerHeight),
            CommonSizes.vSmallestSpace,
            _buildRetryButton(context, containerHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildWarningIcon(double containerHeight) {
    double imageSize = containerHeight * 0.4;

    return Flexible(
      child: SvgPicture.asset(
        image ?? AppImages.emptyDataImage,
        width: imageSize.w,
        height: imageSize.h,
      ),
    );
  }

  Widget _buildMessageText(BuildContext context, double containerHeight) {
    // double fontSize = (containerHeight * 0.08).clamp(12.sp, 18.sp);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        children: [
          Text(
            message ?? 'no_data_found'.tr(),
            style: Utils(context).blackBigText.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRetryButton(BuildContext context, double containerHeight) {
    // double buttonHeight = (containerHeight * 0.15).clamp(30.h, 50.h);
    if (onRetry != null) {
      return FractionallySizedBox(
        widthFactor: 0.7,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            iconAlignment: IconAlignment.end,
            onPressed: () {
              onRetry!();
            },
            icon: const Icon(Iconsax.refresh_copy, color: Colors.white),
            label: Text(
              'reload'.tr(),
              style: const TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
