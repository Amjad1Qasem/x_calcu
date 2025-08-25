// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StartupState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() onboardingRequired,
    required TResult Function() unauthenticated,
    required TResult Function(AuthModel accountDetails) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function() error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? onboardingRequired,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthModel accountDetails)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function()? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? onboardingRequired,
    TResult Function()? unauthenticated,
    TResult Function(AuthModel accountDetails)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function()? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnboardingRequired value) onboardingRequired,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Success value) success,
    required TResult Function(_Suspended value) suspended,
    required TResult Function(_Banned value) banned,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OnboardingRequired value)? onboardingRequired,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Success value)? success,
    TResult? Function(_Suspended value)? suspended,
    TResult? Function(_Banned value)? banned,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_OnboardingRequired value)? onboardingRequired,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Success value)? success,
    TResult Function(_Suspended value)? suspended,
    TResult Function(_Banned value)? banned,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupStateCopyWith<$Res> {
  factory $StartupStateCopyWith(
    StartupState value,
    $Res Function(StartupState) then,
  ) = _$StartupStateCopyWithImpl<$Res, StartupState>;
}

/// @nodoc
class _$StartupStateCopyWithImpl<$Res, $Val extends StartupState>
    implements $StartupStateCopyWith<$Res> {
  _$StartupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$StartupStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'StartupState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() onboardingRequired,
    required TResult Function() unauthenticated,
    required TResult Function(AuthModel accountDetails) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? onboardingRequired,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthModel accountDetails)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? onboardingRequired,
    TResult Function()? unauthenticated,
    TResult Function(AuthModel accountDetails)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnboardingRequired value) onboardingRequired,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Success value) success,
    required TResult Function(_Suspended value) suspended,
    required TResult Function(_Banned value) banned,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OnboardingRequired value)? onboardingRequired,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Success value)? success,
    TResult? Function(_Suspended value)? suspended,
    TResult? Function(_Banned value)? banned,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_OnboardingRequired value)? onboardingRequired,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Success value)? success,
    TResult Function(_Suspended value)? suspended,
    TResult Function(_Banned value)? banned,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements StartupState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$OnboardingRequiredImplCopyWith<$Res> {
  factory _$$OnboardingRequiredImplCopyWith(
    _$OnboardingRequiredImpl value,
    $Res Function(_$OnboardingRequiredImpl) then,
  ) = __$$OnboardingRequiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnboardingRequiredImplCopyWithImpl<$Res>
    extends _$StartupStateCopyWithImpl<$Res, _$OnboardingRequiredImpl>
    implements _$$OnboardingRequiredImplCopyWith<$Res> {
  __$$OnboardingRequiredImplCopyWithImpl(
    _$OnboardingRequiredImpl _value,
    $Res Function(_$OnboardingRequiredImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnboardingRequiredImpl implements _OnboardingRequired {
  const _$OnboardingRequiredImpl();

  @override
  String toString() {
    return 'StartupState.onboardingRequired()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnboardingRequiredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() onboardingRequired,
    required TResult Function() unauthenticated,
    required TResult Function(AuthModel accountDetails) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function() error,
  }) {
    return onboardingRequired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? onboardingRequired,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthModel accountDetails)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function()? error,
  }) {
    return onboardingRequired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? onboardingRequired,
    TResult Function()? unauthenticated,
    TResult Function(AuthModel accountDetails)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (onboardingRequired != null) {
      return onboardingRequired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnboardingRequired value) onboardingRequired,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Success value) success,
    required TResult Function(_Suspended value) suspended,
    required TResult Function(_Banned value) banned,
    required TResult Function(_Error value) error,
  }) {
    return onboardingRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OnboardingRequired value)? onboardingRequired,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Success value)? success,
    TResult? Function(_Suspended value)? suspended,
    TResult? Function(_Banned value)? banned,
    TResult? Function(_Error value)? error,
  }) {
    return onboardingRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_OnboardingRequired value)? onboardingRequired,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Success value)? success,
    TResult Function(_Suspended value)? suspended,
    TResult Function(_Banned value)? banned,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (onboardingRequired != null) {
      return onboardingRequired(this);
    }
    return orElse();
  }
}

abstract class _OnboardingRequired implements StartupState {
  const factory _OnboardingRequired() = _$OnboardingRequiredImpl;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(
    _$UnauthenticatedImpl value,
    $Res Function(_$UnauthenticatedImpl) then,
  ) = __$$UnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$StartupStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
    _$UnauthenticatedImpl _value,
    $Res Function(_$UnauthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnauthenticatedImpl implements _Unauthenticated {
  const _$UnauthenticatedImpl();

  @override
  String toString() {
    return 'StartupState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() onboardingRequired,
    required TResult Function() unauthenticated,
    required TResult Function(AuthModel accountDetails) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function() error,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? onboardingRequired,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthModel accountDetails)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function()? error,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? onboardingRequired,
    TResult Function()? unauthenticated,
    TResult Function(AuthModel accountDetails)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnboardingRequired value) onboardingRequired,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Success value) success,
    required TResult Function(_Suspended value) suspended,
    required TResult Function(_Banned value) banned,
    required TResult Function(_Error value) error,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OnboardingRequired value)? onboardingRequired,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Success value)? success,
    TResult? Function(_Suspended value)? suspended,
    TResult? Function(_Banned value)? banned,
    TResult? Function(_Error value)? error,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_OnboardingRequired value)? onboardingRequired,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Success value)? success,
    TResult Function(_Suspended value)? suspended,
    TResult Function(_Banned value)? banned,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements StartupState {
  const factory _Unauthenticated() = _$UnauthenticatedImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthModel accountDetails});

  $AuthModelCopyWith<$Res> get accountDetails;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$StartupStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accountDetails = null}) {
    return _then(
      _$SuccessImpl(
        null == accountDetails
            ? _value.accountDetails
            : accountDetails // ignore: cast_nullable_to_non_nullable
                as AuthModel,
      ),
    );
  }

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthModelCopyWith<$Res> get accountDetails {
    return $AuthModelCopyWith<$Res>(_value.accountDetails, (value) {
      return _then(_value.copyWith(accountDetails: value));
    });
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.accountDetails);

  @override
  final AuthModel accountDetails;

  @override
  String toString() {
    return 'StartupState.success(accountDetails: $accountDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.accountDetails, accountDetails) ||
                other.accountDetails == accountDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountDetails);

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() onboardingRequired,
    required TResult Function() unauthenticated,
    required TResult Function(AuthModel accountDetails) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function() error,
  }) {
    return success(accountDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? onboardingRequired,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthModel accountDetails)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function()? error,
  }) {
    return success?.call(accountDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? onboardingRequired,
    TResult Function()? unauthenticated,
    TResult Function(AuthModel accountDetails)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(accountDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnboardingRequired value) onboardingRequired,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Success value) success,
    required TResult Function(_Suspended value) suspended,
    required TResult Function(_Banned value) banned,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OnboardingRequired value)? onboardingRequired,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Success value)? success,
    TResult? Function(_Suspended value)? suspended,
    TResult? Function(_Banned value)? banned,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_OnboardingRequired value)? onboardingRequired,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Success value)? success,
    TResult Function(_Suspended value)? suspended,
    TResult Function(_Banned value)? banned,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements StartupState {
  const factory _Success(final AuthModel accountDetails) = _$SuccessImpl;

  AuthModel get accountDetails;

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuspendedImplCopyWith<$Res> {
  factory _$$SuspendedImplCopyWith(
    _$SuspendedImpl value,
    $Res Function(_$SuspendedImpl) then,
  ) = __$$SuspendedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthModel accountDetails});

  $AuthModelCopyWith<$Res> get accountDetails;
}

/// @nodoc
class __$$SuspendedImplCopyWithImpl<$Res>
    extends _$StartupStateCopyWithImpl<$Res, _$SuspendedImpl>
    implements _$$SuspendedImplCopyWith<$Res> {
  __$$SuspendedImplCopyWithImpl(
    _$SuspendedImpl _value,
    $Res Function(_$SuspendedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accountDetails = null}) {
    return _then(
      _$SuspendedImpl(
        null == accountDetails
            ? _value.accountDetails
            : accountDetails // ignore: cast_nullable_to_non_nullable
                as AuthModel,
      ),
    );
  }

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthModelCopyWith<$Res> get accountDetails {
    return $AuthModelCopyWith<$Res>(_value.accountDetails, (value) {
      return _then(_value.copyWith(accountDetails: value));
    });
  }
}

/// @nodoc

class _$SuspendedImpl implements _Suspended {
  const _$SuspendedImpl(this.accountDetails);

  @override
  final AuthModel accountDetails;

  @override
  String toString() {
    return 'StartupState.suspended(accountDetails: $accountDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuspendedImpl &&
            (identical(other.accountDetails, accountDetails) ||
                other.accountDetails == accountDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountDetails);

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuspendedImplCopyWith<_$SuspendedImpl> get copyWith =>
      __$$SuspendedImplCopyWithImpl<_$SuspendedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() onboardingRequired,
    required TResult Function() unauthenticated,
    required TResult Function(AuthModel accountDetails) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function() error,
  }) {
    return suspended(accountDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? onboardingRequired,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthModel accountDetails)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function()? error,
  }) {
    return suspended?.call(accountDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? onboardingRequired,
    TResult Function()? unauthenticated,
    TResult Function(AuthModel accountDetails)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (suspended != null) {
      return suspended(accountDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnboardingRequired value) onboardingRequired,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Success value) success,
    required TResult Function(_Suspended value) suspended,
    required TResult Function(_Banned value) banned,
    required TResult Function(_Error value) error,
  }) {
    return suspended(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OnboardingRequired value)? onboardingRequired,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Success value)? success,
    TResult? Function(_Suspended value)? suspended,
    TResult? Function(_Banned value)? banned,
    TResult? Function(_Error value)? error,
  }) {
    return suspended?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_OnboardingRequired value)? onboardingRequired,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Success value)? success,
    TResult Function(_Suspended value)? suspended,
    TResult Function(_Banned value)? banned,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (suspended != null) {
      return suspended(this);
    }
    return orElse();
  }
}

abstract class _Suspended implements StartupState {
  const factory _Suspended(final AuthModel accountDetails) = _$SuspendedImpl;

  AuthModel get accountDetails;

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuspendedImplCopyWith<_$SuspendedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BannedImplCopyWith<$Res> {
  factory _$$BannedImplCopyWith(
    _$BannedImpl value,
    $Res Function(_$BannedImpl) then,
  ) = __$$BannedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthModel accountDetails});

  $AuthModelCopyWith<$Res> get accountDetails;
}

/// @nodoc
class __$$BannedImplCopyWithImpl<$Res>
    extends _$StartupStateCopyWithImpl<$Res, _$BannedImpl>
    implements _$$BannedImplCopyWith<$Res> {
  __$$BannedImplCopyWithImpl(
    _$BannedImpl _value,
    $Res Function(_$BannedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accountDetails = null}) {
    return _then(
      _$BannedImpl(
        null == accountDetails
            ? _value.accountDetails
            : accountDetails // ignore: cast_nullable_to_non_nullable
                as AuthModel,
      ),
    );
  }

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthModelCopyWith<$Res> get accountDetails {
    return $AuthModelCopyWith<$Res>(_value.accountDetails, (value) {
      return _then(_value.copyWith(accountDetails: value));
    });
  }
}

/// @nodoc

class _$BannedImpl implements _Banned {
  const _$BannedImpl(this.accountDetails);

  @override
  final AuthModel accountDetails;

  @override
  String toString() {
    return 'StartupState.banned(accountDetails: $accountDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannedImpl &&
            (identical(other.accountDetails, accountDetails) ||
                other.accountDetails == accountDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountDetails);

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannedImplCopyWith<_$BannedImpl> get copyWith =>
      __$$BannedImplCopyWithImpl<_$BannedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() onboardingRequired,
    required TResult Function() unauthenticated,
    required TResult Function(AuthModel accountDetails) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function() error,
  }) {
    return banned(accountDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? onboardingRequired,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthModel accountDetails)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function()? error,
  }) {
    return banned?.call(accountDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? onboardingRequired,
    TResult Function()? unauthenticated,
    TResult Function(AuthModel accountDetails)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (banned != null) {
      return banned(accountDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnboardingRequired value) onboardingRequired,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Success value) success,
    required TResult Function(_Suspended value) suspended,
    required TResult Function(_Banned value) banned,
    required TResult Function(_Error value) error,
  }) {
    return banned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OnboardingRequired value)? onboardingRequired,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Success value)? success,
    TResult? Function(_Suspended value)? suspended,
    TResult? Function(_Banned value)? banned,
    TResult? Function(_Error value)? error,
  }) {
    return banned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_OnboardingRequired value)? onboardingRequired,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Success value)? success,
    TResult Function(_Suspended value)? suspended,
    TResult Function(_Banned value)? banned,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (banned != null) {
      return banned(this);
    }
    return orElse();
  }
}

abstract class _Banned implements StartupState {
  const factory _Banned(final AuthModel accountDetails) = _$BannedImpl;

  AuthModel get accountDetails;

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannedImplCopyWith<_$BannedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$StartupStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StartupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'StartupState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() onboardingRequired,
    required TResult Function() unauthenticated,
    required TResult Function(AuthModel accountDetails) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? onboardingRequired,
    TResult? Function()? unauthenticated,
    TResult? Function(AuthModel accountDetails)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? onboardingRequired,
    TResult Function()? unauthenticated,
    TResult Function(AuthModel accountDetails)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_OnboardingRequired value) onboardingRequired,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Success value) success,
    required TResult Function(_Suspended value) suspended,
    required TResult Function(_Banned value) banned,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_OnboardingRequired value)? onboardingRequired,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Success value)? success,
    TResult? Function(_Suspended value)? suspended,
    TResult? Function(_Banned value)? banned,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_OnboardingRequired value)? onboardingRequired,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Success value)? success,
    TResult Function(_Suspended value)? suspended,
    TResult Function(_Banned value)? banned,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements StartupState {
  const factory _Error() = _$ErrorImpl;
}
