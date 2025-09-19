import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class PartnerDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final PartnerModel partner;
  final Widget? popupMenu;

  const PartnerDetailsAppBar({
    super.key,
    required this.partner,
    this.popupMenu,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: Utils(context).appBarIconsColor,
          size: 18.sp,
        ),
      ),
      actions: [popupMenu ?? const SizedBox.shrink()],
      title: Text(
        partner.name ?? 'Unknown Partner',
        style: Utils(context).blueHeadlineText.copyWith(fontSize: 16.sp),
      ),
      backgroundColor: Utils(context).background,
      surfaceTintColor: Utils(context).background,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
