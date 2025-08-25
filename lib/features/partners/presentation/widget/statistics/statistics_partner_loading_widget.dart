import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class StatisticsPartnerLoadingWidget extends StatelessWidget {
  const StatisticsPartnerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 11.sp,
            crossAxisSpacing: 12.sp,
            childAspectRatio: 9 / 3.5,
            crossAxisCount: 2,
          ),
          itemBuilder: (_, __) => _shimmerCard(),
        ),

        Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: _shimmerCard(width: double.infinity, height: 70.h),
        ),
      ],
    );
  }

  Widget _shimmerCard({double? width, double? height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 70.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade200),
        ),
      ),
    );
  }
}
