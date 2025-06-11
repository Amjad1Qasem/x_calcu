import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:x_calcu/features/companies/presentation/screen/home_screen.dart';
import 'package:x_calcu/features/home/presentation/screen/companies_screen.dart';
import 'package:x_calcu/features/notification/presentation/screen/notification_screen.dart';
import 'package:x_calcu/features/partners/presentation/screen/partners_screen.dart';
import 'package:x_calcu/features/setting/presentation/screen/setting_screen.dart';
import 'package:x_calcu/global/components/bottom_dialog/bottom_dialog_manager.dart';
import 'package:x_calcu/global/components/bottom_dialog/what_next_content.dart';
import 'package:x_calcu/global/components/user_messages/popup_widget.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/constant/app_images.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

import '../../global/components/exit_handler_wrapper.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, this.withWhatNextDialog = false});

  final bool withWhatNextDialog;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _index = 0;

  set index(int value) => setState(() => _index = value);

  void _showNotAuthDialog(context) {
    if (!getIt<AppStateModel>().isAuthenticated) {
      loginRequiredDialog(context: context);
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDialog();
    });
    super.initState();
  }

  void _showDialog() {
    if (widget.withWhatNextDialog) {
      debugPrint('Dialog should be shown.');

      BottomDialogManager().showDialog(context, child: WhatNextContentDialog());
    } else {
      debugPrint('Dialog should NOT be shown.');
    }
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController? controller;

    controller = PersistentTabController(initialIndex: _index);
    return Consumer<AppStateModel>(
      builder: (context, appState, child) {
        return PersistentTabView(
          onItemSelected: (index) async {
            if (index == 2) {
              getIt<AppStateModel>().setClientType(clientType: 'client');
              getIt<AppStateModel>().setStoreId(null);
              _showNotAuthDialog(context);
              return;
            } else if (index == 3) {
              // getIt<FavoriteCubit>().pagingController.refresh();
              // getIt<FavoriteCubit>().fetchPage(1);
            } else {
              _index = index;
            }
          },
          context,
          controller: controller,
          screens: _buildScreens(),
          items: _navBarsItems(
            context: context,
            callback: (val) {
              setState(() => _index = val);
            },
          ),
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          decoration: NavBarDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 0.5,
                offset: const Offset(0, -0),
                color: const Color(0x2B000000).withValues(alpha: 0.3),
              ),
            ],
          ),
          hideNavigationBarWhenKeyboardAppears: true,
          isVisible: true,
          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings(
              duration: Duration(milliseconds: 400),
              curve: Curves.fastEaseInToSlowEaseOut,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              animateTabTransition: true,
              duration: Duration(milliseconds: 200),
              screenTransitionAnimationType:
                  ScreenTransitionAnimationType.slide,
            ),
          ),
          confineToSafeArea: true,
          navBarHeight: kBottomNavigationBarHeight + 5,
          navBarStyle:
              NavBarStyle
                  .style16, // Choose the nav bar style with this property
        );
      },
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const CustomTabScreenWrapper(child: HomeScreen()),
    const CustomTabScreenWrapper(child: NotificationScreen()),
    const CustomTabScreenWrapper(child: PartnersScreen()),
    const CustomTabScreenWrapper(child: CompaniesScreen()),
    const CustomTabScreenWrapper(child: SettingScreen()),
  ];
}

typedef IntCallback = void Function(int val);

List<PersistentBottomNavBarItem> _navBarsItems({
  required BuildContext context,
  required IntCallback callback,
}) {
  int notificationsCount = getIt<AppStateModel>().getMissedNotifications();
  return [
    PersistentBottomNavBarItem(
      inactiveIcon: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Iconsax.home_copy,
            size: 30,
            color: Colors.black,
            // color: Colors.white,
          ),
          Material(
            color: Colors.transparent,
            child: Text(
              'ads_short'.tr(),
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
              // style: TextStyle(fontSize: 10.sp),
            ),
          ),
        ],
      ),

      icon: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Iconsax.home_copy,
            size: 30,
            color: Colors.black,
            // color: Colors.white,
          ),
          Material(
            color: Colors.transparent,
            child: Text(
              'ads_short'.tr(),
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
              // style: TextStyle(fontSize: 10.sp),
            ),
          ),
        ],
      ),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Badge(
            isLabelVisible: notificationsCount != 0,
            label: Text(
              notificationsCount.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: SvgPicture.asset(
              AppImages.notificationIcon,
              height: 26.h,
              colorFilter: ColorFilter.mode(
                Utils(context).black,
                BlendMode.srcIn,
              ),
            ),
          ),
          Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            // color: Colors.white,
            child: Text(
              'notification'.tr(),
              style: TextStyle(
                fontSize: 11.sp,
                color: Utils(context).black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),

      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Badge(
            isLabelVisible: notificationsCount != 0,
            label: Text(
              notificationsCount.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: SvgPicture.asset(
              AppImages.notificationActiveIcon,
              height: 26.h,
              colorFilter: ColorFilter.mode(
                Utils(context).primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text(
              'notification'.tr(),
              style: TextStyle(
                fontSize: 11.sp, // Increase font size
                color: Utils(context).primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),

      // onSelectedTabPressWhenNoScreensPushed: () => isActive = !isActive,
      activeColorPrimary: Theme.of(context).colorScheme.primary,
      inactiveColorPrimary: Theme.of(context).colorScheme.primary,
    ),
    PersistentBottomNavBarItem(
      contentPadding: 0,
      icon: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
            // color: Colors.white,
          ),
          Material(
            color: Colors.transparent,
            child: Text(
              'ads_short'.tr(),
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
              // style: TextStyle(fontSize: 10.sp),
            ),
          ),
        ],
      ),

      activeColorPrimary: const Color(0xff50b6ff),
      inactiveColorPrimary: const Color(0xff50b6ff),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite_outline_rounded, color: Utils(context).black),
          // SvgPicture.asset(
          //   AppImages.favoriteIcon,
          //   height: 26.h,
          // ),
          Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text(
              'favorite'.tr(),
              style: TextStyle(
                fontSize: 11.sp,
                color: Utils(context).black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite_rounded, color: Utils(context).primary),
          Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text(
              'favorite'.tr(),
              style: TextStyle(
                fontSize: 11.sp, // Increase font size
                color: Utils(context).primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
    PersistentBottomNavBarItem(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Iconsax.setting_2, color: Utils(context).primary),
          Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text(
              'setting'.tr(),
              style: TextStyle(
                fontSize: 11.sp, // Increase font size
                color: Utils(context).primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      inactiveIcon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Iconsax.setting_2_copy, color: Utils(context).black),
          Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text(
              'setting'.tr(),
              style: TextStyle(
                fontSize: 11.sp, // Increase font size
                color: Utils(context).black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  ];
}
