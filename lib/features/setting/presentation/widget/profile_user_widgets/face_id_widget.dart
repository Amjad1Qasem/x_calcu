import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/setting/presentation/widget/section_components_widget.dart';
import 'package:x_calcu/global/components/user_messages/popup_widget.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/helper/local_storage_helper.dart';

Widget faceIdWidget(BuildContext context) {
  return StatefulBuilder(
    builder: (context, setState) {
      return FutureBuilder<bool>(
        future: LocalStorageHelper.isBiometricEnabled(),
        builder: (context, snapshot) {
          final isEnabled = snapshot.data ?? false;

          return SectionItemWidget(
            onTap: () async {
              final title = "face_id".tr();
              final supTitle =
                  isEnabled
                      ? "do_you_want_disable_face".tr()
                      : "do_want_activate_face".tr();
              final confirmText = isEnabled ? 'disable'.tr() : 'active'.tr();
              final cancelText = 'cancel'.tr();

              return await openDialog(
                context: context,
                title: title,
                message: supTitle,
                icon: Icons.fingerprint, // أو أيقونة تانية بتحبها
                iconColor: Utils(context).primary,
                iconBackgroundColor: Utils(context).primary.withOpacity(0.1),
                confirmText: confirmText,
                cancelText: cancelText,
                onConfirm: () async {
                  await LocalStorageHelper.setBiometricEnabled(!isEnabled);
                  Navigator.of(context, rootNavigator: true).pop();
                  setState(() {});
                },
                onCancel: () async {
                  await Future.delayed(const Duration(milliseconds: 200));
                  Navigator.of(context, rootNavigator: true).pop();
                },
              );
            },
            title: "face_id".tr(),
            iconPath: Iconsax.scan,
            trailingColor: Utils(context).secondary,
            isGlobalSection: true,
            isDarkThemeButton: false,
            trailing: isEnabled ? 'activated'.tr() : 'not_activated'.tr(),
          );
        },
      );
    },
  );
}
