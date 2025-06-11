
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/components/app_bar.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class Skaffold extends StatelessWidget {
  Skaffold({
    super.key,
    this.appBar,
    required this.body,
    this.title,
    this.leading,
    this.isBack,
    this.padding,
    this.image,
    this.isAppBarNull = true,
    this.backClick,
    this.actions,
    this.floatingButton,
  });

  final Widget body;
  String? title;
  String? image;
  bool? isBack;
  bool? isAppBarNull;
  Widget? leading;
  EdgeInsets? padding;
  Function()? backClick;
  Widget? floatingButton;
  PreferredSizeWidget? appBar;
  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils(context).backgroundColor,
      floatingActionButton: floatingButton,

      appBar: isAppBarNull == true
          ? null
          : appBar ??
              AppBarShredWidget(
                actions: actions,
                isBack: isBack ?? true,
                leading: leading,
                title: title ?? '',
              ),
      body: Padding(
        padding: padding ??
            EdgeInsetsDirectional.only(
              start: 16.w,
              end: 16.w,
              top: 10.h,
            ),
        child: body,
      ),
    );
  }
}
