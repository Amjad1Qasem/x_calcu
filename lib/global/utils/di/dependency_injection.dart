
import 'package:get_it/get_it.dart';
import 'package:x_calcu/global/bloc/Localization_bloc/localization_bloc.dart';
import 'package:x_calcu/global/bloc/theme_bloc/theme_bloc.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/networking/dio_helper.dart';

final getIt = GetIt.instance;

void dependencyInjectionSetup() {
  /// Initialize DioHelper
  DioHelper.init();
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  /// Providers
  getIt.registerLazySingleton<AppStateModel>(() => AppStateModel());
  // getIt.registerLazySingleton(() => LocalNotifications());

  /// Repository

  /// Blocs
  getIt.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  getIt.registerLazySingleton<LocalizationBloc>(() => LocalizationBloc());
 
}
