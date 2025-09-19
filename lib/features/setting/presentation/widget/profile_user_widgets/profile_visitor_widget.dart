import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/setting/presentation/widget/section_components_widget.dart';
import 'package:x_calcu/features/startup/bloc/startup/startup_cubit.dart';
import 'package:x_calcu/global/components/app_bar.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/components/user_messages/popup_widget.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class ProfileVisitorWidget extends StatelessWidget {
  const ProfileVisitorWidget({super.key});

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
              _buildPrivacySettingsSection(context),
              _buildLoginSection(context),
              CommonSizes.vSmallerSpace,
            ],
          ),
        ),
      ),
    );
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
          onTap: () => loginRequiredDialog(context: context),
          title: "contact_ust".tr(),
          iconPath: Iconsax.message_copy,
          isGlobalSection: true,
        ),
      ],
    );
  }

  Widget _buildLoginSection(BuildContext context) {
    return AppButton(
      onTap: () => context.pushReplacement(RouterPath.loginScreen),
      label: "log_in".tr(),
    );
  }
}
