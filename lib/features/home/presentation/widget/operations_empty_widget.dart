import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class OperationsEmptyWidget extends StatelessWidget {
  final String operationType;

  const OperationsEmptyWidget({super.key, required this.operationType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.document_copy,
            size: 64.sp,
            color: Utils(context).secondTextColor,
          ),
          CommonSizes.vSmallSpace,
          Text(
            'no_operations_found'.tr(),
            style: Utils(context).blackBigText.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          CommonSizes.vSmallestSpace,
          Text(
            'no_${operationType}_operations_message'.tr(),
            style: Utils(context).normalText.copyWith(
              fontSize: 14.sp,
              color: Utils(context).secondTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
