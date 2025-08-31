import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class AppBarSearchWidget extends StatelessWidget {
  const AppBarSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
        margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 0.w),
        decoration: BoxDecoration(
          color: Utils(context).primaryContainer,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          children: [
            Icon(
              Iconsax.search_normal_1_copy,
              color: Utils(context).primTextColor,
              size: 20.sp,
            ),
            CommonSizes.hSmallestSpace,
            Text(
              'search_processes'.tr(),
              style: Utils(context).normalText.copyWith(fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
