import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/text_field_app.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

Future<void> showFilterBottomSheet(
  BuildContext context,
  List<String> items,
  String selectedItem,
  ValueChanged<String> onItemSelected, {
  double? height = 900,
}) async {
  await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    isScrollControlled: true, // ضروري جداً
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.65,
        minChildSize: 0.4,
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
                Text(
                  'filter_by_date'.tr(),
                  style: TextStyle(
                    color: Utils(context).primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CommonSizes.vSmallestSpace,
                SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return RadioListTile<String>(
                        activeColor: Utils(context).secondary,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          item.tr(),
                          style: Utils(
                            context,
                          ).normalText.copyWith(color: Utils(context).primary),
                        ),
                        value: item,
                        groupValue: selectedItem,
                        onChanged: (String? value) {
                          if (value != null) {
                            onItemSelected(value);
                            Navigator.pop(context);
                          }
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 12.h),
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
                            ),
                          ),
                          TextFieldApp(
                            prefixIcon: Icon(Iconsax.calendar_1_copy),
                            hintText: 'mm/dd/yyyy',
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
                            ),
                          ),
                          TextFieldApp(
                            prefixIcon: Icon(Iconsax.calendar_1_copy),
                            hintText: 'mm/dd/yyyy',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CommonSizes.vSmallSpace,
                AppButton(label: 'search'.tr(), padding: EdgeInsets.zero),
              ],
            ),
          );
        },
      );
    },
  );
}
