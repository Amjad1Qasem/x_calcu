// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ThemeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTheme,
    required TResult Function() setDark,
    required TResult Function() setLight,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchTheme,
    TResult? Function()? setDark,
    TResult? Function()? setLight,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTheme,
    TResult Function()? setDark,
    TResult Function()? setLight,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTheme value) fetchTheme,
    required TResult Function(SetDark value) setDark,
    required TResult Function(SetLight value) setLight,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchTheme value)? fetchTheme,
    TResult? Function(SetDark value)? setDark,
    TResult? Function(SetLight value)? setLight,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTheme value)? fetchTheme,
    TResult Function(SetDark value)? setDark,
    TResult Function(SetLight value)? setLight,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
    ThemeEvent value,
    $Res Function(ThemeEvent) then,
  ) = _$ThemeEventCopyWithImpl<$Res, ThemeEvent>;
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res, $Val extends ThemeEvent>
    implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchThemeImplCopyWith<$Res> {
  factory _$$FetchThemeImplCopyWith(
    _$FetchThemeImpl value,
    $Res Function(_$FetchThemeImpl) then,
  ) = __$$FetchThemeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchThemeImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$FetchThemeImpl>
    implements _$$FetchThemeImplCopyWith<$Res> {
  __$$FetchThemeImplCopyWithImpl(
    _$FetchThemeImpl _value,
    $Res Function(_$FetchThemeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchThemeImpl implements FetchTheme {
  const _$FetchThemeImpl();

  @override
  String toString() {
    return 'ThemeEvent.fetchTheme()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchThemeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTheme,
    required TResult Function() setDark,
    required TResult Function() setLight,
  }) {
    return fetchTheme();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchTheme,
    TResult? Function()? setDark,
    TResult? Function()? setLight,
  }) {
    return fetchTheme?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTheme,
    TResult Function()? setDark,
    TResult Function()? setLight,
    required TResult orElse(),
  }) {
    if (fetchTheme != null) {
      return fetchTheme();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTheme value) fetchTheme,
    required TResult Function(SetDark value) setDark,
    required TResult Function(SetLight value) setLight,
  }) {
    return fetchTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchTheme value)? fetchTheme,
    TResult? Function(SetDark value)? setDark,
    TResult? Function(SetLight value)? setLight,
  }) {
    return fetchTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTheme value)? fetchTheme,
    TResult Function(SetDark value)? setDark,
    TResult Function(SetLight value)? setLight,
    required TResult orElse(),
  }) {
    if (fetchTheme != null) {
      return fetchTheme(this);
    }
    return orElse();
  }
}

abstract class FetchTheme implements ThemeEvent {
  const factory FetchTheme() = _$FetchThemeImpl;
}

/// @nodoc
abstract class _$$SetDarkImplCopyWith<$Res> {
  factory _$$SetDarkImplCopyWith(
    _$SetDarkImpl value,
    $Res Function(_$SetDarkImpl) then,
  ) = __$$SetDarkImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetDarkImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$SetDarkImpl>
    implements _$$SetDarkImplCopyWith<$Res> {
  __$$SetDarkImplCopyWithImpl(
    _$SetDarkImpl _value,
    $Res Function(_$SetDarkImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SetDarkImpl implements SetDark {
  const _$SetDarkImpl();

  @override
  String toString() {
    return 'ThemeEvent.setDark()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SetDarkImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTheme,
    required TResult Function() setDark,
    required TResult Function() setLight,
  }) {
    return setDark();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchTheme,
    TResult? Function()? setDark,
    TResult? Function()? setLight,
  }) {
    return setDark?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTheme,
    TResult Function()? setDark,
    TResult Function()? setLight,
    required TResult orElse(),
  }) {
    if (setDark != null) {
      return setDark();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTheme value) fetchTheme,
    required TResult Function(SetDark value) setDark,
    required TResult Function(SetLight value) setLight,
  }) {
    return setDark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchTheme value)? fetchTheme,
    TResult? Function(SetDark value)? setDark,
    TResult? Function(SetLight value)? setLight,
  }) {
    return setDark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTheme value)? fetchTheme,
    TResult Function(SetDark value)? setDark,
    TResult Function(SetLight value)? setLight,
    required TResult orElse(),
  }) {
    if (setDark != null) {
      return setDark(this);
    }
    return orElse();
  }
}

abstract class SetDark implements ThemeEvent {
  const factory SetDark() = _$SetDarkImpl;
}

/// @nodoc
abstract class _$$SetLightImplCopyWith<$Res> {
  factory _$$SetLightImplCopyWith(
    _$SetLightImpl value,
    $Res Function(_$SetLightImpl) then,
  ) = __$$SetLightImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetLightImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$SetLightImpl>
    implements _$$SetLightImplCopyWith<$Res> {
  __$$SetLightImplCopyWithImpl(
    _$SetLightImpl _value,
    $Res Function(_$SetLightImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SetLightImpl implements SetLight {
  const _$SetLightImpl();

  @override
  String toString() {
    return 'ThemeEvent.setLight()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SetLightImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTheme,
    required TResult Function() setDark,
    required TResult Function() setLight,
  }) {
    return setLight();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchTheme,
    TResult? Function()? setDark,
    TResult? Function()? setLight,
  }) {
    return setLight?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTheme,
    TResult Function()? setDark,
    TResult Function()? setLight,
    required TResult orElse(),
  }) {
    if (setLight != null) {
      return setLight();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTheme value) fetchTheme,
    required TResult Function(SetDark value) setDark,
    required TResult Function(SetLight value) setLight,
  }) {
    return setLight(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchTheme value)? fetchTheme,
    TResult? Function(SetDark value)? setDark,
    TResult? Function(SetLight value)? setLight,
  }) {
    return setLight?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTheme value)? fetchTheme,
    TResult Function(SetDark value)? setDark,
    TResult Function(SetLight value)? setLight,
    required TResult orElse(),
  }) {
    if (setLight != null) {
      return setLight(this);
    }
    return orElse();
  }
}

abstract class SetLight implements ThemeEvent {
  const factory SetLight() = _$SetLightImpl;
}

/// @nodoc
mixin _$ThemeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ThemeMode themeMode) fetched,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ThemeMode themeMode)? fetched,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ThemeMode themeMode)? fetched,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThemeInitial value) initial,
    required TResult Function(ThemeFetched value) fetched,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ThemeInitial value)? initial,
    TResult? Function(ThemeFetched value)? fetched,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThemeInitial value)? initial,
    TResult Function(ThemeFetched value)? fetched,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
    ThemeState value,
    $Res Function(ThemeState) then,
  ) = _$ThemeStateCopyWithImpl<$Res, ThemeState>;
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res, $Val extends ThemeState>
    implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ThemeInitialImplCopyWith<$Res> {
  factory _$$ThemeInitialImplCopyWith(
    _$ThemeInitialImpl value,
    $Res Function(_$ThemeInitialImpl) then,
  ) = __$$ThemeInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ThemeInitialImplCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res, _$ThemeInitialImpl>
    implements _$$ThemeInitialImplCopyWith<$Res> {
  __$$ThemeInitialImplCopyWithImpl(
    _$ThemeInitialImpl _value,
    $Res Function(_$ThemeInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ThemeInitialImpl extends ThemeInitial {
  const _$ThemeInitialImpl() : super._();

  @override
  String toString() {
    return 'ThemeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ThemeInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ThemeMode themeMode) fetched,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ThemeMode themeMode)? fetched,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ThemeMode themeMode)? fetched,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThemeInitial value) initial,
    required TResult Function(ThemeFetched value) fetched,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ThemeInitial value)? initial,
    TResult? Function(ThemeFetched value)? fetched,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThemeInitial value)? initial,
    TResult Function(ThemeFetched value)? fetched,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ThemeInitial extends ThemeState {
  const factory ThemeInitial() = _$ThemeInitialImpl;
  const ThemeInitial._() : super._();
}

/// @nodoc
abstract class _$$ThemeFetchedImplCopyWith<$Res> {
  factory _$$ThemeFetchedImplCopyWith(
    _$ThemeFetchedImpl value,
    $Res Function(_$ThemeFetchedImpl) then,
  ) = __$$ThemeFetchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$$ThemeFetchedImplCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res, _$ThemeFetchedImpl>
    implements _$$ThemeFetchedImplCopyWith<$Res> {
  __$$ThemeFetchedImplCopyWithImpl(
    _$ThemeFetchedImpl _value,
    $Res Function(_$ThemeFetchedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? themeMode = null}) {
    return _then(
      _$ThemeFetchedImpl(
        null == themeMode
            ? _value.themeMode
            : themeMode // ignore: cast_nullable_to_non_nullable
                as ThemeMode,
      ),
    );
  }
}

/// @nodoc

class _$ThemeFetchedImpl extends ThemeFetched {
  const _$ThemeFetchedImpl(this.themeMode) : super._();

  @override
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'ThemeState.fetched(themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeFetchedImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeFetchedImplCopyWith<_$ThemeFetchedImpl> get copyWith =>
      __$$ThemeFetchedImplCopyWithImpl<_$ThemeFetchedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ThemeMode themeMode) fetched,
  }) {
    return fetched(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(ThemeMode themeMode)? fetched,
  }) {
    return fetched?.call(themeMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ThemeMode themeMode)? fetched,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(themeMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThemeInitial value) initial,
    required TResult Function(ThemeFetched value) fetched,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ThemeInitial value)? initial,
    TResult? Function(ThemeFetched value)? fetched,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThemeInitial value)? initial,
    TResult Function(ThemeFetched value)? fetched,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class ThemeFetched extends ThemeState {
  const factory ThemeFetched(final ThemeMode themeMode) = _$ThemeFetchedImpl;
  const ThemeFetched._() : super._();

  ThemeMode get themeMode;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeFetchedImplCopyWith<_$ThemeFetchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
