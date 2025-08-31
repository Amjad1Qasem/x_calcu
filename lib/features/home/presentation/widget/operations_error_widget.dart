import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class OperationsErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const OperationsErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.warning_2_copy, size: 64.sp, color: Utils(context).red),
          CommonSizes.vSmallSpace,
          Text(
            'error_loading_operations'.tr(),
            style: Utils(context).blackBigText.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          CommonSizes.vSmallestSpace,
          Text(
            message,
            style: Utils(context).normalText.copyWith(
              fontSize: 14.sp,
              color: Utils(context).secondTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          CommonSizes.vBigSpace,
          AppButton(
            onTap: onRetry,
            label: 'retry'.tr(),
            icon: Iconsax.refresh_copy,
            padding: EdgeInsets.symmetric(horizontal: 40.sp),
          ),
        ],
      ),
    );
  }
}
