import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/login/cubit/auth_cubit.dart';
import 'package:x_calcu/features/setting/presentation/widget/profile_user_widgets/face_id_widget.dart';
import 'package:x_calcu/features/setting/presentation/widget/section_components_widget.dart';
import 'package:x_calcu/features/startup/bloc/startup/startup_cubit.dart';
import 'package:x_calcu/global/components/app_bar.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/loaders/loading_overlay.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/components/user_messages/popup_widget.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class ProfileUserWidget extends StatelessWidget {
  const ProfileUserWidget({super.key});

  // @override
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
              _buildPrivacySettingsSection(context),
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

  Widget _buildPrivacySettingsSection(BuildContext context) {
    return SectionComponentsWidget(
      lenght: 3,
      items: [
        SectionItemWidget(
          onTap: () => context.push(RouterPath.privacyPolicyScreen),
          title: "privacy_and_security".tr(),
          iconPath: Iconsax.security_safe_copy,
          isGlobalSection: true,
        ),
        SectionItemWidget(
          onTap: () {},
          title: "help_and_support".tr(),
          iconPath: Iconsax.message_question_copy,
          isGlobalSection: true,
        ),
        SectionItemWidget(
          onTap: () => context.push(RouterPath.privacyPolicyScreen),
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
