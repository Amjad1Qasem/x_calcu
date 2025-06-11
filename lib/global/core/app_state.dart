
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_calcu/features/startup/data/system_setting_model.dart';
import 'package:x_calcu/global/data/auth_model.dart';
import 'package:x_calcu/global/utils/helper/local_storage_helper.dart';

class AppStateModel with ChangeNotifier {
  bool _authenticated = false;
  String? _userToken;
  Locale _locale = const Locale("en");
  String? _entityType = 'ad';
  String? _clientType = 'client';
  int? _storeId;
  SystemSettingModel? _systemSettingModel;

  AuthModel? _userInfo;
  bool seenMissedNotifications = false;
  String _currency = 'sp';

  // AuthModel? get userInfo => _userInfo;

  Locale get locale => _locale;

  bool get isAuthenticated => _authenticated;

  String? get userToken => _userToken;

  String? get entityType => _entityType;

  String? get clientType => _clientType;

  int? get storeId => _storeId;

  String get currency => _currency.tr();

  bool get rtl => _locale == const Locale("ar");

  SystemSettingModel? get systemSettingModel => _systemSettingModel;

  void setSystemSetting({required SystemSettingModel data}) {
    _systemSettingModel = data;
    notifyListeners();
  }

  void setClientType({required String clientType}) {
    _clientType = clientType;
    notifyListeners();
  }

  void setStoreId(int? storeId) {
    _storeId = storeId;
    notifyListeners();
  }

  Future<void> init() async {
    await _loadUserPreferences();
  }

  void markAsSeenNotification() {
    seenMissedNotifications = !seenMissedNotifications;
    notifyListeners();
  }

  void updateNotificationCount(int notificationsCount) {
    debugPrint('saleh updateNotificationCount $notificationsCount');
    _userInfo = _userInfo?.copyWith(unseenNotifications: notificationsCount);
    notifyListeners();
  }

  int getMissedNotifications() {
    if (seenMissedNotifications) {
      return 0;
    } else {
      return _userInfo?.unseenNotifications ?? 0;
    }
  }

  void setEntityType(String entityType) {
    _entityType = entityType;
    notifyListeners();
  }

  void setLocale(Locale locale) {
    if (_locale != locale) {
      _locale = locale;
      debugPrint('set this local ${locale.languageCode}');
      notifyListeners();
    }
  }

  Future<void> _loadUserPreferences() async {
    // final storedUser = await LocalStorageHelper.getUserData();
    final storedToken = await LocalStorageHelper.getToken();
    final storedLocale = await LocalStorageHelper.getLocale();

    // _userInfo = storedUser;
    _userToken = storedToken;
    _locale = storedLocale;
    // _authenticated = _userInfo != null;
    notifyListeners();
  }

  Future<void> updateUserPreferences(AuthModel newData) async {
    await LocalStorageHelper.setUserData(newData);
    _userInfo = newData;
    _userToken = newData.token;
    _authenticated = true;
    notifyListeners();
  }

  Future<void> updateUserPreferencesStartup(AuthModel newData) async {
    final storedToken = await LocalStorageHelper.getToken();
    final updated = newData.copyWith(token: storedToken);
    await LocalStorageHelper.setUserData(updated);
    _userInfo = updated;
    _userToken = updated.token;
    _authenticated = true;
    notifyListeners();
  }

  Future<void> updateToken({required newToken}) async {
    _userToken = newToken;
    notifyListeners();
  }

  Future<void> logout() async {
    await LocalStorageHelper.clearUserData();
    _authenticated = false;
    _userToken = null;
    _userInfo = null;
    notifyListeners();
  }
}
