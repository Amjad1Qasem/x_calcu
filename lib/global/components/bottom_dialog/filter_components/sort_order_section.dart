import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class SortOrderSection extends StatelessWidget {
  final String selectedOrderBy;
  final ValueChanged<String> onOrderByChanged;

  const SortOrderSection({
    super.key,
    required this.selectedOrderBy,
    required this.onOrderByChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> orderOptions = ['asc', 'desc'];
    final List<String> orderLabels = [
      'from_oldest_to_newest'.tr(),
      'from_newest_to_oldest'.tr(),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'sort_by'.tr(),
          style: Utils(context).normalText.copyWith(
            color: Utils(context).primary,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        CommonSizes.vSmallestSpace,
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            children:
                orderOptions.asMap().entries.map((entry) {
                  final index = entry.key;
                  final option = entry.value;
                  final label = orderLabels[index];

                  return RadioListTile<String>(
                    activeColor: Utils(context).secondary,
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.sp),
                    title: Text(
                      label,
                      style: Utils(
                        context,
                      ).normalText.copyWith(color: Utils(context).primary),
                    ),
                    value: option,
                    groupValue: selectedOrderBy,
                    onChanged: (String? value) {
                      if (value != null) {
                        onOrderByChanged(value);
                      }
                    },
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
