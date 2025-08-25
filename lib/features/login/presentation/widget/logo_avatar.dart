import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/utils/constant/app_images.dart';

class LogoAvatar extends StatelessWidget {
  const LogoAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Image.asset(AppImages.logo, width: 220.w, height: 220.h),
      ),
    );
  }
}
