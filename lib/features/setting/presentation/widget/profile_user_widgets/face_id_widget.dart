import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/login/presentation/widget/backup_password_dialog.dart';
import 'package:x_calcu/features/setting/presentation/widget/section_components_widget.dart';
import 'package:x_calcu/features/startup/bloc/biometric_auth/biometric_auth_cubit.dart';
import 'package:x_calcu/global/components/user_messages/popup_widget.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
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
              // Check if biometric is available on device first
              final biometricCubit = getIt<BiometricAuthCubit>();
              final isAvailable = await biometricCubit.isBiometricAvailable();

              if (!isAvailable) {
                snackBar(
                  context: context,
                  title: 'face_id_not_available'.tr(),
                  isErrorMessage: true,
                );
                return;
              }

              final title = "face_id".tr();
              final supTitle =
                  isEnabled
                      ? "do_you_want_to_disable_face_id".tr()
                      : "do_you_want_to_enable_face_id".tr();
              final confirmText =
                  isEnabled ? 'disable_face_id'.tr() : 'enable_face_id'.tr();
              final cancelText = 'cancel'.tr();

              return await openDialog(
                context: context,
                title: title,
                message: supTitle,
                icon: Iconsax.scan,
                iconColor: Utils(context).primary,
                iconBackgroundColor: Utils(context).primary.withOpacity(0.1),
                confirmText: confirmText,
                cancelText: cancelText,
                onConfirm: () async {
                  if (!isEnabled) {
                    // Enable biometric - test authentication first
                    try {
                      await biometricCubit.authenticateUser();

                      // Check if backup password exists
                      final hasBackupPassword =
                          await LocalStorageHelper.hasBackupPassword();

                      if (!hasBackupPassword) {
                        // Show backup password creation dialog
                        await showDialog(
                          context: context,
                          builder:
                              (context) => BackupPasswordDialog(
                                onSuccess: () async {
                                  // After creating backup password, enable biometric
                                  await LocalStorageHelper.setBiometricEnabled(
                                    true,
                                  );
                                  snackBar(
                                    context: context,
                                    title: 'face_id_enabled'.tr(),
                                  );
                                  setState(() {});
                                },
                              ),
                        );
                      } else {
                        // If backup password exists, enable biometric directly
                        await LocalStorageHelper.setBiometricEnabled(true);
                        snackBar(
                          context: context,
                          title: 'face_id_enabled'.tr(),
                        );
                        setState(() {});
                      }
                    } catch (e) {
                      snackBar(
                        context: context,
                        title: 'face_id_authentication_failed'.tr(),
                        isErrorMessage: true,
                      );
                      return;
                    }
                  } else {
                    // Disable biometric
                    await LocalStorageHelper.setBiometricEnabled(false);
                    snackBar(context: context, title: 'face_id_disabled'.tr());
                    setState(() {});
                  }
                },
                onCancel: () async {
                  // await Future.delayed(const Duration(milliseconds: 200));
                  // Navigator.of(context, rootNavigator: true).pop();
                },
              );
            },
            title: "face_id".tr(),
            iconPath: Iconsax.scan,
            trailingColor: Utils(context).secondary,
            isGlobalSection: true,
            isDarkThemeButton: false,
            trailing:
                isEnabled ? 'face_id_enabled'.tr() : 'face_id_disabled'.tr(),
          );
        },
      );
    },
  );
}
