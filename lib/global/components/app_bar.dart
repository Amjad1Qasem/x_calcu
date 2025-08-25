import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class AppBarShredWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarShredWidget({
    super.key,
    required this.title,
    this.leading,
    this.isBack,
    this.backClick,
    this.actions,
    this.backgroundColor = Colors.white,
  });

  final String title;
  final Widget? leading;
  final bool? isBack;
  Function()? backClick;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsIconTheme: IconThemeData(
        size: 24.sp,
        color: Utils(context).appBarIconsColor,
      ),
      backgroundColor: Utils(context).backgroundColor,
      surfaceTintColor: Utils(context).backgroundColor,
      toolbarHeight: 50.h,
      centerTitle: true,
      leading:
          isBack == true
              ? GestureDetector(
                onTap: () => backClick ?? Navigator.pop(context),
                child: Icon(
                  color: Utils(context).appBarIconsColor,
                  Icons.arrow_back_ios_rounded,
                  size: 18.sp,
                ),
              )
              : leading,
      title: Text(
        title,
        style: Utils(context).blueHeadlineText.copyWith(fontSize: 16.sp),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
