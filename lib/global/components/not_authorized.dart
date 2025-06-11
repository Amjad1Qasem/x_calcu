import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/constant/app_images.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class CheckAuthorizedWidget extends StatelessWidget {
  const CheckAuthorizedWidget({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    if (!getIt<AppStateModel>().isAuthenticated) {
      return Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.loginRequired),
            CommonSizes.vSmallSpace,
            Text('login_required'.tr(),
                style: Utils(context).blackBigText.copyWith(fontSize: 20.sp)),
            CommonSizes.vSmallSpace,
            AppButton(
              label: "login_now".tr(),
              textStyle: Utils(context).buttonText.copyWith(fontSize: 12.sp),
              onTap: () {
                context.go('/login');
              },
              width: double.infinity,
              padding: const EdgeInsets.all(0),
              raduis: 8,
            )
          ],
        )),
      );
    } else {
      return child;
    }
  }
}
