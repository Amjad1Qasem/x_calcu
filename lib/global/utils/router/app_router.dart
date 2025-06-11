import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/companies/presentation/screen/home_screen.dart';
import 'package:x_calcu/features/home/presentation/screen/companies_screen.dart';
import 'package:x_calcu/features/layout/main_layout.dart';
import 'package:x_calcu/features/login/presentation/screen/login_screen.dart';
import 'package:x_calcu/features/notification/presentation/screen/notification_screen.dart';
import 'package:x_calcu/features/partners/presentation/screen/partners_screen.dart';
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
      builder: (context, state) => const MainLayout(),
    ),
    GoRoute(
      path: RouterPath.mainLayout,
      name: RouterPath.mainLayout,
      builder: (context, state) => const MainLayout(),
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
  ],
);
