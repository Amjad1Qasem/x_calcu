import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class AnimatedToggleButton extends StatelessWidget {
  const AnimatedToggleButton({
    super.key,
    required this.values,
    required this.state,
    required this.onTap,
  });

  final List<String> values;
  final bool state;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenWidth * 0.11,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: ScreenUtil().screenWidth * 0.11,
              decoration: ShapeDecoration(
                color: Utils(context).primaryContainer,
                shadows: [
                  BoxShadow(
                    blurRadius: 0.5,
                    offset: Offset(0, 0),
                    color: Colors.black.withValues(alpha: 0.3),
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  values.length,
                  (index) => Text(
                    (state ? values[1] : values[0]).tr(),
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      color: Utils(context).primTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            alignment: state ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              width: ScreenUtil().screenWidth * 0.5,
              height: ScreenUtil().screenWidth * 0.11,
              decoration: ShapeDecoration(
                color: Utils(context).white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                (state ? values[0] : values[1]).tr(),
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Utils(context).primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
