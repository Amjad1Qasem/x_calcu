import 'package:flutter/material.dart';

class ColorManager {
  //shades
  static Color pureWhite = Colors.white;
  static Color grey = const Color(0xFFD4D4D4);
  static Color disableGrey = const Color(0xFFD4D4D4);
  static Color disableGreyButton = const Color(0xFFEEEEEE);
  static Color textGrey = const Color(0xFF79838e);
  static Color labelGrey = const Color(0xFF666666);
  static Color hintGrey = const Color(0xFFC2C2C2);
  static Color primaryGreyText = const Color(0xFF525252);
  // static Color primaryText = const Color(0xFF333333);
  // static Color secondaryText = const Color(0xFF666666);
  static Color navyBlue = const Color(0xFF263238);
  static Color pureBlack = const Color(0xFF252525); //scaffold color dark
  static Color backgroundColor = const Color(0xFFfffdfd); //scaffold color dark

  //primary colors
  static Color primaryColor = const Color(0xFF2C3E50);
  static Color primaryTextColor = const Color(0xFF6b7280);
  static Color secondaryColor = const Color(0xFFff9900);
  static Color secondaryText = const Color(0xFF1e293b);
  static Color softWhite = Color(0xfff3f4f6); // Fonr Continers And Search Boxes
  static Color blueDivider = const Color.fromARGB(255, 194, 222, 255);
  static Color darkBlue = const Color(0xFF023366);
  static Color red = const Color(0xFFFF2828);
  static Color secondaryBlue = const Color(0xFF50B6FF);
  static Color blackText = const Color(0xff1e293b);
  static Color white = const Color(0xFFffffff);
  static Color softBlue = const Color(0xFFe7f3ff);
  static Color lighterGrey = const Color(0xFFd9d9d9);
  static Color greenDark = const Color(0xff19803d);
  static Color greenlight = const Color(0xff80FFAD);
  static Color greenTransparent = const Color(0xffF0FDF4);
  static Color redDark = const Color(0xffFF5656);
  static Color redLight = const Color(0xffFF9F9F);
  static Color redTransparent = const Color(0xfffdf0f1);
  static Color magenta = const Color(0xffDC2FFF);
  static Color bgDark = const Color(0xFF121212);

  static LinearGradient greenGradient = const LinearGradient(
    transform: GradientRotation(20),
    tileMode: TileMode.decal,
    colors: [Color(0xff73E342), Color(0xff55CA22)],
  );
  static LinearGradient blueGradient = const LinearGradient(
    end: Alignment.bottomCenter,
    begin: Alignment.topCenter,
    colors: [Color(0xff00509D), Color(0xff001C37)],
  );
}
