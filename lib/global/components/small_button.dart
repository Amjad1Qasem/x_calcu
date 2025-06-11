import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    super.key,
    required this.label,
    this.onTap,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.disable = false,
    this.color,
    this.fontColor,
    this.fontSize,
    this.raduis,
    this.gradient,
    this.isExpanded = true,
  });

  final String label;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Function()? onTap;
  final bool disable;
  final Color? color;
  final Color? fontColor;
  final LinearGradient? gradient;
  final double? fontSize;
  final double? width;
  final double? height;
  final bool? isExpanded;
  final double? raduis;

  // final Widget? specialWidget;

  @override
  Widget build(BuildContext context) {
    return isExpanded == true
        ? Expanded(
            child: Container(
              padding: padding ??
                  EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
              child: InkWell(
                onTap: disable
                    ? () => {}
                    : onTap ?? () => {debugPrint("empty click")},
                child: Container(
                  height: height,
                  width: width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                  decoration: BoxDecoration(
                      gradient: gradient ?? gradient,
                      color: color ?? Utils(context).primary,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          offset: Offset(0, 0),
                          color:
                              Utils(context).shadowColor.withValues(alpha: 0.4),
                        )
                      ],
                      borderRadius: BorderRadius.circular(raduis ?? 50.r)),
                  child: Center(
                    child: Text(label,
                        style: Utils(context).normalText.copyWith(
                            color: fontColor, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          )
        : Container(
            padding: padding ??
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: InkWell(
              onTap: disable
                  ? () => {}
                  : onTap ?? () => {debugPrint("empty click")},
              child: Container(
                height: height,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                decoration: BoxDecoration(
                    gradient: gradient ?? gradient,
                    color: color ?? Utils(context).primary,
                    borderRadius: BorderRadius.circular(raduis ?? 50.r)),
                child: Center(
                  child: Text(label,
                      style: Utils(context).normalText.copyWith(
                          color: fontColor, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          );
  }
}
