import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class ToggleWidget extends StatelessWidget {
  const ToggleWidget(
      {super.key,
      required this.values,
      required this.state,
      required this.onTap});

  final List<String> values;
  final bool state;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenWidth * 0.12,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: ScreenUtil().screenWidth * 0.13,
              decoration: ShapeDecoration(
                color: Utils(context).disableGreyButton,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().screenWidth * 0.1),
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
                      fontWeight: FontWeight.bold,
                      color: const Color(0xAA000000),
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
              width: ScreenUtil().screenWidth * 0.5,
              height: ScreenUtil().screenWidth * 0.13,
              decoration: ShapeDecoration(
                color: Utils(context).primary,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().screenWidth * 0.1),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                (state ? values[0] : values[1]).tr(),
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Utils(context).white,
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
