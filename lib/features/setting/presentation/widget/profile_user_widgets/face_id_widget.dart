import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/setting/presentation/widget/section_components_widget.dart';
import 'package:x_calcu/global/components/user_messages/popup_widget.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

SectionItemWidget faceIdWidget(BuildContext context) {
  return SectionItemWidget(
    onTap:
        () => openDialog(
          context: context,
          title: "face_id".tr(),
          supTitle: "do_want_activate_face".tr(),
          textBtn2: 'active'.tr(),
          textBtn1: 'cansel'.tr(),
          onPressedBtn1: () async {
            await Future.delayed(const Duration(milliseconds: 200));
            Navigator.of(context, rootNavigator: true).pop();
          },
          onPressedBtn2: () async {
            await Future.delayed(const Duration(milliseconds: 200));
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
    title: "face_id".tr(),
    iconPath: Iconsax.scan,
    trailingColor: Utils(context).secondary,
    // iconColor: Utils(context).secondary,
    isGlobalSection: true,
    isDarkThemeButton: false,
    trailing: 'not_activated'.tr(),
  );
}
