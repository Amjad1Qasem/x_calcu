import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
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

  tz.initializeTimeZones();
  await initFunction();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder:
          (context) => EasyLocalization(
            supportedLocales: const [Locale('en'), Locale('ar')],
            path: 'assets/translation',
            startLocale: const Locale('ar'),
            saveLocale: true,
            assetLoader: const RootBundleAssetLoader(),
            child: const MyApp(),
          ),
    ),
  );
}

Future<void> initFunction() async {
  dependencyInjectionSetup();
  await EasyLocalization.ensureInitialized();
  await DioHelper.init();
  await Prefs.init();
  await getIt<AppStateModel>().init();
}
