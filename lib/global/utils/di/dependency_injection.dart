import 'package:get_it/get_it.dart';
import 'package:x_calcu/features/companies/cubit/companies_cubit.dart';
import 'package:x_calcu/features/companies/data/companies_repo.dart';
import 'package:x_calcu/features/home/cubit/home_cubit.dart';
import 'package:x_calcu/features/home/data/home_repo.dart';
import 'package:x_calcu/features/login/cubit/auth_cubit.dart';
import 'package:x_calcu/features/login/data/auth_repo.dart';
import 'package:x_calcu/features/operations/cubit/get_partner/get_partner_cubit.dart';
import 'package:x_calcu/features/operations/cubit/operations/operations_cubit.dart';
import 'package:x_calcu/features/operations/cubit/edit_operation/edit_operation_cubit.dart';
import 'package:x_calcu/features/operations/cubit/get_operations/get_operations_cubit.dart';
import 'package:x_calcu/features/operations/cubit/create_operation/create_operation_cubit.dart';
import 'package:x_calcu/features/operations/data/operations_repo.dart';
import 'package:x_calcu/features/partners/cubit/add_partner/add_partner_cubit.dart';
import 'package:x_calcu/features/partners/cubit/partners/partner_cubit.dart';
import 'package:x_calcu/features/partners/data/repo/partner_repo.dart';
import 'package:x_calcu/features/setting/cubit/setting_cubit.dart';
import 'package:x_calcu/features/startup/bloc/biometric_auth/biometric_auth_cubit.dart';
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
  getIt.registerLazySingleton<PartnerRepo>(() => PartnerRepo());
  getIt.registerLazySingleton<OperationsRepo>(() => OperationsRepo());
  getIt.registerLazySingleton<CompaniesRepo>(() => CompaniesRepo());

  /// Blocs
  getIt.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  getIt.registerLazySingleton<BiometricAuthCubit>(() => BiometricAuthCubit());
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
  getIt.registerLazySingleton<PartnerCubit>(
    () => PartnerCubit(getIt<PartnerRepo>()),
  );
  getIt.registerFactory<OperationsCubit>(
    () => OperationsCubit(getIt<OperationsRepo>()),
  );
  getIt.registerLazySingleton<GetPartnerCubit>(
    () => GetPartnerCubit(getIt<OperationsRepo>()),
  );
  getIt.registerLazySingleton<EditOperationCubit>(
    () => EditOperationCubit(getIt<OperationsRepo>()),
  );
  getIt.registerLazySingleton<GetOperationsCubit>(
    () => GetOperationsCubit(getIt<OperationsRepo>()),
  );
  getIt.registerLazySingleton<CreateOperationCubit>(
    () => CreateOperationCubit(getIt<OperationsRepo>()),
  );
  getIt.registerLazySingleton<AddPartnerCubit>(
    () => AddPartnerCubit(getIt<PartnerRepo>()),
  );
  getIt.registerLazySingleton<CompaniesCubit>(
    () => CompaniesCubit(getIt<CompaniesRepo>()),
  );
}
