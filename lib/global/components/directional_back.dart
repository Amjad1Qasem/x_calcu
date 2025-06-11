import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as txt;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DirectionalBackButton extends StatelessWidget {
  const DirectionalBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: EasyLocalization.of(context)!.locale.languageCode == 'ar'
            ? txt.TextDirection.rtl
            : txt.TextDirection.ltr,
        child: Image.asset(
          'assets/images/back_button.png',
          height: 35.h,
          matchTextDirection: true,
        ));
  }
}
