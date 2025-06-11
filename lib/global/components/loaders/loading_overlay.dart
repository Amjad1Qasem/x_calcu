import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class LoadingOverlay {
  BuildContext _context;
  static bool isLoading = false;

  void hide() {
    if (isLoading) {
      isLoading = false;
      Navigator.of(_context).pop();
    }
  }

  void show() async {
    if (!isLoading) {
      isLoading = true;
      await showDialog(
        context: _context,
        barrierDismissible: false,
        barrierColor: Colors.white.withAlpha(150),
        builder: (BuildContext context) => _FullScreenLoader(),
      );
    }
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) =>
      LoadingOverlay._create(context);
}

class _FullScreenLoader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FullScreenLoaderState();
}

class _FullScreenLoaderState extends State<_FullScreenLoader> {
  @override
  // Widget build(BuildContext context) => const WaitingWidget();
  Widget build(BuildContext context) => Center(
      child: Container(
          // padding: const EdgeInsets.all(50),
          width: MediaQuery.of(context).size.width / 2,
          height: 200.h,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Utils(context).black.withValues(alpha: 0.2),
                offset: const Offset(0, 2),
                spreadRadius: 1,
                blurRadius: 2)
          ], color: Colors.white, borderRadius: BorderRadius.circular(18.r)),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text('${'loading'.tr()}..'),
              )
            ],
          ))));
}
