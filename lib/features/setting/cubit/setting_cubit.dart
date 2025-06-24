import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/global/utils/helper/local_storage_helper.dart';

part 'setting_state.dart';
part 'setting_cubit.freezed.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState.initial());

  void checkIfUserLogin() async {
    final String? token = await LocalStorageHelper.getToken();
    printWarning('tokentoken ${token.runtimeType}');
    if (token != null) {
      printWarning('userIslogin ');
      emit(const SettingState.userIslogin());
    } else {
      printWarning('userIsVisator ');
      emit(const SettingState.userIsVisator());
    }
  }
}
