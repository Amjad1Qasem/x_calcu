import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/constant/app_images.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class PartnerDetailsPopupMenu extends StatelessWidget {
  final PartnerModel partner;
  final VoidCallback onDeletePressed;

  const PartnerDetailsPopupMenu({
    super.key,
    required this.partner,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: PopupMenuButton(
        icon: Icon(Icons.menu, color: Utils(context).appBarIconsColor),
        iconColor: Utils(context).primary,
        color: Utils(context).darkCardColor,
        splashRadius: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        itemBuilder:
            (context) => [
              _buildDeleteMenuItem(context),
              _buildEditMenuItem(context),
              // _buildShareMenuItem(context),
            ],
      ),
    );
  }

  PopupMenuItem _buildDeleteMenuItem(BuildContext context) {
    return PopupMenuItem(
      padding: EdgeInsets.only(top: 12.h, bottom: 6.h, right: 12.w, left: 12.w),
      onTap: onDeletePressed,
      child: SizedBox(
        width: 130.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppImages.trashIcon,
              height: 22.h,
              colorFilter: ColorFilter.mode(
                Utils(context).red,
                BlendMode.srcIn,
              ),
            ),
            CommonSizes.hSmallestSpace,
            Expanded(
              child: Text(
                "delete".tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Utils(context).secondTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem _buildEditMenuItem(BuildContext context) {
    return PopupMenuItem(
      onTap: () => context.push(RouterPath.editPartnerScreen, extra: partner),
      padding: EdgeInsets.only(top: 12.h, bottom: 6.h, right: 12.w, left: 12.w),
      child: Row(
        children: [
          Icon(Iconsax.edit_copy, size: 20.sp, color: Utils(context).primary),
          CommonSizes.hSmallestSpace,
          Text(
            'edit'.tr(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Utils(context).secondTextColor,
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem _buildShareMenuItem(BuildContext context) {
    return PopupMenuItem(
      onTap: () {
        // TODO: Implement share functionality
      },
      padding: EdgeInsets.only(top: 12.h, bottom: 6.h, right: 12.w, left: 12.w),
      child: Row(
        children: [
          Icon(Iconsax.share_copy, size: 20.sp, color: Utils(context).primary),
          CommonSizes.hSmallestSpace,
          Text(
            'share'.tr(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Utils(context).secondTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
