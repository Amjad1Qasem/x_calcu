import 'package:get_it/get_it.dart';
import 'package:x_calcu/features/home/cubit/home_cubit.dart';
import 'package:x_calcu/features/home/data/home_repo.dart';
import 'package:x_calcu/features/login/cubit/auth_cubit.dart';
import 'package:x_calcu/features/login/data/auth_repo.dart';
import 'package:x_calcu/features/setting/cubit/setting_cubit.dart';
import 'package:x_calcu/features/startup/bloc/startup/startup_cubit.dart';
import 'package:x_calcu/features/startup/bloc/system_setting/system_setting_cubit.dart';
import 'package:x_calcu/features/startup/data/startup_repo.dart';
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
  getIt.registerLazySingleton<StartUpRepo>(() => StartUpRepo());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo());

  /// Blocs
  getIt.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  getIt.registerLazySingleton<LocalizationBloc>(() => LocalizationBloc());
  getIt.registerLazySingleton<StartupCubit>(
    () => StartupCubit(getIt<StartUpRepo>()),
  );
  getIt.registerLazySingleton<SystemSettingCubit>(
    () => SystemSettingCubit(getIt<StartUpRepo>()),
  );
  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<SettingCubit>(() => SettingCubit());
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
}
