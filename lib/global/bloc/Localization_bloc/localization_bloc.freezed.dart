// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LocalizationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchLocalization,
    required TResult Function(BuildContext context) setEnglish,
    required TResult Function(BuildContext context) setArabic,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchLocalization,
    TResult? Function(BuildContext context)? setEnglish,
    TResult? Function(BuildContext context)? setArabic,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchLocalization,
    TResult Function(BuildContext context)? setEnglish,
    TResult Function(BuildContext context)? setArabic,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchLocalization value) fetchLocalization,
    required TResult Function(SetEnglish value) setEnglish,
    required TResult Function(SetArabic value) setArabic,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchLocalization value)? fetchLocalization,
    TResult? Function(SetEnglish value)? setEnglish,
    TResult? Function(SetArabic value)? setArabic,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchLocalization value)? fetchLocalization,
    TResult Function(SetEnglish value)? setEnglish,
    TResult Function(SetArabic value)? setArabic,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationEventCopyWith<$Res> {
  factory $LocalizationEventCopyWith(
    LocalizationEvent value,
    $Res Function(LocalizationEvent) then,
  ) = _$LocalizationEventCopyWithImpl<$Res, LocalizationEvent>;
}

/// @nodoc
class _$LocalizationEventCopyWithImpl<$Res, $Val extends LocalizationEvent>
    implements $LocalizationEventCopyWith<$Res> {
  _$LocalizationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalizationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchLocalizationImplCopyWith<$Res> {
  factory _$$FetchLocalizationImplCopyWith(
    _$FetchLocalizationImpl value,
    $Res Function(_$FetchLocalizationImpl) then,
  ) = __$$FetchLocalizationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchLocalizationImplCopyWithImpl<$Res>
    extends _$LocalizationEventCopyWithImpl<$Res, _$FetchLocalizationImpl>
    implements _$$FetchLocalizationImplCopyWith<$Res> {
  __$$FetchLocalizationImplCopyWithImpl(
    _$FetchLocalizationImpl _value,
    $Res Function(_$FetchLocalizationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocalizationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchLocalizationImpl implements FetchLocalization {
  const _$FetchLocalizationImpl();

  @override
  String toString() {
    return 'LocalizationEvent.fetchLocalization()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchLocalizationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchLocalization,
    required TResult Function(BuildContext context) setEnglish,
    required TResult Function(BuildContext context) setArabic,
  }) {
    return fetchLocalization();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchLocalization,
    TResult? Function(BuildContext context)? setEnglish,
    TResult? Function(BuildContext context)? setArabic,
  }) {
    return fetchLocalization?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchLocalization,
    TResult Function(BuildContext context)? setEnglish,
    TResult Function(BuildContext context)? setArabic,
    required TResult orElse(),
  }) {
    if (fetchLocalization != null) {
      return fetchLocalization();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchLocalization value) fetchLocalization,
    required TResult Function(SetEnglish value) setEnglish,
    required TResult Function(SetArabic value) setArabic,
  }) {
    return fetchLocalization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchLocalization value)? fetchLocalization,
    TResult? Function(SetEnglish value)? setEnglish,
    TResult? Function(SetArabic value)? setArabic,
  }) {
    return fetchLocalization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchLocalization value)? fetchLocalization,
    TResult Function(SetEnglish value)? setEnglish,
    TResult Function(SetArabic value)? setArabic,
    required TResult orElse(),
  }) {
    if (fetchLocalization != null) {
      return fetchLocalization(this);
    }
    return orElse();
  }
}

abstract class FetchLocalization implements LocalizationEvent {
  const factory FetchLocalization() = _$FetchLocalizationImpl;
}

/// @nodoc
abstract class _$$SetEnglishImplCopyWith<$Res> {
  factory _$$SetEnglishImplCopyWith(
    _$SetEnglishImpl value,
    $Res Function(_$SetEnglishImpl) then,
  ) = __$$SetEnglishImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$SetEnglishImplCopyWithImpl<$Res>
    extends _$LocalizationEventCopyWithImpl<$Res, _$SetEnglishImpl>
    implements _$$SetEnglishImplCopyWith<$Res> {
  __$$SetEnglishImplCopyWithImpl(
    _$SetEnglishImpl _value,
    $Res Function(_$SetEnglishImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocalizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? context = null}) {
    return _then(
      _$SetEnglishImpl(
        null == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                as BuildContext,
      ),
    );
  }
}

/// @nodoc

class _$SetEnglishImpl implements SetEnglish {
  const _$SetEnglishImpl(this.context);

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'LocalizationEvent.setEnglish(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetEnglishImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  /// Create a copy of LocalizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetEnglishImplCopyWith<_$SetEnglishImpl> get copyWith =>
      __$$SetEnglishImplCopyWithImpl<_$SetEnglishImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchLocalization,
    required TResult Function(BuildContext context) setEnglish,
    required TResult Function(BuildContext context) setArabic,
  }) {
    return setEnglish(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchLocalization,
    TResult? Function(BuildContext context)? setEnglish,
    TResult? Function(BuildContext context)? setArabic,
  }) {
    return setEnglish?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchLocalization,
    TResult Function(BuildContext context)? setEnglish,
    TResult Function(BuildContext context)? setArabic,
    required TResult orElse(),
  }) {
    if (setEnglish != null) {
      return setEnglish(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchLocalization value) fetchLocalization,
    required TResult Function(SetEnglish value) setEnglish,
    required TResult Function(SetArabic value) setArabic,
  }) {
    return setEnglish(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchLocalization value)? fetchLocalization,
    TResult? Function(SetEnglish value)? setEnglish,
    TResult? Function(SetArabic value)? setArabic,
  }) {
    return setEnglish?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchLocalization value)? fetchLocalization,
    TResult Function(SetEnglish value)? setEnglish,
    TResult Function(SetArabic value)? setArabic,
    required TResult orElse(),
  }) {
    if (setEnglish != null) {
      return setEnglish(this);
    }
    return orElse();
  }
}

abstract class SetEnglish implements LocalizationEvent {
  const factory SetEnglish(final BuildContext context) = _$SetEnglishImpl;

  BuildContext get context;

  /// Create a copy of LocalizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetEnglishImplCopyWith<_$SetEnglishImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetArabicImplCopyWith<$Res> {
  factory _$$SetArabicImplCopyWith(
    _$SetArabicImpl value,
    $Res Function(_$SetArabicImpl) then,
  ) = __$$SetArabicImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$SetArabicImplCopyWithImpl<$Res>
    extends _$LocalizationEventCopyWithImpl<$Res, _$SetArabicImpl>
    implements _$$SetArabicImplCopyWith<$Res> {
  __$$SetArabicImplCopyWithImpl(
    _$SetArabicImpl _value,
    $Res Function(_$SetArabicImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocalizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? context = null}) {
    return _then(
      _$SetArabicImpl(
        null == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                as BuildContext,
      ),
    );
  }
}

/// @nodoc

class _$SetArabicImpl implements SetArabic {
  const _$SetArabicImpl(this.context);

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'LocalizationEvent.setArabic(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetArabicImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  /// Create a copy of LocalizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetArabicImplCopyWith<_$SetArabicImpl> get copyWith =>
      __$$SetArabicImplCopyWithImpl<_$SetArabicImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchLocalization,
    required TResult Function(BuildContext context) setEnglish,
    required TResult Function(BuildContext context) setArabic,
  }) {
    return setArabic(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchLocalization,
    TResult? Function(BuildContext context)? setEnglish,
    TResult? Function(BuildContext context)? setArabic,
  }) {
    return setArabic?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchLocalization,
    TResult Function(BuildContext context)? setEnglish,
    TResult Function(BuildContext context)? setArabic,
    required TResult orElse(),
  }) {
    if (setArabic != null) {
      return setArabic(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchLocalization value) fetchLocalization,
    required TResult Function(SetEnglish value) setEnglish,
    required TResult Function(SetArabic value) setArabic,
  }) {
    return setArabic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchLocalization value)? fetchLocalization,
    TResult? Function(SetEnglish value)? setEnglish,
    TResult? Function(SetArabic value)? setArabic,
  }) {
    return setArabic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchLocalization value)? fetchLocalization,
    TResult Function(SetEnglish value)? setEnglish,
    TResult Function(SetArabic value)? setArabic,
    required TResult orElse(),
  }) {
    if (setArabic != null) {
      return setArabic(this);
    }
    return orElse();
  }
}

abstract class SetArabic implements LocalizationEvent {
  const factory SetArabic(final BuildContext context) = _$SetArabicImpl;

  BuildContext get context;

  /// Create a copy of LocalizationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetArabicImplCopyWith<_$SetArabicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LocalizationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Locale locale) fetched,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Locale locale)? fetched,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Locale locale)? fetched,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalizationInitial value) initial,
    required TResult Function(LocalizationFetched value) fetched,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocalizationInitial value)? initial,
    TResult? Function(LocalizationFetched value)? fetched,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalizationInitial value)? initial,
    TResult Function(LocalizationFetched value)? fetched,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationStateCopyWith<$Res> {
  factory $LocalizationStateCopyWith(
    LocalizationState value,
    $Res Function(LocalizationState) then,
  ) = _$LocalizationStateCopyWithImpl<$Res, LocalizationState>;
}

/// @nodoc
class _$LocalizationStateCopyWithImpl<$Res, $Val extends LocalizationState>
    implements $LocalizationStateCopyWith<$Res> {
  _$LocalizationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalizationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LocalizationInitialImplCopyWith<$Res> {
  factory _$$LocalizationInitialImplCopyWith(
    _$LocalizationInitialImpl value,
    $Res Function(_$LocalizationInitialImpl) then,
  ) = __$$LocalizationInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LocalizationInitialImplCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res, _$LocalizationInitialImpl>
    implements _$$LocalizationInitialImplCopyWith<$Res> {
  __$$LocalizationInitialImplCopyWithImpl(
    _$LocalizationInitialImpl _value,
    $Res Function(_$LocalizationInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocalizationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LocalizationInitialImpl extends LocalizationInitial {
  const _$LocalizationInitialImpl() : super._();

  @override
  String toString() {
    return 'LocalizationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalizationInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Locale locale) fetched,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Locale locale)? fetched,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Locale locale)? fetched,
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
    required TResult Function(LocalizationInitial value) initial,
    required TResult Function(LocalizationFetched value) fetched,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocalizationInitial value)? initial,
    TResult? Function(LocalizationFetched value)? fetched,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalizationInitial value)? initial,
    TResult Function(LocalizationFetched value)? fetched,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LocalizationInitial extends LocalizationState {
  const factory LocalizationInitial() = _$LocalizationInitialImpl;
  const LocalizationInitial._() : super._();
}

/// @nodoc
abstract class _$$LocalizationFetchedImplCopyWith<$Res> {
  factory _$$LocalizationFetchedImplCopyWith(
    _$LocalizationFetchedImpl value,
    $Res Function(_$LocalizationFetchedImpl) then,
  ) = __$$LocalizationFetchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class __$$LocalizationFetchedImplCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res, _$LocalizationFetchedImpl>
    implements _$$LocalizationFetchedImplCopyWith<$Res> {
  __$$LocalizationFetchedImplCopyWithImpl(
    _$LocalizationFetchedImpl _value,
    $Res Function(_$LocalizationFetchedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocalizationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? locale = null}) {
    return _then(
      _$LocalizationFetchedImpl(
        null == locale
            ? _value.locale
            : locale // ignore: cast_nullable_to_non_nullable
                as Locale,
      ),
    );
  }
}

/// @nodoc

class _$LocalizationFetchedImpl extends LocalizationFetched {
  const _$LocalizationFetchedImpl(this.locale) : super._();

  @override
  final Locale locale;

  @override
  String toString() {
    return 'LocalizationState.fetched(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalizationFetchedImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  /// Create a copy of LocalizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalizationFetchedImplCopyWith<_$LocalizationFetchedImpl> get copyWith =>
      __$$LocalizationFetchedImplCopyWithImpl<_$LocalizationFetchedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Locale locale) fetched,
  }) {
    return fetched(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Locale locale)? fetched,
  }) {
    return fetched?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Locale locale)? fetched,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalizationInitial value) initial,
    required TResult Function(LocalizationFetched value) fetched,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LocalizationInitial value)? initial,
    TResult? Function(LocalizationFetched value)? fetched,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalizationInitial value)? initial,
    TResult Function(LocalizationFetched value)? fetched,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class LocalizationFetched extends LocalizationState {
  const factory LocalizationFetched(final Locale locale) =
      _$LocalizationFetchedImpl;
  const LocalizationFetched._() : super._();

  Locale get locale;

  /// Create a copy of LocalizationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalizationFetchedImplCopyWith<_$LocalizationFetchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
