import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/startup/data/startup_repo.dart';
import 'package:x_calcu/features/startup/data/system_setting_model.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
part 'system_setting_cubit.freezed.dart';
part 'system_setting_state.dart';

class SystemSettingCubit extends Cubit<SystemSettingState> {
  final StartUpRepo _repo;

  SystemSettingCubit(this._repo) : super(const SystemSettingState.initial());

  Future<void> getSystemSetting() async {
    emit(const SystemSettingState.loading());

    final res = await _repo.getSystemSettings();

    res.when(success: (data) {
      emit(SystemSettingState.loaded(data: data));
      // getIt<AppStateModel>().setSystemSetting(data: data);
    }, failure: (e) {
      emit(SystemSettingState.error(error: e.message));
    });
  }
}
