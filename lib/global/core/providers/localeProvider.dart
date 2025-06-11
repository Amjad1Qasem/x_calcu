import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_calcu/global/utils/helper/shared_prefs.dart';

class AppLocaleProvider with ChangeNotifier {
  Locale _locale = const Locale("en");

  Locale get locale => _locale;

  AppLocaleProvider() {
    _loadSavedLocale();
  }

  void _loadSavedLocale() async {
    final savedLocale = Prefs.instance?.getString('locale') ?? 'en';
    _locale = Locale(savedLocale);
    // easyLocalization.locale = _locale;
    notifyListeners();
  }

  Future<void> setLocale(BuildContext context, Locale locale) async {
    _locale = locale;
    EasyLocalization.of(context)?.setLocale(locale);
    await Prefs.instance?.setString('locale', locale.languageCode);
    notifyListeners();
  }
}
