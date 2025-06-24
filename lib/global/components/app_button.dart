import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class AppButton extends StatelessWidget {
  const AppButton({
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
    this.raduis = 38,
    this.loading = false,
    this.gradient,
    this.textStyle,
    this.icon,
    this.isBorder = false,
  });

  final String label;
  final bool? loading;
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
  final double? raduis;
  final TextStyle? textStyle;
  final bool isBorder;
  final IconData? icon;
  // final Widget? specialWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: GestureDetector(
        onTap:
            disable || loading == true
                ? () => {}
                : onTap ?? () => {printInfo("empty click")},
        child: Container(
          height: height?.h ?? 42.h,
          width: width ?? double.infinity,
          // padding: EdgeInsets.symmetric(vertical: 20.w),
          decoration: BoxDecoration(
            border:
                isBorder
                    ? Border.all(
                      width: 1,
                      color: color ?? Utils(context).primary,
                    )
                    : null,
            gradient: gradient ?? gradient,
            color:
                isBorder == false
                    ? disable
                        ? Utils(context).lightGray
                        : color ?? Utils(context).primary
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(raduis!),
          ),
          child: Center(
            child:
                loading == true
                    ? Container(
                      height: 40.h,
                      width: 40.h,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 10.h,
                      ),
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Utils(context).white,
                      ),
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: icon != null,
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(end: 8.w),
                            child: Icon(
                              icon,
                              size: 18.sp,
                              color: Utils(context).secondTextColor,
                            ),
                          ),
                        ),
                        Text(
                          label,
                          textAlign: TextAlign.center,
                          style:
                              textStyle ??
                              Utils(context).buttonText.copyWith(
                                color:
                                    isBorder == true
                                        ? disable
                                            ? Utils(context).lightGray
                                            : color ?? Utils(context).primary
                                        : Utils(context).white,
                              ),
                        ),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}

class AppButtonIcon extends StatelessWidget {
  const AppButtonIcon({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.disable = false,
    this.color,
    this.fontColor,
    this.fontSize,
    this.raduis = 50,
    this.gradient,
  });

  final String label;
  final String icon;
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
  final double? raduis;
  // final Widget? specialWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: InkWell(
        onTap: disable ? () => {} : onTap ?? () => {printInfo("empty click")},
        child: Container(
          height: height ?? 120.h,
          width: width ?? 200.w,
          // padding: EdgeInsets.symmetric(vertical: 20.w),
          decoration: BoxDecoration(
            // gradient: gradient ?? gradient,
            color: Utils(context).primary,
            // color:
            //     disable ? Colors.grey : color ?? Utils(context).primary,
            borderRadius: BorderRadius.circular(raduis!),
          ),
          child: Center(child: Text(label, style: Utils(context).buttonText)),
        ),
      ),
    );
  }
}
