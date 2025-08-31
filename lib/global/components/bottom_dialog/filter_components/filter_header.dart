import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class FilterHeader extends StatelessWidget {
  final VoidCallback onClose;

  const FilterHeader({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Row(
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
          onTap: onClose,
          child: Icon(
            Iconsax.close_circle,
            color: Utils(context).primTextColor,
            size: 24.sp,
          ),
        ),
      ],
    );
  }
}
