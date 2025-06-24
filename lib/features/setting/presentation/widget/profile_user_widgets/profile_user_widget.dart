import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/login/cubit/auth_cubit.dart';
import 'package:x_calcu/features/setting/presentation/widget/section_components_widget.dart';
import 'package:x_calcu/features/startup/bloc/startup/startup_cubit.dart';
import 'package:x_calcu/global/components/app_bar.dart';
import 'package:x_calcu/global/components/app_button.dart';
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
              // CommonSizes.vSmallerSpace,
              // _buildAccountSettingsSection(context),
              // CommonSizes.vSmallerSpace,
              // _buildGlobalSettingsSection(context),
              // CommonSizes.vSmallerSpace,
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

  // Widget _buildGlobalSettingsSection(BuildContext context) {
  //   return SectionComponentsWidget(
  //     lenght: 3,
  //     items: [
  //       SectionItemWidget(
  //         onTap:
  //             () => openDialog(
  //               context: context,
  //               title: "notifications".tr(),
  //               supTitle: 'do_you_want_to_enable_notifications'.tr(),
  //               onPressedBtn2: () {},
  //             ),
  //         title: "notifications".tr(),
  //         trailing: 'activated'.tr(),
  //         iconPath: Iconsax.notification_copy,
  //         isGlobalSection: true,
  //       ),
  // languageSharedWidget(context),
  //       SectionItemWidget(
  //         onTap: () {},
  //         title: "dark_mode".tr(),
  //         iconPath: Iconsax.sun_1_copy,
  //         isDarkThemeButton: true,
  //       ),
  //     ],
  //   );
  // }

  Widget _buildfaceIdSection(BuildContext context) {
    return SectionComponentsWidget(
      lenght: 1,
      items: [
        // SectionItemWidget(
        //   onTap: () => context.push(RouterPath.privacyPolicyScreen),
        //   title: "face_id".tr(),
        //   iconPath: Iconsax.message_copy,
        //   isGlobalSection: true,
        // ),
        SectionItemWidget(
          onTap:
              () => openDialog(
                context: context,
                title: "language".tr(),
                supTitle: "choose_your_language".tr(),
                // textBtn2: bloc == 'ar' ? "arabic".tr() : "english".tr(),
                // textBtn1: bloc == 'ar' ? "english".tr() : "arabic".tr(),
                textBtn2: 'العربية',
                textBtn1: 'English',
                onPressedBtn1: () async {
                  // if (bloc == 'ar') {
                  // gg.add(SetEnglish(context));
                  // } else {
                  //   gg.add(SetArabic(context));
                  // }
                  await Future.delayed(const Duration(milliseconds: 300));
                  // getIt<NewCategoryCubit>().loadAllCategories();
                  Navigator.of(context, rootNavigator: true).pop();
                },
                onPressedBtn2: () async {
                  // if (bloc == 'ar') {
                  // gg.add(SetArabic(context));
                  // } else {
                  //   gg.add(SetEnglish(context));
                  // }
                  await Future.delayed(const Duration(milliseconds: 300));
                  // getIt<NewCategoryCubit>().loadAllCategories();
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
          title: "language".tr(),
          trailing: () {
            // final state = gg.state;
            // return state.when(
            //   initial: () => bloc != 'ar' ? 'العربية' : 'English',
            //   fetched: (locale) =>
            //       locale.languageCode != 'ar' ? 'العربية' : 'English',
            // );
          }(),
          iconPath: Iconsax.translate,
          isGlobalSection: true,
          isDarkThemeButton: false,
        ),
      ],
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
        if (state is LoggedOut) {
          context.goNamed('login');
        } else if (state is Error) {
          snackBar(
            context: context,
            title: state.message,
            isErrorMessage: true,
          );
        }
      },
      child: AppButton(
        onTap: () async {
          openDialog(
            context: context,
            title: 'logOut_need'.tr(),
            onPressedBtn2: () async {
              await getIt<AppStateModel>().logout();
              getIt<AuthCubit>().submitLogout();
            },
          );
        },
        label: "log_out".tr(),
      ),
      /*
      SectionComponentsWidget(
        lenght: 1,
        items: [
          SectionItemWidget(
            onTap: () async {
              openDialog(
                context: context,
                title: 'logOut_need'.tr(),
                onPressedBtn2: () async {
                  await getIt<AppStateModel>().logout();
                  getIt<AuthCubit>().submitLogout();
                },
              );
            },
            title: "log_out".tr(),
            iconPath: Iconsax.login_copy,
          ),
        ],
      ),
   */
    );
  }
}
