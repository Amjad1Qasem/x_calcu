import 'package:flutter/material.dart';
import 'package:x_calcu/global/utils/navigation/navigation_helper.dart';

/// Extension for enhanced navigation methods
extension NewNavigation on BuildContext {
  /// Navigates to a named route with arguments
  void goNamed(String name, {Object? argument}) {
    NavigationHelper.clearFocusAndNavigate(this, () {
      Navigator.of(this).popAndPushNamed(name, arguments: argument);
    });
  }

  /// Pushes a named route with arguments
  void pushNamed(String name, {Object? argument}) {
    NavigationHelper.clearFocusAndNavigate(this, () {
      Navigator.of(this).pushNamed(name, arguments: argument);
    });
  }

  /// Pushes a replacement named route with arguments
  void pushReplacementNamed(String name, {Object? argument}) {
    NavigationHelper.clearFocusAndNavigate(this, () {
      Navigator.of(this).pushReplacementNamed(name, arguments: argument);
    });
  }

  /// Safely pops the current route
  void pop() {
    NavigationHelper.safePop(this);
  }

  /// Safely pops with result
  void popWithResult([dynamic result]) {
    NavigationHelper.safePopWithResult(this, result);
  }

  /// Safely pops to root
  void popToRoot() {
    NavigationHelper.safePopToRoot(this);
  }
}
