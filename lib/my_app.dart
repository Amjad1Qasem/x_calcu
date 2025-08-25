import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:x_calcu/global/bloc/theme_bloc/theme_bloc.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/router/app_router.dart';

import 'global/design/themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = getIt<ThemeBloc>();
    themeBloc.add(const FetchTheme());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => getIt<AppStateModel>()),
      ],
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          useInheritedMediaQuery: true,
          builder: (_, child) {
            return BlocBuilder<ThemeBloc, ThemeState>(
              bloc: getIt<ThemeBloc>(),
              buildWhen:
                  (previous, current) =>
                      current is ThemeFetched, // Ensure rebuild
              builder: (context, state) {
                final themeMode =
                    state is ThemeFetched ? state.themeMode : ThemeMode.light;
                final themeData =
                    themeMode == ThemeMode.dark
                        ? AppThemes.dark
                        : AppThemes.light;
                return MaterialApp.router(
                  builder: (context, child) {
                    return DevicePreview.appBuilder(context, child);
                    // final appBuilder = DevicePreview.appBuilder(context, child);
                    // return DeepLinkListener(child: appBuilder);
                  },
                  localizationsDelegates: [...context.localizationDelegates],
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  debugShowCheckedModeBanner: false,
                  theme: themeData,
                  themeMode: themeMode,
                  routerConfig: router,
                );
              },
            );
          },
        );
      },
    );
  }
}
