import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class DateRangeSection extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final ValueChanged<DateTime?> onStartDateChanged;
  final ValueChanged<DateTime?> onEndDateChanged;

  const DateRangeSection({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.startDateController,
    required this.endDateController,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'date_range'.tr(),
          style: Utils(context).normalText.copyWith(
            color: Utils(context).primary,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        CommonSizes.vSmallestSpace,
        Row(
          children: [
            Expanded(
              child: _buildDateField(
                context,
                label: 'from_date'.tr(),
                controller: startDateController,
                selectedDate: startDate,
                onDateChanged: onStartDateChanged,
              ),
            ),
            CommonSizes.hSmallestSpace,
            Expanded(
              child: _buildDateField(
                context,
                label: 'to_date'.tr(),
                controller: endDateController,
                selectedDate: endDate,
                onDateChanged: onEndDateChanged,
                showClearButton: endDate != null,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDateField(
    BuildContext context, {
    required String label,
    required TextEditingController controller,
    required DateTime? selectedDate,
    required ValueChanged<DateTime?> onDateChanged,
    bool showClearButton = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Utils(
            context,
          ).normalText.copyWith(color: Utils(context).primary, fontSize: 14.sp),
        ),
        CommonSizes.vSmallestSpace,
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: GestureDetector(
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: selectedDate ?? DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                onDateChanged(picked);
                controller.text =
                    '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
              child: Row(
                children: [
                  Icon(
                    Iconsax.calendar_1_copy,
                    color: Utils(context).secondTextColor,
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      controller.text.isEmpty ? 'dd/mm/yyyy' : controller.text,
                      style: Utils(context).normalText.copyWith(
                        color:
                            controller.text.isEmpty
                                ? Utils(context).secondTextColor
                                : Utils(context).primTextColor,
                      ),
                    ),
                  ),
                  if (showClearButton)
                    GestureDetector(
                      onTap: () {
                        onDateChanged(null);
                        controller.clear();
                      },
                      child: Icon(
                        Icons.close,
                        color: Utils(context).red,
                        size: 20.sp,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
