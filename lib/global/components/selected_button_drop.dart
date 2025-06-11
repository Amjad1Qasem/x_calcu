
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/color_app.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class SelectedButtonDrop extends StatelessWidget {
  const SelectedButtonDrop({
    super.key,
    required this.label,
    this.onTap,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.isSelected = false,
    this.color,
  });

  final String label;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Function()? onTap;
  final bool isSelected;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 14.sp),
        decoration: BoxDecoration(
            color: isSelected ? Utils(context).primary : Utils(context).white,
            border: Border.all(color: Utils(context).primary, width: 1.5),
            borderRadius: BorderRadius.circular(100.r)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: ColorManager.white.withValues(alpha: 0.4),
              maxRadius: 14.r,
              child: Icon(
                Icons.close,
                color: ColorManager.white,
                size: 14.sp,
              ),
            ),
            CommonSizes.hSmallestSpace,
            Flexible(
              child: Text(label,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: isSelected
                      ? Utils(context).buttonText.copyWith(fontSize: 15.sp)
                      : Utils(context)
                          .blueHeadlineText
                          .copyWith(fontSize: 15.sp)),
            ),
          ],
        ),
      ),
    );
  }
}
