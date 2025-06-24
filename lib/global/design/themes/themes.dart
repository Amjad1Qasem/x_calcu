import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/color_app.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class AppThemes {
  static ThemeData get light => _theme(
    brightness: Brightness.light,
    primaryColor: ColorManager.primaryColor,
    secondaryColor: ColorManager.secondaryColor,
    textColor: ColorManager.primaryTextColor,
    hintText: ColorManager.hintGrey,
    primaryFixed: ColorManager.navyBlue,
    lighterGrey: ColorManager.lighterGrey,
    greyText: ColorManager.textGrey,
    labelGrey: ColorManager.labelGrey,
    greyTextMedium: ColorManager.primaryGreyText,
    secondaryTextColor: ColorManager.secondaryText,
    scaffoldBackgroundColor: ColorManager.backgroundColor,
    backgroundColor: ColorManager.backgroundColor,
    surfaceColor: ColorManager.white,
    disableGrey: ColorManager.disableGrey,

    primaryText: ColorManager.primaryTextColor,
    disableGreyButton: ColorManager.disableGreyButton,
    selectedColor: ColorManager.greenlight,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorManager.backgroundColor,
      systemNavigationBarColor: ColorManager.primaryColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    primaryContainer: ColorManager.softWhite,
  );

  static ThemeData get dark => _theme(
    brightness: Brightness.dark,
    primaryColor: ColorManager.secondaryBlue,
    secondaryColor: ColorManager.secondaryColor,
    textColor: ColorManager.white,
    //Text theme 1
    greyText: ColorManager.textGrey,
    hintText: ColorManager.white,
    labelGrey: ColorManager.white,
    greyTextMedium: ColorManager.white,
    lighterGrey: ColorManager.lighterGrey,
    primaryFixed: ColorManager.white,
    secondaryTextColor: ColorManager.grey,
    scaffoldBackgroundColor: ColorManager.pureBlack,
    backgroundColor: ColorManager.pureBlack,
    surfaceColor: ColorManager.primaryTextColor,
    primaryText: ColorManager.primaryTextColor,
    disableGrey: ColorManager.disableGrey,
    disableGreyButton: ColorManager.disableGreyButton,
    selectedColor: ColorManager.greenlight,
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: ColorManager.pureBlack,
      statusBarColor: ColorManager.pureBlack,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.softWhite,
    ),
    primaryContainer: ColorManager.softWhite,
  );

  static ThemeData _theme({
    required Brightness brightness,
    required Color primaryColor,
    required Color secondaryColor,
    required Color textColor,
    required Color primaryText,
    required Color hintText,
    required Color greyText,
    required Color lighterGrey,
    required Color labelGrey,
    required Color disableGreyButton,
    required Color primaryFixed,
    required Color greyTextMedium,
    required Color secondaryTextColor,
    required Color scaffoldBackgroundColor,
    required Color backgroundColor,
    required Color surfaceColor,
    Color? primaryContainer,
    required Color disableGrey,
    required Color selectedColor,
    required SystemUiOverlayStyle systemOverlayStyle,
    required BottomNavigationBarThemeData bottomNavigationBarTheme,
  }) {
    return ThemeData(
      brightness: brightness,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      colorScheme: ColorScheme(
        primaryContainer: primaryContainer,
        brightness: brightness,
        onPrimaryFixed: secondaryTextColor,
        primary: primaryColor,
        onPrimary: secondaryColor,
        secondary: secondaryColor,
        onSecondary: primaryColor,
        scrim: hintText,
        secondaryFixed: primaryText,
        tertiary: disableGrey,
        onTertiary: greyText,
        onSecondaryFixed: lighterGrey,
        surface: surfaceColor,
        onSurface: textColor,
        onInverseSurface: greyTextMedium,
        surfaceContainer: disableGreyButton,
        error: ColorManager.red,
        onError: textColor,
        primaryFixed: primaryFixed,
        onTertiaryContainer: labelGrey,
        onSecondaryFixedVariant: selectedColor,
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: systemOverlayStyle,
        backgroundColor: scaffoldBackgroundColor,
        foregroundColor: textColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorManager.secondaryColor,
      ),
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: textColor, fontSize: 18.sp),
        bodySmall: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
        labelSmall: TextStyle(color: secondaryColor, fontSize: 14.sp),
        headlineLarge: TextStyle(
          color: primaryColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: textColor,
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: secondaryColor,
          fontSize: 16.sp,
          decorationThickness: 1,
          decorationColor: secondaryColor,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(color: textColor, fontSize: 15.sp),
        titleMedium: TextStyle(color: hintText, fontSize: 15.sp),
        titleSmall: TextStyle(color: secondaryTextColor, fontSize: 16.sp),
        labelLarge: TextStyle(
          color: backgroundColor,
          fontSize: 16.sp,
          // fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: greyTextMedium,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
        displayMedium: TextStyle(color: textColor, fontSize: 13.sp),
        displaySmall: TextStyle(
          color: labelGrey,
          // fontWeight: FontWeight.w400,
          fontSize: 14.sp,
        ),
        displayLarge: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
        bodyLarge: TextStyle(
          color: greyTextMedium,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      fontFamily: "Cairo",
    );
  }
}

extension Utils on BuildContext {
  // TextStyle get blueBigText => Theme.of(this).textTheme.headlineLarge!;

  TextStyle get primaryText => Theme.of(this).textTheme.bodyMedium!;

  TextStyle get normalText => Theme.of(this).textTheme.titleLarge!;

  TextStyle get primarySmallText => Theme.of(this).textTheme.bodySmall!;

  TextStyle get blackBigText =>
      Theme.of(this).textTheme.headlineMedium!; //24=>22

  TextStyle get blueHeadlineText => Theme.of(this).textTheme.headlineLarge!;

  TextStyle get clickbleText => Theme.of(this).textTheme.headlineSmall!;

  TextStyle get secondText => Theme.of(this).textTheme.titleSmall!;

  TextStyle get hintText => Theme.of(this).textTheme.titleMedium!;

  TextStyle get buttonText => Theme.of(this).textTheme.labelLarge!;

  TextStyle get greyTextMedium =>
      isLightTheme
          ? Theme.of(this).textTheme.labelMedium!
          : Theme.of(
            this,
          ).textTheme.labelMedium!.copyWith(color: const Color(0xffA4A6AB));

  TextStyle get smallLableGrey => Theme.of(this).textTheme.displaySmall!;

  TextStyle get largLableGrey => Theme.of(this).textTheme.displayLarge!;

  TextStyle get subeTitle => Theme.of(this).textTheme.displayMedium!;

  TextStyle get smallLable => Theme.of(this).textTheme.labelSmall!;

  TextStyle get titleBold => Theme.of(this).textTheme.titleSmall!;

  TextStyle get greyTextBlod => Theme.of(this).textTheme.bodyLarge!;

  /// saleh text style
  ///
  TextStyle get smallBodyGray =>
      isLightTheme
          ? Theme.of(this).textTheme.displaySmall!
          : Theme.of(
            this,
          ).textTheme.displaySmall!.copyWith(color: const Color(0xffB0B3B8));

  /// end of saleh text styles
  //colors
  Color get primary => Theme.of(this).colorScheme.primary;

  Color get blackText => Theme.of(this).colorScheme.secondaryFixed;

  // Color get primText => Theme.of(this).colorScheme.primary;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get primTextColor => Theme.of(this).colorScheme.onSurface;

  Color get lightGray => Theme.of(this).colorScheme.onTertiary;

  Color get lighterGray => Theme.of(this).colorScheme.onSecondaryFixed;

  Color get disableGrey => Theme.of(this).colorScheme.tertiary;

  Color get disableGreyButton => Theme.of(this).colorScheme.surfaceContainer;

  Color get white => Theme.of(this).colorScheme.surface;

  Color get red => Theme.of(this).colorScheme.error;

  Color get secondTextColor => Theme.of(this).colorScheme.onPrimaryFixed;

  Color get primaryGray => Theme.of(this).colorScheme.onSurface;

  Color get thirdgray => Theme.of(this).colorScheme.onInverseSurface;

  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;

  Color get navyBlue => Theme.of(this).colorScheme.primaryFixed;

  Color get midGrey => Theme.of(this).colorScheme.onTertiaryContainer;

  /// saleh new colors
  ///
  bool get isLightTheme => Theme.of(this).brightness == Brightness.light;

  Color get backgroundColor =>
      isLightTheme ? ColorManager.backgroundColor : ColorManager.pureBlack;
  // isLightTheme ? Colors.white : const Color(0xFF121212);

  Color get darkCardColor =>
      isLightTheme ? Colors.white : const Color(0xFF242424);

  Color? get skeletonBaseColor =>
      isLightTheme ? Colors.grey[200] : Colors.grey[700];

  Color? get skeletonHighlightColor =>
      isLightTheme ? Colors.grey[100] : Colors.grey[600];

  Color? get commentCardColor =>
      isLightTheme ? Colors.grey[200] : const Color(0xFF242424);

  Color get shadowColor =>
      isLightTheme
          ? Colors.grey.withValues(alpha: 0.8)
          : Colors.black.withValues(alpha: 0.2);

  Color get optionFirstColor =>
      isLightTheme ? Colors.cyan[50]! : const Color(0xFF333333);

  Color get optionSecondColor =>
      isLightTheme ? Colors.grey[200]! : const Color(0xFF525252);

  Color get newLightGray =>
      isLightTheme ? const Color(0xffEAEAEA) : const Color(0xff333333);

  Color get background =>
      isLightTheme ? ColorManager.white : ColorManager.pureBlack;

  Color get backgroundSvgImages =>
      isLightTheme ? Colors.transparent : ColorManager.pureBlack;

  Color get dividerColor =>
      isLightTheme ? ColorManager.disableGrey : ColorManager.primaryGreyText;

  Color get appBarIconsColor =>
      isLightTheme ? ColorManager.primaryColor : ColorManager.white;

  Color get greyColor =>
      isLightTheme ? ColorManager.labelGrey : ColorManager.white;
}
