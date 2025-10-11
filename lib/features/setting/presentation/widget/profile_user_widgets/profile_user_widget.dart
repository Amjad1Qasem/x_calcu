import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:x_calcu/features/login/cubit/auth_cubit.dart';
import 'package:x_calcu/features/setting/presentation/widget/profile_user_widgets/face_id_widget.dart';
import 'package:x_calcu/features/setting/presentation/widget/section_components_widget.dart';
import 'package:x_calcu/features/notification/presentation/widget/notification_permission_widget.dart';
import 'package:x_calcu/notification_service.dart';
import 'package:x_calcu/features/startup/bloc/startup/startup_cubit.dart';
import 'package:x_calcu/global/components/app_bar.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/loaders/loading_overlay.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/components/user_messages/popup_widget.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class ProfileUserWidget extends StatelessWidget {
  const ProfileUserWidget({super.key});

  Future<void> _launchUrl(String url, BuildContext context) async {
    try {
      final uri = Uri.parse(url);
      printInfo('Attempting to launch URL: $url');

      bool launched = false;

      if (await canLaunchUrl(uri)) {
        printInfo('Can launch URL, attempting external application mode');
        try {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
          launched = true;
          printSuccess(
            'URL launched successfully with external application mode',
          );
        } catch (e) {
          printError('External application mode failed: $e');
        }
      }

      if (!launched) {
        printInfo('Trying platform default mode');
        try {
          await launchUrl(uri, mode: LaunchMode.platformDefault);
          launched = true;
          printSuccess('URL launched successfully with platform default mode');
        } catch (e) {
          printError('Platform default mode failed: $e');
        }
      }

      if (!launched) {
        printInfo('Trying in-app web view mode');
        try {
          await launchUrl(uri, mode: LaunchMode.inAppWebView);
          launched = true;
          printSuccess('URL launched successfully with in-app web view mode');
        } catch (e) {
          printError('In-app web view mode failed: $e');
        }
      }

      if (!launched) {
        printError('All launch modes failed');
        snackBar(
          context: context,
          title: 'could_not_open_the_contact_page'.tr(),
          isErrorMessage: true,
        );
      }
    } catch (e, s) {
      printError('Exception occurred: $e');
      printError('Stack trace: $s');
      snackBar(
        context: context,
        title: 'could_not_open_the_contact_page'.tr(),
        isErrorMessage: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await getIt<StartupCubit>().fetchUserInfo(),
      child: Skaffold(
        isAppBarNull: false,
        appBar: AppBarShredWidget(title: 'setting'.tr(), isBack: false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildfaceIdSection(context),
              CommonSizes.vSmallerSpace,

              // _buildTutorialSection(context),
              _buildPrivacySettingsSection(context),
              CommonSizes.vSmallerSpace,
              // _buildNotificationPermissionsSection(context),
              CommonSizes.vSmallerSpace,
              _buildLogoutSection(context),
              CommonSizes.vSmallerSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildfaceIdSection(BuildContext context) {
    return SectionComponentsWidget(lenght: 1, items: [faceIdWidget(context)]);
  }

  Widget _buildNotificationPermissionsSection(BuildContext context) {
    return FutureBuilder<Map<String, bool>>(
      future: NotificationService.checkAllNotificationPermissions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink(); // إخفاء أثناء التحميل
        }

        if (snapshot.hasError) {
          return const SizedBox.shrink(); // إخفاء في حالة الخطأ
        }

        final permissions = snapshot.data ?? {};
        bool shouldShow = false;

        if (Platform.isAndroid) {
          // إظهار إذا لم تكن أذونات الإشعارات أو التنبيه الدقيق موجودة
          shouldShow =
              !(permissions['notification_permission'] == true &&
                  permissions['exact_alarm_permission'] == true);
        } else if (Platform.isIOS) {
          // إظهار إذا لم تكن أذونات الإشعارات موجودة
          shouldShow = permissions['ios_notification_permission'] != true;
        }

        return Visibility(
          visible: shouldShow,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: NotificationPermissionWidget(
              onPermissionGranted: () {
                snackBar(
                  context: context,
                  title: 'all_permissions_granted'.tr(),
                  isErrorMessage: false,
                );
                // سيتم إعادة بناء الويدجيت تلقائياً عند تحديث الأذونات
              },
              onPermissionDenied: () {
                snackBar(
                  context: context,
                  title: 'some_permissions_missing'.tr(),
                  isErrorMessage: true,
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildPrivacySettingsSection(BuildContext context) {
    return SectionComponentsWidget(
      lenght: 2,
      items: [
        SectionItemWidget(
          onTap: () => context.push(RouterPath.privacyPolicyScreen),
          title: "privacy_and_security".tr(),
          iconPath: Iconsax.security_safe_copy,
          isGlobalSection: true,
        ),
        // SectionItemWidget(
        //   onTap: () {},
        //   title: "help_and_support".tr(),
        //   iconPath: Iconsax.message_question_copy,
        //   isGlobalSection: true,
        // ),
        SectionItemWidget(
          onTap: () => _launchUrl('https://x-secure.gmbh/contacts', context),
          title: "contact_ust".tr(),
          iconPath: Iconsax.message_copy,
          isGlobalSection: true,
        ),
      ],
    );
  }

  Widget _buildLogoutSection(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: getIt<AuthCubit>(),
      listener: (context, state) {
        if (state is Loading) {
          LoadingOverlay.of(context).show();
        }
        if (state is LoggedOut) {
          LoadingOverlay.of(context).hide();
          context.goNamed(RouterPath.loginScreen);
        }
        if (state is Error) {
          LoadingOverlay.of(context).hide();
          snackBar(
            context: context,
            title: state.message,
            isErrorMessage: true,
          );
        }
      },
      child: AppButton(
        onTap: () async {
          await openDialog(
            context: context,
            title: 'logOut_need'.tr(),
            message: 'are_you_sure_you_want_to_logout'.tr(),
            icon: Icons.logout,
            iconColor: Colors.red,
            iconBackgroundColor: Colors.red.withValues(alpha: 0.1),
            confirmText: "yes".tr(),
            cancelText: "no".tr(),
            onConfirm: () async {
              getIt<AuthCubit>().submitLogout();
            },
            onCancel: () => context.pop(),
          );
        },
        label: "log_out".tr(),
      ),
    );
  }
}
