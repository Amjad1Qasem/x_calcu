import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/showcase_helper.dart';

/// Button to start the showcase tutorial
class ShowcaseButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final String? description;

  const ShowcaseButton({
    super.key,
    this.onPressed,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: Utils(context).primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(Iconsax.eye, color: Utils(context).primary, size: 20.sp),
      ),
      title: Text(
        title ?? 'start_tutorial'.tr(),
        style: Utils(context).normalText.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        description ?? 'tutorial_description'.tr(),
        style: Utils(context).secondText.copyWith(fontSize: 12.sp),
      ),
      trailing: Icon(
        Iconsax.arrow_left_2,
        color: Utils(context).secondTextColor,
        size: 16.sp,
      ),
      onTap: onPressed ?? () => _startShowcase(context),
    );
  }

  void _startShowcase(BuildContext context) {
    ShowcaseHelper.startShowcase(context);
  }
}

/// Floating action button for showcase
class ShowcaseFAB extends StatelessWidget {
  final VoidCallback? onPressed;

  const ShowcaseFAB({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed ?? () => _startShowcase(context),
      backgroundColor: Utils(context).primary,
      child: Icon(Iconsax.eye, color: Colors.white, size: 24.sp),
    );
  }

  void _startShowcase(BuildContext context) {
    ShowcaseHelper.startShowcase(context);
  }
}

/// Showcase widget wrapper
class ShowcaseWrapper extends StatelessWidget {
  final Widget child;
  final int showcaseKey;
  final String? title;
  final String? description;
  final Color? color;

  const ShowcaseWrapper({
    super.key,
    required this.child,
    required this.showcaseKey,
    this.title,
    this.description,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final data = ShowcaseDataProvider.getData(showcaseKey);

    return Showcase(
      key: ShowcaseHelper.getShowcaseKey(showcaseKey),
      title: title ?? data.title,
      description: description ?? data.description,
      child: child,
    );
  }
}
