import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.controller,
    this.onChanged,
    this.dropDownList,
    this.hintText,
    this.dropDownItemCount,
    this.padding,
    this.height,
  });

  final SingleValueDropDownController controller;
  final List<DropDownValueModel>? dropDownList;
  final String? hintText;
  final int? dropDownItemCount;
  final Function(dynamic)? onChanged;
  final EdgeInsetsGeometry? padding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    bool isArabic = getIt<AppStateModel>().locale.languageCode == "ar";
    return Container(
      padding: padding ?? EdgeInsets.symmetric(vertical: 7.sp),
      height: height,
      child: DropDownTextField(
        textFieldDecoration: InputDecoration(
          counter: const SizedBox.shrink(),
          hintText: hintText ?? 'select_item'.tr(),
          hintStyle: Utils(context).hintText,
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.sp,
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
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1.5.w,
            ),
          ),
        ),
        controller: controller,
        dropDownIconProperty: IconProperty(
          icon:
              isArabic ? Iconsax.arrow_left_2_copy : Iconsax.arrow_right_3_copy,
        ),
        searchDecoration: const InputDecoration(hintText: "Search"),
        validator: (value) => value == null ? "Required field" : null,
        dropDownItemCount: dropDownItemCount ?? 6,
        listTextStyle: Utils(context).secondText.copyWith(fontSize: 15.sp),
        dropDownList: dropDownList == null ? [] : dropDownList!,
        onChanged: onChanged,
        textStyle: Utils(context).secondText.copyWith(fontSize: 15.sp),
      ),
    );
  }
}
