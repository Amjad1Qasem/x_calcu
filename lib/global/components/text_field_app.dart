import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class TextFieldApp extends StatelessWidget {
  final int maxLines;
  final String hintText;
  final String? Function(String?)? validation;
  final void Function(String)? onChanged;
  final void Function()? iconClick;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final TextInputType? keyboardType;
  final bool? isPassword;
  final TextStyle? style;
  final bool? enable;
  final Color? iconColor;
  final int? maxLength;
  final TextEditingController? controller;
  final bool obscureText;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final String? errorText;
  final String? suffixText;
  final String? prefixText;
  final bool readOnly;
  final EdgeInsetsGeometry? padding;
  final int? hintMaxLines;
  final bool handleDirectionalityforReadOnlyMode;
  final List<String>? autofillHints;
  final TextInputAction? textInputAction;

  const TextFieldApp({
    super.key,
    this.maxLines = 1,
    this.onChanged,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.iconClick,
    this.iconColor,
    this.keyboardType,
    this.maxLength,
    this.isPassword,
    this.validation,
    this.enable = true,
    this.obscureText = false,
    this.focusNode,
    this.onFieldSubmitted,
    this.errorText,
    this.suffixText,
    this.prefixText,
    this.padding,
    this.hintMaxLines,
    this.readOnly = false,
    this.handleDirectionalityforReadOnlyMode = false,
    this.autofillHints,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: 10.h),
      child: TextFormField(
        textInputAction: textInputAction,
        autofillHints: autofillHints,
        readOnly: readOnly,
        maxLength: maxLength ?? 99,
        maxLines: maxLines,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: isPassword ?? false,
        validator: validation,
        enabled: enable,
        onChanged: onChanged,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: style ?? Utils(context).normalText,
        decoration: InputDecoration(
          prefixIcon:
              prefixText != null
                  ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 14.h,
                    ),
                    child: Text(
                      prefixText!,
                      style: Utils(
                        context,
                      ).normalText.copyWith(fontWeight: FontWeight.w600),
                    ),
                  )
                  : prefixIcon,
          suffixIcon:
              suffixText != null
                  ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 14.h,
                    ),
                    child: Text(
                      suffixText!,
                      style: Utils(
                        context,
                      ).normalText.copyWith(fontWeight: FontWeight.w600),
                    ),
                  )
                  : suffixIcon,
          counter: const SizedBox.shrink(),
          hintText: hintText,
          isDense: true,
          hintMaxLines: hintMaxLines,
          hintStyle: style ?? Utils(context).hintText.copyWith(fontSize: 14.sp),

          // labelStyle: Utils(context).blackBigText,
          contentPadding: EdgeInsets.symmetric(
            vertical: 14.sp,
            horizontal: 16.w,
          ),
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
              color:
                  readOnly
                      ? Utils(context).disableGrey
                      : Theme.of(context).primaryColor,
              width: readOnly ? 1.w : 1.5.w,
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
          errorMaxLines: 3,
          errorText: errorText,
          errorStyle: TextStyle(fontSize: 12.sp, color: Colors.red),
        ),
      ),
    );
  }
}
