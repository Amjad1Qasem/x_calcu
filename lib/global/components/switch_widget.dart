import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSizeSwitch extends StatefulWidget {
  CustomSizeSwitch({
    super.key,
    required this.isSwitchOn,
    required this.onChange,
  });

  bool isSwitchOn;
  final Function(bool) onChange;

  @override
  _CustomSizeSwitchState createState() => _CustomSizeSwitchState();
}

class _CustomSizeSwitchState extends State<CustomSizeSwitch> {
  // late bool _isOn;

  // void initState() {
  //   super.initState();
  //   _isOn = widget.isSwitchOn;
  // }

  void _toggleSwitch() {
    setState(() {
      widget.isSwitchOn = !widget.isSwitchOn;
    });
    widget.onChange(widget.isSwitchOn);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 20.h,
            width: 36.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(360.r),
              color: widget.isSwitchOn
                  ? const Color(0xFF51b6ff)
                  : const Color(0xff94a3b8),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.easeIn,
            left: widget.isSwitchOn ? 15.0.sp : 0.0.sp,
            right: widget.isSwitchOn ? 0.0.sp : 15.0.sp,
            duration: const Duration(milliseconds: 200),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: 16.w,
                height: 16.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    widget.isSwitchOn ? Icons.check : Icons.close,
                    size: 14.sp,
                    color: widget.isSwitchOn
                        ? const Color(0xFF51b6ff)
                        : const Color(0xff94a3b8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
