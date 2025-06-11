

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class ScrollingTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double maxWidth;
  final double height;
  final TextAlign? align;

  const ScrollingTextWidget({
    super.key,
    required this.text,
    this.style,
    this.align,
    required this.maxWidth,
    this.height = 25.0,
  });

  bool _doesTextOverflow(String text, TextStyle style, double maxWidth) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: double.infinity);
    return textPainter.width > maxWidth;
  }

  @override
  Widget build(BuildContext context) {
    final defaultStyle = style ?? const TextStyle(fontSize: 16.0);

    final bool isOverflowing = _doesTextOverflow(text, defaultStyle, maxWidth);

    return SizedBox(
      height: height,
      width: maxWidth,
      child: isOverflowing
          ? Marquee(
              text: text,
              style: defaultStyle,
              scrollAxis: Axis.horizontal,
              blankSpace: 20.0,
              velocity: 30.0,
              pauseAfterRound: const Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration: const Duration(milliseconds: 500),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            )
          : Text(
              text,
              style: defaultStyle,
              textAlign: align,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
    );
  }
}
