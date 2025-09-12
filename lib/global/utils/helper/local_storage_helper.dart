// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:x_calcu/global/data/auth_model.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/global/utils/helper/shared_prefs.dart';
import 'package:x_calcu/global/utils/keys/forms_keys.dart';

abstract class LocalStorageHelper {
  /// Save Face ID state
  static Future<void> setBiometricEnabled(bool enabled) async {
    await Prefs.instance?.setBool(MyKeys.biometricEnabled, enabled);
  }

  /// Get Face ID state
  static Future<bool> isBiometricEnabled() async {
    return Prefs.instance?.getBool(MyKeys.biometricEnabled) ?? false;
  }

  /// **Save Language**
  static Future<void> setLocale(Locale locale) async {
    await Prefs.instance?.setString(MyKeys.locale, locale.languageCode);
  }

  /// **Retrieve Language**
  static Future<Locale> getLocale() async {
    final String locale = Prefs.instance?.getString(MyKeys.locale) ?? 'ar';
    // final String locale = Prefs.instance?.getString(MyKeys.locale) ??
    //     ui.PlatformDispatcher.instance.locales.first.languageCode;
    return Locale(locale);
  }

  /// **Save Theme Mode**
  static Future<void> setTheme(ThemeMode mode) async {
    await Prefs.instance!.setString(MyKeys.theme, mode.name);
    printSuccess('Saving theme mode: ${mode.name}');
  }

  /// **Retrieve Theme Mode**
  static Future<ThemeMode> getTheme() async {
    final String theme =
        Prefs.instance!.getString(MyKeys.theme) ?? ThemeMode.light.name;

    switch (theme) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.light;
    }
  }

  /// **Save User Token**
  static Future<void> setToken(String token) async {
    await Prefs.instance?.setString(MyKeys.token, token);
  }

  /// **Retrieve User Token**
  static Future<String?> getToken() async {
    return Prefs.instance?.getString(MyKeys.token);
  }

  /// **Check if User is Logged In**
  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  /// **Save User Data**
  static Future<void> setUserData(AuthModel user) async {
    final String userJson = jsonEncode(user.toJson());
    await Prefs.instance?.setString(MyKeys.user, userJson);
  }

  /// **Retrieve User Data**
  static Future<AuthModel?> getUserData() async {
    final String? userJson = Prefs.instance?.getString(MyKeys.user);
    if (userJson == null) return null;
    return AuthModel.fromJson(jsonDecode(userJson));
  }

  /// **Clear All User Data (For Logout)**
  static Future<void> clearUserData() async {
    await Prefs.instance?.remove(MyKeys.user);
    await Prefs.instance?.remove(MyKeys.token);
  }

  /// **Remove User Data**
  static Future<void> removeUserData() async {
    await Prefs.instance?.remove(MyKeys.user);
    await Prefs.instance?.remove(MyKeys.token);
  }

  /// **Save OnBoarding State**
  static Future<void> setOnBoardingState(bool isFirstTimeOpen) async {
    await Prefs.instance?.setBool(MyKeys.firstOpenApp, isFirstTimeOpen);
  }

  /// **Retrieve OnBoarding State**
  static Future<bool> hasSeenOnboarding() async {
    return Prefs.instance?.getBool(MyKeys.firstOpenApp) ?? false;
  }

  /// **Clear OnBoarding State (if needed)**
  static Future<void> clearOnBoardingState() async {
    debugPrint('clearOnBoardingState');
    await Prefs.instance?.remove(MyKeys.firstOpenApp);
  }

  // ==================== Backup Password Methods ====================

  /// **Set Backup Password**
  static Future<void> setBackupPassword(String password) async {
    debugPrint('setBackupPassword');
    await Prefs.instance?.setString(MyKeys.backupPassword, password);
  }

  /// **Get Backup Password**
  static Future<String?> getBackupPassword() async {
    return Prefs.instance?.getString(MyKeys.backupPassword);
  }

  /// **Check if Backup Password exists**
  static Future<bool> hasBackupPassword() async {
    final password = await getBackupPassword();
    return password != null && password.isNotEmpty;
  }

  /// **Clear Backup Password**
  static Future<void> clearBackupPassword() async {
    debugPrint('clearBackupPassword');
    await Prefs.instance?.remove(MyKeys.backupPassword);
  }

  /// **Verify Backup Password**
  static Future<bool> verifyBackupPassword(String inputPassword) async {
    final storedPassword = await getBackupPassword();
    return storedPassword == inputPassword;
  }
}
