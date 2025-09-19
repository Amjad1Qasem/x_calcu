import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class XCalCard extends StatelessWidget {
  const XCalCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.decoration,
    this.width,
    this.height,
    this.radius,
    this.shadow,
  });

  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final double? radius;
  final bool? shadow;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          padding:
              padding ?? EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          margin: margin,
          decoration:
              decoration ??
              BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(radius ?? 10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
          child: child,
        ),
        if (shadow ?? false)
          Container(
            width: double.infinity,
            height: 134,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(radius ?? 10),
            ),
            child: Text(''),
          ),
      ],
    );
  }
}
