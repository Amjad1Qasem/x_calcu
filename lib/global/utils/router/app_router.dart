import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/home/presentation/screen/home_screen.dart';
import 'package:x_calcu/features/companies/presentation/screen/companies_screen.dart';
import 'package:x_calcu/features/layout/main_layout.dart';
import 'package:x_calcu/features/login/presentation/screen/login_screen.dart';
import 'package:x_calcu/features/notification/presentation/screen/notification_screen.dart';
import 'package:x_calcu/features/operations/presentation/screen/add_operations_screen.dart';
import 'package:x_calcu/features/operations/presentation/screen/edit_operations_screen.dart';
import 'package:x_calcu/features/operations/presentation/screen/show_operations_details_screen.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/features/partners/presentation/screen/add_partner_screen.dart';
import 'package:x_calcu/features/partners/presentation/screen/partner_details_screen.dart';
import 'package:x_calcu/features/partners/presentation/screen/partners_screen.dart';
import 'package:x_calcu/features/privacy_policy/screens/privacy_policy_screen.dart';
import 'package:x_calcu/features/privacy_policy/screens/terms_and_conditions_screen.dart';
import 'package:x_calcu/features/search_and_filter/presentation/screens/search_screen.dart';
import 'package:x_calcu/features/setting/presentation/screen/setting_screen.dart';
import 'package:x_calcu/features/startup/presentation/screen/banned_account_screen.dart';
import 'package:x_calcu/features/startup/presentation/screen/intro_page.dart';
import 'package:x_calcu/features/startup/presentation/screen/on_boarding_screen.dart';
import 'package:x_calcu/features/startup/presentation/screen/suspended_account_screen.dart';
import 'package:x_calcu/global/data/auth_model.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'intro',
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      path: RouterPath.onBoardingScreen,
      name: RouterPath.onBoardingScreen,
      builder: (context, state) => OnBoardingScreen(),
    ),
    GoRoute(
      path: RouterPath.bannedAccountScreen,
      name: RouterPath.bannedAccountScreen,
      builder: (context, state) {
        final info = state.extra as AuthModel;
        return BannedAccountScreen(accountInfo: info);
      },
    ),
    GoRoute(
      path: RouterPath.suspendedAccountScreen,
      name: RouterPath.suspendedAccountScreen,
      builder: (context, state) {
        final info = state.extra as AuthModel;
        return SuspendedAccountScreen(accountInfo: info);
      },
    ),
    GoRoute(
      path: RouterPath.mainLayout,
      name: RouterPath.mainLayout,
      builder: (context, state) {
        final initialIndex = state.extra as int? ?? 0;
        return MainLayout(initialIndex: initialIndex);
      },
    ),
    GoRoute(
      path: RouterPath.loginScreen,
      name: RouterPath.loginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RouterPath.homeScreen,
      name: RouterPath.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RouterPath.notificationScreen,
      name: RouterPath.notificationScreen,
      builder: (context, state) => const NotificationScreen(),
    ),
    GoRoute(
      path: RouterPath.companiesScreen,
      name: RouterPath.companiesScreen,
      builder: (context, state) => const CompaniesScreen(),
    ),
    GoRoute(
      path: RouterPath.partnersScreen,
      name: RouterPath.partnersScreen,
      builder: (context, state) => const PartnersScreen(),
    ),
    GoRoute(
      path: RouterPath.settingScreen,
      name: RouterPath.settingScreen,
      builder: (context, state) => const SettingScreen(),
    ),
    GoRoute(
      path: RouterPath.privacyPolicyScreen,
      name: RouterPath.privacyPolicyScreen,
      builder: (context, state) => const PrivacyPolicyScreen(),
    ),
    GoRoute(
      path: RouterPath.termsAndConditionsScreen,
      name: RouterPath.termsAndConditionsScreen,
      builder: (context, state) => const TermsAndConditionsScreen(),
    ),

    GoRoute(
      path: RouterPath.searchScreen,
      name: RouterPath.searchScreen,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: RouterPath.addPartnerScreen,
      name: RouterPath.addPartnerScreen,
      builder: (context, state) => const AddPartnerScreen(),
    ),
    GoRoute(
      path: RouterPath.showOperationsDetailsScreen,
      name: RouterPath.showOperationsDetailsScreen,
      builder: (context, state) {
        return ShowOperationsDetailsScreen();
      },
    ),
    GoRoute(
      path: RouterPath.editOperationsScreen,
      name: RouterPath.editOperationsScreen,
      builder: (context, state) {
        return EditOperationsScreen();
      },
    ),
    GoRoute(
      path: RouterPath.addOperationsScreen,
      name: RouterPath.addOperationsScreen,
      builder: (context, state) {
        final isFromPartner = state.extra as bool;
        return AddOperationsScreen(isFromPartner: isFromPartner);
      },
    ),
    GoRoute(
      path: RouterPath.partnerDetailsScreen,
      name: RouterPath.partnerDetailsScreen,
      builder: (context, state) {
        final partner = state.extra as PartnerModel;
        return PartnerDetailsScreen(partner: partner);
      },
    ),
  ],
);
