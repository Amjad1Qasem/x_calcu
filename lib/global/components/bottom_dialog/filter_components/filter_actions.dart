import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class FilterActions extends StatelessWidget {
  final VoidCallback onClearDateRange;
  final VoidCallback onApplyFilter;
  final bool hasDateRange;

  const FilterActions({
    super.key,
    required this.onClearDateRange,
    required this.onApplyFilter,
    required this.hasDateRange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (hasDateRange) ...[
          SizedBox(
            width: double.infinity,
            child: AppButton(
              onTap: onClearDateRange,
              label: 'clear_date_range'.tr(),
              color: Utils(context).red,
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
            ),
          ),
          CommonSizes.vSmallestSpace,
        ],
        SizedBox(
          width: double.infinity,
          child: AppButton(
            onTap: onApplyFilter,
            label: 'apply_filter'.tr(),
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
          ),
        ),
      ],
    );
  }
}
