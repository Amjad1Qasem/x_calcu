import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class HomeBannerSkeleton extends StatelessWidget {
  const HomeBannerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = context.skeletonBaseColor;
    final highlightColor = context.skeletonHighlightColor;
    return Shimmer.fromColors(
      baseColor: baseColor!,
      highlightColor: highlightColor!,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Container(
          width: double.infinity,
          height: 180.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
