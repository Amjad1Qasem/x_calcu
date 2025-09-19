import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class LoginAsGuest extends StatelessWidget {
  const LoginAsGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(RouterPath.mainLayout),
      child: Container(
        width: double.infinity,
        height: 40.h,
        decoration: BoxDecoration(
          color: Utils(context).primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Utils(context).primary, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Iconsax.user, color: Utils(context).primary, size: 20.sp),
            SizedBox(width: 12.w),
            Text(
              'login_as_guest'.tr(),
              style: Utils(context).normalText.copyWith(
                color: Utils(context).primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
