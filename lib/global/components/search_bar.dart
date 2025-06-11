
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_calcu/global/design/color_app.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validation;
  final void Function()? iconClick;
  final String? prefixIcon;
  final TextStyle? style;
  final EdgeInsets? padding;
  final bool? enable;
  final Color? iconColor;
  final int? maxLength;
  final TextEditingController? controller;

  const SearchBarWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.style,
    this.padding,
    this.iconClick,
    this.iconColor,
    this.maxLength,
    this.validation,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: TextFormField(
          maxLength: maxLength ?? 99,
          controller: controller,
          keyboardType: TextInputType.text,
          obscureText: false,
          validator: validation,
          enabled: enable,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.right,
          style: style ?? Utils(context).normalText,
          decoration: InputDecoration(
            counter: const SizedBox.shrink(),
            hintText: hintText,
            hintStyle: style ?? Utils(context).normalText,
            // labelStyle: Utils(context).blackBigText,
            contentPadding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 16.w,
            ),
            prefixIcon: prefixIcon != null
                ? InkWell(
                    onTap: iconClick,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: SvgPicture.asset(prefixIcon!,
                          height: 10.sp, color: ColorManager.secondaryBlue),
                    ),
                  )
                : null,
            filled: true,
            fillColor: Utils(context).white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Utils(context).disableGrey,
                width: 1.w,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Utils(context).disableGrey,
                width: 1.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: ColorManager.secondaryBlue,
                width: 1.5.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 1.5.w,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 1.5.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
