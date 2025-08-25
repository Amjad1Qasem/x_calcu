// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthModel user) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function(String message) error,
    required TResult Function(bool isVisible) passwordVisibilityToggled,
    required TResult Function() loggedOut,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthModel user)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function(String message)? error,
    TResult? Function(bool isVisible)? passwordVisibilityToggled,
    TResult? Function()? loggedOut,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthModel user)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function(String message)? error,
    TResult Function(bool isVisible)? passwordVisibilityToggled,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Suspended value) suspended,
    required TResult Function(Banned value) banned,
    required TResult Function(Error value) error,
    required TResult Function(PasswordVisibilityToggled value)
    passwordVisibilityToggled,
    required TResult Function(LoggedOut value) loggedOut,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Suspended value)? suspended,
    TResult? Function(Banned value)? banned,
    TResult? Function(Error value)? error,
    TResult? Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult? Function(LoggedOut value)? loggedOut,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Suspended value)? suspended,
    TResult Function(Banned value)? banned,
    TResult Function(Error value)? error,
    TResult Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult Function(LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthModel user) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function(String message) error,
    required TResult Function(bool isVisible) passwordVisibilityToggled,
    required TResult Function() loggedOut,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthModel user)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function(String message)? error,
    TResult? Function(bool isVisible)? passwordVisibilityToggled,
    TResult? Function()? loggedOut,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthModel user)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function(String message)? error,
    TResult Function(bool isVisible)? passwordVisibilityToggled,
    TResult Function()? loggedOut,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Suspended value) suspended,
    required TResult Function(Banned value) banned,
    required TResult Function(Error value) error,
    required TResult Function(PasswordVisibilityToggled value)
    passwordVisibilityToggled,
    required TResult Function(LoggedOut value) loggedOut,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Suspended value)? suspended,
    TResult? Function(Banned value)? banned,
    TResult? Function(Error value)? error,
    TResult? Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult? Function(LoggedOut value)? loggedOut,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Suspended value)? suspended,
    TResult Function(Banned value)? banned,
    TResult Function(Error value)? error,
    TResult Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult Function(LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
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
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthModel user) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function(String message) error,
    required TResult Function(bool isVisible) passwordVisibilityToggled,
    required TResult Function() loggedOut,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthModel user)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function(String message)? error,
    TResult? Function(bool isVisible)? passwordVisibilityToggled,
    TResult? Function()? loggedOut,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthModel user)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function(String message)? error,
    TResult Function(bool isVisible)? passwordVisibilityToggled,
    TResult Function()? loggedOut,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Suspended value) suspended,
    required TResult Function(Banned value) banned,
    required TResult Function(Error value) error,
    required TResult Function(PasswordVisibilityToggled value)
    passwordVisibilityToggled,
    required TResult Function(LoggedOut value) loggedOut,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Suspended value)? suspended,
    TResult? Function(Banned value)? banned,
    TResult? Function(Error value)? error,
    TResult? Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult? Function(LoggedOut value)? loggedOut,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Suspended value)? suspended,
    TResult Function(Banned value)? banned,
    TResult Function(Error value)? error,
    TResult Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult Function(LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements AuthState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthModel user});

  $AuthModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null}) {
    return _then(
      _$SuccessImpl(
        null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                as AuthModel,
      ),
    );
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthModelCopyWith<$Res> get user {
    return $AuthModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl(this.user);

  @override
  final AuthModel user;

  @override
  String toString() {
    return 'AuthState.success(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthModel user) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function(String message) error,
    required TResult Function(bool isVisible) passwordVisibilityToggled,
    required TResult Function() loggedOut,
  }) {
    return success(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthModel user)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function(String message)? error,
    TResult? Function(bool isVisible)? passwordVisibilityToggled,
    TResult? Function()? loggedOut,
  }) {
    return success?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthModel user)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function(String message)? error,
    TResult Function(bool isVisible)? passwordVisibilityToggled,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Suspended value) suspended,
    required TResult Function(Banned value) banned,
    required TResult Function(Error value) error,
    required TResult Function(PasswordVisibilityToggled value)
    passwordVisibilityToggled,
    required TResult Function(LoggedOut value) loggedOut,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Suspended value)? suspended,
    TResult? Function(Banned value)? banned,
    TResult? Function(Error value)? error,
    TResult? Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult? Function(LoggedOut value)? loggedOut,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Suspended value)? suspended,
    TResult Function(Banned value)? banned,
    TResult Function(Error value)? error,
    TResult Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult Function(LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements AuthState {
  const factory Success(final AuthModel user) = _$SuccessImpl;

  AuthModel get user;

  /// Create a copy of AuthState
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
    extends _$AuthStateCopyWithImpl<$Res, _$SuspendedImpl>
    implements _$$SuspendedImplCopyWith<$Res> {
  __$$SuspendedImplCopyWithImpl(
    _$SuspendedImpl _value,
    $Res Function(_$SuspendedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
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

  /// Create a copy of AuthState
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

class _$SuspendedImpl implements Suspended {
  const _$SuspendedImpl(this.accountDetails);

  @override
  final AuthModel accountDetails;

  @override
  String toString() {
    return 'AuthState.suspended(accountDetails: $accountDetails)';
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

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuspendedImplCopyWith<_$SuspendedImpl> get copyWith =>
      __$$SuspendedImplCopyWithImpl<_$SuspendedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthModel user) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function(String message) error,
    required TResult Function(bool isVisible) passwordVisibilityToggled,
    required TResult Function() loggedOut,
  }) {
    return suspended(accountDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthModel user)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function(String message)? error,
    TResult? Function(bool isVisible)? passwordVisibilityToggled,
    TResult? Function()? loggedOut,
  }) {
    return suspended?.call(accountDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthModel user)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function(String message)? error,
    TResult Function(bool isVisible)? passwordVisibilityToggled,
    TResult Function()? loggedOut,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Suspended value) suspended,
    required TResult Function(Banned value) banned,
    required TResult Function(Error value) error,
    required TResult Function(PasswordVisibilityToggled value)
    passwordVisibilityToggled,
    required TResult Function(LoggedOut value) loggedOut,
  }) {
    return suspended(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Suspended value)? suspended,
    TResult? Function(Banned value)? banned,
    TResult? Function(Error value)? error,
    TResult? Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult? Function(LoggedOut value)? loggedOut,
  }) {
    return suspended?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Suspended value)? suspended,
    TResult Function(Banned value)? banned,
    TResult Function(Error value)? error,
    TResult Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult Function(LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (suspended != null) {
      return suspended(this);
    }
    return orElse();
  }
}

abstract class Suspended implements AuthState {
  const factory Suspended(final AuthModel accountDetails) = _$SuspendedImpl;

  AuthModel get accountDetails;

  /// Create a copy of AuthState
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
    extends _$AuthStateCopyWithImpl<$Res, _$BannedImpl>
    implements _$$BannedImplCopyWith<$Res> {
  __$$BannedImplCopyWithImpl(
    _$BannedImpl _value,
    $Res Function(_$BannedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
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

  /// Create a copy of AuthState
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

class _$BannedImpl implements Banned {
  const _$BannedImpl(this.accountDetails);

  @override
  final AuthModel accountDetails;

  @override
  String toString() {
    return 'AuthState.banned(accountDetails: $accountDetails)';
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

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannedImplCopyWith<_$BannedImpl> get copyWith =>
      __$$BannedImplCopyWithImpl<_$BannedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthModel user) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function(String message) error,
    required TResult Function(bool isVisible) passwordVisibilityToggled,
    required TResult Function() loggedOut,
  }) {
    return banned(accountDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthModel user)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function(String message)? error,
    TResult? Function(bool isVisible)? passwordVisibilityToggled,
    TResult? Function()? loggedOut,
  }) {
    return banned?.call(accountDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthModel user)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function(String message)? error,
    TResult Function(bool isVisible)? passwordVisibilityToggled,
    TResult Function()? loggedOut,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Suspended value) suspended,
    required TResult Function(Banned value) banned,
    required TResult Function(Error value) error,
    required TResult Function(PasswordVisibilityToggled value)
    passwordVisibilityToggled,
    required TResult Function(LoggedOut value) loggedOut,
  }) {
    return banned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Suspended value)? suspended,
    TResult? Function(Banned value)? banned,
    TResult? Function(Error value)? error,
    TResult? Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult? Function(LoggedOut value)? loggedOut,
  }) {
    return banned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Suspended value)? suspended,
    TResult Function(Banned value)? banned,
    TResult Function(Error value)? error,
    TResult Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult Function(LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (banned != null) {
      return banned(this);
    }
    return orElse();
  }
}

abstract class Banned implements AuthState {
  const factory Banned(final AuthModel accountDetails) = _$BannedImpl;

  AuthModel get accountDetails;

  /// Create a copy of AuthState
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
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthModel user) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function(String message) error,
    required TResult Function(bool isVisible) passwordVisibilityToggled,
    required TResult Function() loggedOut,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthModel user)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function(String message)? error,
    TResult? Function(bool isVisible)? passwordVisibilityToggled,
    TResult? Function()? loggedOut,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthModel user)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function(String message)? error,
    TResult Function(bool isVisible)? passwordVisibilityToggled,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Suspended value) suspended,
    required TResult Function(Banned value) banned,
    required TResult Function(Error value) error,
    required TResult Function(PasswordVisibilityToggled value)
    passwordVisibilityToggled,
    required TResult Function(LoggedOut value) loggedOut,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Suspended value)? suspended,
    TResult? Function(Banned value)? banned,
    TResult? Function(Error value)? error,
    TResult? Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult? Function(LoggedOut value)? loggedOut,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Suspended value)? suspended,
    TResult Function(Banned value)? banned,
    TResult Function(Error value)? error,
    TResult Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult Function(LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements AuthState {
  const factory Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordVisibilityToggledImplCopyWith<$Res> {
  factory _$$PasswordVisibilityToggledImplCopyWith(
    _$PasswordVisibilityToggledImpl value,
    $Res Function(_$PasswordVisibilityToggledImpl) then,
  ) = __$$PasswordVisibilityToggledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isVisible});
}

/// @nodoc
class __$$PasswordVisibilityToggledImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$PasswordVisibilityToggledImpl>
    implements _$$PasswordVisibilityToggledImplCopyWith<$Res> {
  __$$PasswordVisibilityToggledImplCopyWithImpl(
    _$PasswordVisibilityToggledImpl _value,
    $Res Function(_$PasswordVisibilityToggledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isVisible = null}) {
    return _then(
      _$PasswordVisibilityToggledImpl(
        null == isVisible
            ? _value.isVisible
            : isVisible // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$PasswordVisibilityToggledImpl implements PasswordVisibilityToggled {
  const _$PasswordVisibilityToggledImpl(this.isVisible);

  @override
  final bool isVisible;

  @override
  String toString() {
    return 'AuthState.passwordVisibilityToggled(isVisible: $isVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordVisibilityToggledImpl &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isVisible);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordVisibilityToggledImplCopyWith<_$PasswordVisibilityToggledImpl>
  get copyWith => __$$PasswordVisibilityToggledImplCopyWithImpl<
    _$PasswordVisibilityToggledImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthModel user) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function(String message) error,
    required TResult Function(bool isVisible) passwordVisibilityToggled,
    required TResult Function() loggedOut,
  }) {
    return passwordVisibilityToggled(isVisible);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthModel user)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function(String message)? error,
    TResult? Function(bool isVisible)? passwordVisibilityToggled,
    TResult? Function()? loggedOut,
  }) {
    return passwordVisibilityToggled?.call(isVisible);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthModel user)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function(String message)? error,
    TResult Function(bool isVisible)? passwordVisibilityToggled,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (passwordVisibilityToggled != null) {
      return passwordVisibilityToggled(isVisible);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Suspended value) suspended,
    required TResult Function(Banned value) banned,
    required TResult Function(Error value) error,
    required TResult Function(PasswordVisibilityToggled value)
    passwordVisibilityToggled,
    required TResult Function(LoggedOut value) loggedOut,
  }) {
    return passwordVisibilityToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Suspended value)? suspended,
    TResult? Function(Banned value)? banned,
    TResult? Function(Error value)? error,
    TResult? Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult? Function(LoggedOut value)? loggedOut,
  }) {
    return passwordVisibilityToggled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Suspended value)? suspended,
    TResult Function(Banned value)? banned,
    TResult Function(Error value)? error,
    TResult Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult Function(LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (passwordVisibilityToggled != null) {
      return passwordVisibilityToggled(this);
    }
    return orElse();
  }
}

abstract class PasswordVisibilityToggled implements AuthState {
  const factory PasswordVisibilityToggled(final bool isVisible) =
      _$PasswordVisibilityToggledImpl;

  bool get isVisible;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordVisibilityToggledImplCopyWith<_$PasswordVisibilityToggledImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoggedOutImplCopyWith<$Res> {
  factory _$$LoggedOutImplCopyWith(
    _$LoggedOutImpl value,
    $Res Function(_$LoggedOutImpl) then,
  ) = __$$LoggedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoggedOutImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoggedOutImpl>
    implements _$$LoggedOutImplCopyWith<$Res> {
  __$$LoggedOutImplCopyWithImpl(
    _$LoggedOutImpl _value,
    $Res Function(_$LoggedOutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoggedOutImpl implements LoggedOut {
  const _$LoggedOutImpl();

  @override
  String toString() {
    return 'AuthState.loggedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoggedOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AuthModel user) success,
    required TResult Function(AuthModel accountDetails) suspended,
    required TResult Function(AuthModel accountDetails) banned,
    required TResult Function(String message) error,
    required TResult Function(bool isVisible) passwordVisibilityToggled,
    required TResult Function() loggedOut,
  }) {
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AuthModel user)? success,
    TResult? Function(AuthModel accountDetails)? suspended,
    TResult? Function(AuthModel accountDetails)? banned,
    TResult? Function(String message)? error,
    TResult? Function(bool isVisible)? passwordVisibilityToggled,
    TResult? Function()? loggedOut,
  }) {
    return loggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AuthModel user)? success,
    TResult Function(AuthModel accountDetails)? suspended,
    TResult Function(AuthModel accountDetails)? banned,
    TResult Function(String message)? error,
    TResult Function(bool isVisible)? passwordVisibilityToggled,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Suspended value) suspended,
    required TResult Function(Banned value) banned,
    required TResult Function(Error value) error,
    required TResult Function(PasswordVisibilityToggled value)
    passwordVisibilityToggled,
    required TResult Function(LoggedOut value) loggedOut,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Suspended value)? suspended,
    TResult? Function(Banned value)? banned,
    TResult? Function(Error value)? error,
    TResult? Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult? Function(LoggedOut value)? loggedOut,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Suspended value)? suspended,
    TResult Function(Banned value)? banned,
    TResult Function(Error value)? error,
    TResult Function(PasswordVisibilityToggled value)?
    passwordVisibilityToggled,
    TResult Function(LoggedOut value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class LoggedOut implements AuthState {
  const factory LoggedOut() = _$LoggedOutImpl;
}
