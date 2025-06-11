import 'package:shared_preferences/shared_preferences.dart';

 class Prefs {
  static  SharedPreferences? _prefs;

   static Future<void> init() async {
      _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences? get instance {
    if (_prefs == null) {
      throw Exception('Prefs not initialized');
    }
    return _prefs;
  }
}
