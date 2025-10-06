import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;
  final String? title;

  const AuthGuard({super.key, required this.child, this.title});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = getIt<AppStateModel>().isAuthenticated;

    return isLoggedIn
        ? child
        : Center(
          child: Container(
            width: 500.w,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildWarningIcon(500.w * 0.5),
                CommonSizes.vSmallestSpace,
                _buildMessageText(context, 500.w * 0.5),
                CommonSizes.vSmallestSpace,
                _buildRetryButton(context, 500.w * 0.5),
              ],
            ),
          ),
        );
  }

  Widget _buildWarningIcon(double containerHeight) {
    double imageSize = containerHeight * 0.5;

    return Flexible(
      child: Image.asset(
        'assets/images/unauthorized.png',
        width: imageSize.w,
        height: imageSize.h,
      ),
    );
  }

  Widget _buildMessageText(BuildContext context, double containerHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        children: [
          Text(
            'login_required'.tr(),
            style: Utils(
              context,
            ).blackBigText.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          CommonSizes.vSmallestSpace,
          Text(
            'you_need_to_login_to_access_this_page'.tr(),
            style: Utils(context).normalText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRetryButton(BuildContext context, double containerHeight) {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: GestureDetector(
        onTap: () {
          print("Button pressed - navigating to login");
          context.go(RouterPath.loginScreen);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'login'.tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Iconsax.login, color: Colors.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
