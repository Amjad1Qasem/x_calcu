import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/global/utils/helper/local_storage_helper.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState.initial()) {
    on<FetchTheme>(_onFetchTheme);
    on<SetDark>(_onSetDark);
    on<SetLight>(_onSetLight);
  }

  /// ** Load Theme from Storage**
  Future<void> _onFetchTheme(FetchTheme event, Emitter<ThemeState> emit) async {
    final ThemeMode themeMode = await LocalStorageHelper.getTheme();
    emit(ThemeState.fetched(themeMode));
  }

  Future<void> _onSetDark(SetDark event, Emitter<ThemeState> emit) async {
    const ThemeMode darkThemeMode = ThemeMode.dark;
    await LocalStorageHelper.setTheme(darkThemeMode);
    emit(const ThemeState.fetched(darkThemeMode));
  }

  Future<void> _onSetLight(SetLight event, Emitter<ThemeState> emit) async {
    const ThemeMode lightThemeMode = ThemeMode.light;
    await LocalStorageHelper.setTheme(lightThemeMode);
    emit(const ThemeState.fetched(lightThemeMode));
  }
}
