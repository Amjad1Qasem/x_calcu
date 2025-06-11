// // ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
// import 'package:blue_buysale/global/core/app_state.dart';
// import 'package:blue_buysale/global/utils/di/dependency_injection.dart';
// import 'package:blue_buysale/global/utils/helper/local_storage_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jiffy/jiffy.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/local_storage_helper.dart';
// import 'package:jiffy/jiffy.dart';

part 'localization_bloc.freezed.dart';
part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(const LocalizationState.initial()) {
    on<FetchLocalization>(_onFetchLocalization);
    on<SetEnglish>(_onSetEnglish);
    on<SetArabic>(_onSetArabic);
  }

  Future<void> _onFetchLocalization(
      FetchLocalization event, Emitter<LocalizationState> emit) async {
    final locale = await LocalStorageHelper.getLocale();
    _setLocale(locale, emit, event);
  }

  Future<void> _onSetEnglish(
      SetEnglish event, Emitter<LocalizationState> emit) async {
    _setLocale(const Locale('en'), emit, event);
  }

  Future<void> _onSetArabic(
      SetArabic event, Emitter<LocalizationState> emit) async {
    _setLocale(const Locale('ar'), emit, event);
  }

  void _setLocale(Locale locale, Emitter<LocalizationState> emit, event) async {
    await LocalStorageHelper.setLocale(locale);
    await Jiffy.setLocale(locale.languageCode);
    getIt<AppStateModel>().setLocale(locale);
    await EasyLocalization.of(event.context)?.setLocale(locale);

    if (!emit.isDone) {
      // Check if the emitter is still active
      emit(LocalizationState.fetched(locale)); // Emit the new state
    }
  }
}
