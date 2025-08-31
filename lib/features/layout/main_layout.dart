// MainLayout بعد التعديل لتفعيل initialIndex بدون إعادة إنشاء controller داخل build()

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:x_calcu/features/home/presentation/screen/home_screen.dart';
import 'package:x_calcu/features/notification/presentation/screen/notification_screen.dart';
import 'package:x_calcu/features/operations/presentation/screen/add_operations_screen.dart';
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
  const MainLayout({
    super.key,
    this.withWhatNextDialog = false,
    this.initialIndex = 0,
  });

  final bool withWhatNextDialog;
  final int initialIndex;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late PersistentTabController controller;
  int _index = 0;

  void _showNotAuthDialog(context) {
    if (!getIt<AppStateModel>().isAuthenticated) {
      loginRequiredDialog(context: context);
    }
  }

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: widget.initialIndex);
    _index = widget.initialIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDialog();
    });
  }

  void _showDialog() {
    if (widget.withWhatNextDialog) {
      BottomDialogManager().showDialog(context, child: WhatNextContentDialog());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, appState, child) {
        return PersistentTabView(
          context,
          controller: controller,
          screens: _buildScreens(),
          items: _navBarsItems(context: context),
          onItemSelected: (index) async {
            // if (index == 2) {
            //   getIt<AppStateModel>().setClientType(clientType: 'client');
            //   getIt<AppStateModel>().setStoreId(null);
            //   _showNotAuthDialog(context);
            //   return;
            // }
            setState(() {
              _index = index;
            });
          },
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          decoration: NavBarDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 0.5,
                offset: const Offset(0, -0),
                color: const Color(0x2B000000).withAlpha(30),
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
          confineToSafeArea: false,
          navBarHeight: kBottomNavigationBarHeight + 12,
          navBarStyle: NavBarStyle.style12,
          // navBarStyle: NavBarStyle.style16,
        );
      },
    );
  }
}

List<Widget> _buildScreens() {
  return [
    CustomTabScreenWrapper(child: HomeScreen()),
    CustomTabScreenWrapper(child: NotificationScreen()),
    CustomTabScreenWrapper(child: AddOperationsScreen(isFromPartner: false)),
    CustomTabScreenWrapper(child: PartnersScreen()),
    CustomTabScreenWrapper(child: SettingScreen()),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems({
  required BuildContext context,
}) {
  // int notificationsCount = getIt<AppStateModel>().getMissedNotifications();
  return [
    PersistentBottomNavBarItem(
      icon: _buildIcon(context, AppImages.homeActiveIcon, 'home'.tr(), true),
      inactiveIcon: _buildIcon(
        context,
        AppImages.homeUnActiveIcon,
        'home'.tr(),
        false,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: _buildNotificationIcon(
        context,
        AppImages.notificationActiveIcon,
        // notificationsCount,
        0,
        true,
      ),
      inactiveIcon: _buildNotificationIcon(
        context,
        AppImages.notificationUnActiveIcon,
        // notificationsCount,
        0,
        false,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: _buildAddIcon(context, true),
      inactiveIcon: _buildAddIcon(context, false),
    ),
    PersistentBottomNavBarItem(
      icon: _buildIcon(
        context,
        AppImages.partnerActiveIcon,
        'partners'.tr(),
        true,
      ),
      inactiveIcon: _buildIcon(
        context,
        AppImages.partnerUnActiveIcon,
        'partners'.tr(),
        false,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: _buildIcon(
        context,
        AppImages.settingActiveIcon,
        'setting'.tr(),
        true,
      ),
      inactiveIcon: _buildIcon(
        context,
        AppImages.settingUnActiveIcon,
        'setting'.tr(),
        false,
      ),
    ),
  ];
}

Widget _buildAddIcon(BuildContext context, bool isActive) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Iconsax.add_circle,
        size: 38.sp,
        color:
            isActive ? Utils(context).secondary : Utils(context).primTextColor,
      ),
      // SvgPicture.asset(asset, width: 28.w, height: 28.h),
      Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Text(
          'Add',
          style: TextStyle(
            fontSize: 12.sp,
            color:
                isActive
                    ? Utils(context).primary
                    : Utils(context).primTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

Widget _buildIcon(
  BuildContext context,
  String asset,
  String label,
  bool isActive,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(asset, width: 28.w, height: 28.h),
      Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color:
                isActive
                    ? Utils(context).primary
                    : Utils(context).primTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

Widget _buildNotificationIcon(
  BuildContext context,
  String asset,
  int count,
  bool isActive,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Badge(
        isLabelVisible: count != 0,
        label: Text(
          count.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        child: SvgPicture.asset(asset, width: 28.w, height: 28.h),
      ),
      Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Text(
          'notification'.tr(),
          style: TextStyle(
            fontSize: 12.sp,
            color:
                isActive
                    ? Utils(context).primary
                    : Utils(context).primTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
