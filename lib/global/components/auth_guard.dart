import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/user_messages/popup_widget.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/constant/app_images.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;
  final String? title;

  const AuthGuard({super.key, required this.child, this.title});

  void _showLoginPopup(BuildContext context) {
    loginRequiredDialog(context: context);
  }

  void _handleTap(BuildContext context) {
    final isLoggedIn = getIt<AppStateModel>().isAuthenticated;

    if (!isLoggedIn) {
      _showLoginPopup(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = getIt<AppStateModel>().isAuthenticated;

    return GestureDetector(
      onTap: () => _handleTap(context),
      child: AbsorbPointer(
        absorbing: !isLoggedIn,
        child:
            isLoggedIn
                ? child
                : Center(
                  child: Container(
                    width: 500.w,
                    // height: containerHeight,
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.h,
                      vertical: 12.w,
                    ),
                    decoration: BoxDecoration(
                      // color: Colors.red,
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
    // double fontSize = (containerHeight * 0.08).clamp(12.sp, 18.sp);

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
    // double buttonHeight = (containerHeight * 0.15).clamp(30.h, 50.h);

    return FractionallySizedBox(
      widthFactor: 0.7,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          iconAlignment: IconAlignment.end,
          onPressed: () {
            _handleTap(context);
          },
          icon: const Icon(Iconsax.login, color: Colors.white),
          label: Text(
            'login'.tr(),
            style: const TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
