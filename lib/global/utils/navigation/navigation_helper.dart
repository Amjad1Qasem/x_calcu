import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

/// Helper class for unified navigation handling
class NavigationHelper {
  // ==================== Safe Navigation ====================

  /// Safely pops the current route if possible
  static void safePop(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  /// Safely pops with result if possible
  static void safePopWithResult(BuildContext context, [dynamic result]) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(result);
    }
  }

  /// Safely pops to root if possible
  static void safePopToRoot(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  // ==================== GoRouter Navigation ====================

  /// Navigates to a route with replacement
  static void goWithReplacement(
    BuildContext context,
    String path, {
    Object? extra,
  }) {
    context.pushReplacement(path, extra: extra);
  }

  /// Navigates to a route
  static void goTo(BuildContext context, String path, {Object? extra}) {
    context.push(path, extra: extra);
  }

  /// Navigates to home screen (MainLayout index 0)
  static void goToHome(BuildContext context) {
    goWithReplacement(context, RouterPath.mainLayout, extra: 0);
  }

  /// Navigates to notifications screen
  static void goToNotifications(BuildContext context) {
    goTo(context, RouterPath.notificationScreen);
  }

  /// Navigates to partners screen
  static void goToPartners(BuildContext context) {
    goTo(context, RouterPath.partnersScreen);
  }

  /// Navigates to settings screen
  static void goToSettings(BuildContext context) {
    goTo(context, RouterPath.settingScreen);
  }

  /// Navigates to add partner screen
  static void goToAddPartner(BuildContext context) {
    goTo(context, RouterPath.addPartnerScreen);
  }

  /// Navigates to add operations screen
  static void goToAddOperations(
    BuildContext context, {
    bool isFromPartner = false,
  }) {
    goTo(context, RouterPath.addOperationsScreen, extra: isFromPartner);
  }

  /// Navigates to edit operations screen
  static void goToEditOperations(BuildContext context, dynamic operation) {
    goTo(context, RouterPath.editOperationsScreen, extra: operation);
  }

  /// Navigates to operation details screen
  static void goToOperationDetails(BuildContext context, int operationId) {
    goTo(context, RouterPath.showOperationsDetailsScreen, extra: operationId);
  }

  /// Navigates to partner details screen
  static void goToPartnerDetails(BuildContext context, dynamic partner) {
    goTo(context, RouterPath.partnerDetailsScreen, extra: partner);
  }

  // ==================== Navigation State Checks ====================

  /// Checks if navigation stack can pop
  static bool canPop(BuildContext context) {
    return Navigator.of(context).canPop();
  }

  /// Checks if navigation stack is empty
  static bool isNavigationStackEmpty(BuildContext context) {
    return !Navigator.of(context).canPop();
  }

  /// Gets current route name
  static String? getCurrentRouteName(BuildContext context) {
    return ModalRoute.of(context)?.settings.name;
  }

  // ==================== Navigation Utilities ====================

  /// Clears focus before navigation
  static void clearFocusAndNavigate(
    BuildContext context,
    VoidCallback navigationAction,
  ) {
    FocusScope.of(context).unfocus();
    navigationAction();
  }

  /// Navigates with focus clearing
  static void navigateWithFocusClear(
    BuildContext context,
    String path, {
    Object? extra,
  }) {
    clearFocusAndNavigate(context, () => goTo(context, path, extra: extra));
  }

  /// Replaces with focus clearing
  static void replaceWithFocusClear(
    BuildContext context,
    String path, {
    Object? extra,
  }) {
    clearFocusAndNavigate(
      context,
      () => goWithReplacement(context, path, extra: extra),
    );
  }
}
