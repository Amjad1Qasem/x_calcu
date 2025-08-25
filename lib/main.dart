import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/src/logger.dart' as level;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/shared_prefs.dart';
import 'package:x_calcu/my_app.dart';
import 'global/networking/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize timezones
  tz.initializeTimeZones();

  // await init services before runApp
  await initFunction();

  // lock orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder:
          (context) => EasyLocalization(
            supportedLocales: const [Locale('en'), Locale('ar')],
            path: 'assets/translation',
            startLocale: const Locale('en'),
            saveLocale: true,
            assetLoader: const RootBundleAssetLoader(),
            child: const MyApp(),
          ),
    ),
  );
}

Future<void> initFunction() async {
  // dependency injection setup
  dependencyInjectionSetup();

  // EasyLocalization init
  await EasyLocalization.ensureInitialized();

  // network + shared prefs + app state
  await DioHelper.init();
  await Prefs.init();
  await getIt<AppStateModel>().init();

  // optional: enable EasyLogger for debug
  if (kDebugMode) {
    EasyLocalization.logger.enableLevels = [
      // enables only errors + warnings
      level.EasyLogger().enableLevels[1], // adjust level if needed
    ];
  }
}
