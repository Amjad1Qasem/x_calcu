import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/notification/data/notification_model.dart';
import 'package:x_calcu/global/components/x_calc/animated_toggle_button.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class NotificationFilterWidget extends StatelessWidget {
  final NotificationType? selectedFilter;
  final Function(NotificationType?) onFilterChanged;

  const NotificationFilterWidget({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          // All Notifications Button
          Expanded(
            child: _buildFilterButton(
              context: context,
              label: 'all_notifications'.tr(),
              isSelected: selectedFilter == null,
              onTap: () => onFilterChanged(null),
            ),
          ),
          CommonSizes.hSmallestSpace,

          // Input Notifications Button
          Expanded(
            child: _buildFilterButton(
              context: context,
              label: 'input'.tr(),
              isSelected: selectedFilter == NotificationType.input,
              onTap: () => onFilterChanged(NotificationType.input),
            ),
          ),
          CommonSizes.hSmallestSpace,

          // Output Notifications Button
          Expanded(
            child: _buildFilterButton(
              context: context,
              label: 'output'.tr(),
              isSelected: selectedFilter == NotificationType.output,
              onTap: () => onFilterChanged(NotificationType.output),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? Utils(context).primary
                  : Utils(context).primaryContainer,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color:
                isSelected
                    ? Utils(context).primary
                    : Utils(context).primary.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Utils(context).primary,
          ),
        ),
      ),
    );
  }
}
