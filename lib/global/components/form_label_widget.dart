
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/color_app.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class FormLabelWidget extends StatelessWidget {
  FormLabelWidget({
    super.key,
    required this.label,
    this.required = true,
    this.icon,
  });

  final String label;
  final bool? required;
  String? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon != null
            ? Padding(
                padding: EdgeInsets.only(right: 4.w),
                child: Image.asset(
                  icon!,
                  height: 20.sp,
                ),
              )
            : CommonSizes.shrink,
        Text(
          label.tr(),
          style: Utils(context)
              .primaryText
              .copyWith(color: Utils(context).primary, fontSize: 16.sp),
        ),
        Visibility(
          visible: required == true,
          child: Text(
            '*',
            style: Utils(context)
                .blueHeadlineText
                .copyWith(color: ColorManager.red),
          ),
        ),
      ],
    );
  }
}
