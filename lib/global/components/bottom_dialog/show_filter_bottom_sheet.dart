
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/common_sizes.dart';

Future<void> showFilterBottomSheet(
  BuildContext context,
  List<String> items,
  String selectedItem,
  ValueChanged<String> onItemSelected, {
  double? height = 300,
}) async {
  await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
        height: height, // You can adjust the height of the bottom sheet
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'sort_by'.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            CommonSizes.vSmallestSpace,
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    title: Text(item.tr()),
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
          ],
        ),
      );
    },
  );
}
