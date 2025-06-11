import 'package:flutter/material.dart';

class ColorManager {
  //shades
  static Color pureWhite = Colors.white;
  static Color grey = const Color(0xFFD4D4D4);
  static Color disableGrey = const Color(0xFFD4D4D4);
  static Color disableGreyButton = const Color(0xFFEEEEEE);
  static Color textGrey = const Color(0xFF9E9E9E);
  static Color labelGrey = const Color(0xFF666666);
  static Color hintGrey = const Color(0xFFC2C2C2);
  static Color primaryGreyText = const Color(0xFF525252);
  static Color primaryText = const Color(0xFF333333);
  static Color secondaryText = const Color(0xFF666666);
  static Color navyBlue = const Color(0xFF263238);
  static Color pureBlack = const Color(0xFF252525); //scaffold color dark

  //primary colors
  static Color blue = const Color(0xFF00509D);
  static Color blueDivider = const Color.fromARGB(255, 194, 222, 255);
  static Color darkBlue = const Color(0xFF023366);
  static Color yellow = const Color(0xFFFDC500);
  static Color red = const Color(0xFFFF2828);
  static Color secondaryBlue = const Color(0xFF50B6FF);
  static Color blackText = const Color(0xff333333);
  static Color white = const Color(0xFFffffff);
  static Color softBlue = const Color(0xFFe7f3ff);
  static Color lighterGrey = const Color(0xFFd9d9d9);
  static Color green = const Color(0xff0BCA2A);
  static Color magenta = const Color(0xffDC2FFF);
  static Color bgDark = const Color(0xFF121212);
  static Color softblack = const Color.fromARGB(255, 19, 19, 19); //BNB Dark

  static LinearGradient greenGradient = const LinearGradient(
      transform: GradientRotation(20),
      tileMode: TileMode.decal,
      colors: [
        Color(0xff73E342),
        Color(0xff55CA22),
      ]);
  static LinearGradient blueGradient = const LinearGradient(
      end: Alignment.bottomCenter,
      begin: Alignment.topCenter,
      colors: [
        Color(0xff00509D),
        Color(0xff001C37),
      ]);
}
