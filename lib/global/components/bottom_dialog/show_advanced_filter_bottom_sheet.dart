import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/bottom_dialog/filter_components/date_range_section.dart';
import 'package:x_calcu/global/components/bottom_dialog/filter_components/filter_actions.dart';
import 'package:x_calcu/global/components/bottom_dialog/filter_components/filter_header.dart';
import 'package:x_calcu/global/components/bottom_dialog/filter_components/sort_order_section.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class FilterData {
  final String orderBy;
  final DateTime? startDate;
  final DateTime? endDate;

  FilterData({required this.orderBy, this.startDate, this.endDate});
}

Future<void> showAdvancedFilterBottomSheet(
  BuildContext context,
  FilterData currentFilter,
  ValueChanged<FilterData> onFilterApplied, {
  double? height = 900,
}) async {
  String selectedOrderBy = currentFilter.orderBy;
  DateTime? startDate = currentFilter.startDate;
  DateTime? endDate = currentFilter.endDate;

  final startDateController = TextEditingController(
    text:
        startDate != null
            ? '${startDate.day.toString().padLeft(2, '0')}/${startDate.month.toString().padLeft(2, '0')}/${startDate.year}'
            : '',
  );
  final endDateController = TextEditingController(
    text:
        endDate != null
            ? '${endDate.day.toString().padLeft(2, '0')}/${endDate.month.toString().padLeft(2, '0')}/${endDate.year}'
            : '',
  );

  List<String> orderOptions = ['asc', 'desc'];

  List<String> orderLabels = [
    'from_oldest_to_newest'.tr(),
    'from_newest_to_oldest'.tr(),
  ];

  await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.7,
            minChildSize: 0.5,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
                  left: 20.sp,
                  right: 20.sp,
                  top: 20.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'filter_and_sort'.tr(),
                          style: TextStyle(
                            color: Utils(context).primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Iconsax.close_circle,
                            color: Utils(context).primTextColor,
                            size: 24.sp,
                          ),
                        ),
                      ],
                    ),
                    CommonSizes.vSmallSpace,

                    // Sort Order Section
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
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.sp,
                                ),
                                title: Text(
                                  label,
                                  style: Utils(context).normalText.copyWith(
                                    color: Utils(context).primary,
                                  ),
                                ),
                                value: option,
                                groupValue: selectedOrderBy,
                                onChanged: (String? value) {
                                  if (value != null) {
                                    setState(() {
                                      selectedOrderBy = value;
                                    });
                                  }
                                },
                              );
                            }).toList(),
                      ),
                    ),
                    CommonSizes.vSmallSpace,

                    // Date Range Section
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'from_date'.tr(),
                                style: Utils(context).normalText.copyWith(
                                  color: Utils(context).primary,
                                  fontSize: 14.sp,
                                ),
                              ),
                              CommonSizes.vSmallestSpace,
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    final DateTime? picked =
                                        await showDatePicker(
                                          context: context,
                                          initialDate:
                                              startDate ?? DateTime.now(),
                                          firstDate: DateTime(2020),
                                          lastDate: DateTime(2100),
                                        );
                                    if (picked != null) {
                                      setState(() {
                                        startDate = picked;
                                        startDateController.text =
                                            '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
                                      });
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 15.h,
                                    ),
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
                                            startDateController.text.isEmpty
                                                ? 'dd/mm/yyyy'
                                                : startDateController.text,
                                            style: Utils(
                                              context,
                                            ).normalText.copyWith(
                                              color:
                                                  startDateController
                                                          .text
                                                          .isEmpty
                                                      ? Utils(
                                                        context,
                                                      ).secondTextColor
                                                      : Utils(
                                                        context,
                                                      ).primTextColor,
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: startDate != null,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                startDate = null;
                                                startDateController.clear();
                                              });
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Utils(context).red,
                                              size: 20.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CommonSizes.hSmallestSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'to_date'.tr(),
                                style: Utils(context).normalText.copyWith(
                                  color: Utils(context).primary,
                                  fontSize: 14.sp,
                                ),
                              ),
                              CommonSizes.vSmallestSpace,
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    final DateTime? picked =
                                        await showDatePicker(
                                          context: context,
                                          initialDate:
                                              endDate ?? DateTime.now(),
                                          firstDate: DateTime(2020),
                                          lastDate: DateTime(2100),
                                        );
                                    if (picked != null) {
                                      setState(() {
                                        endDate = picked;
                                        endDateController.text =
                                            '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
                                      });
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 15.h,
                                    ),
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
                                            endDateController.text.isEmpty
                                                ? 'dd/mm/yyyy'
                                                : endDateController.text,
                                            style: Utils(
                                              context,
                                            ).normalText.copyWith(
                                              color:
                                                  endDateController.text.isEmpty
                                                      ? Utils(
                                                        context,
                                                      ).secondTextColor
                                                      : Utils(
                                                        context,
                                                      ).primTextColor,
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: endDate != null,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                endDate = null;
                                                endDateController.clear();
                                              });
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Utils(context).red,
                                              size: 20.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CommonSizes.vSmallSpace,

                    // Clear Date Range Button
                    if (startDate != null || endDate != null)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            startDate = null;
                            endDate = null;
                            startDateController.clear();
                            endDateController.clear();
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Iconsax.close_circle,
                              size: 16.sp,
                              color: Utils(context).red,
                            ),
                            CommonSizes.hTheSmallestSpace,
                            Text(
                              'clear_date_range'.tr(),
                              style: Utils(context).normalText.copyWith(
                                color: Utils(context).primary,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                    CommonSizes.vSmallerSpace,

                    // Apply Filter Button
                    AppButton(
                      label: 'apply_filter'.tr(),
                      onTap: () {
                        final filterData = FilterData(
                          orderBy: selectedOrderBy,
                          startDate: startDate,
                          endDate: endDate,
                        );
                        onFilterApplied(filterData);
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    },
  );
}
