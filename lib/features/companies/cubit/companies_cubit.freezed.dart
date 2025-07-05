// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'companies_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CompaniesState {
  bool? get isLoading => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  bool? get isError => throw _privateConstructorUsedError;
  CompaniesModel? get data => throw _privateConstructorUsedError;

  /// Create a copy of CompaniesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompaniesStateCopyWith<CompaniesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompaniesStateCopyWith<$Res> {
  factory $CompaniesStateCopyWith(
    CompaniesState value,
    $Res Function(CompaniesState) then,
  ) = _$CompaniesStateCopyWithImpl<$Res, CompaniesState>;
  @useResult
  $Res call({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    CompaniesModel? data,
  });

  $CompaniesModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$CompaniesStateCopyWithImpl<$Res, $Val extends CompaniesState>
    implements $CompaniesStateCopyWith<$Res> {
  _$CompaniesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompaniesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? isError = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                freezed == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool?,
            isSuccess:
                freezed == isSuccess
                    ? _value.isSuccess
                    : isSuccess // ignore: cast_nullable_to_non_nullable
                        as bool?,
            isError:
                freezed == isError
                    ? _value.isError
                    : isError // ignore: cast_nullable_to_non_nullable
                        as bool?,
            data:
                freezed == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as CompaniesModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of CompaniesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompaniesModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CompaniesModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CompaniesStateImplCopyWith<$Res>
    implements $CompaniesStateCopyWith<$Res> {
  factory _$$CompaniesStateImplCopyWith(
    _$CompaniesStateImpl value,
    $Res Function(_$CompaniesStateImpl) then,
  ) = __$$CompaniesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    CompaniesModel? data,
  });

  @override
  $CompaniesModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CompaniesStateImplCopyWithImpl<$Res>
    extends _$CompaniesStateCopyWithImpl<$Res, _$CompaniesStateImpl>
    implements _$$CompaniesStateImplCopyWith<$Res> {
  __$$CompaniesStateImplCopyWithImpl(
    _$CompaniesStateImpl _value,
    $Res Function(_$CompaniesStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CompaniesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? isError = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _$CompaniesStateImpl(
        isLoading:
            freezed == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool?,
        isSuccess:
            freezed == isSuccess
                ? _value.isSuccess
                : isSuccess // ignore: cast_nullable_to_non_nullable
                    as bool?,
        isError:
            freezed == isError
                ? _value.isError
                : isError // ignore: cast_nullable_to_non_nullable
                    as bool?,
        data:
            freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as CompaniesModel?,
      ),
    );
  }
}

/// @nodoc

class _$CompaniesStateImpl implements _CompaniesState {
  const _$CompaniesStateImpl({
    this.isLoading = false,
    this.isSuccess = false,
    this.isError = false,
    this.data,
  });

  @override
  @JsonKey()
  final bool? isLoading;
  @override
  @JsonKey()
  final bool? isSuccess;
  @override
  @JsonKey()
  final bool? isError;
  @override
  final CompaniesModel? data;

  @override
  String toString() {
    return 'CompaniesState(isLoading: $isLoading, isSuccess: $isSuccess, isError: $isError, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompaniesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isSuccess, isError, data);

  /// Create a copy of CompaniesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompaniesStateImplCopyWith<_$CompaniesStateImpl> get copyWith =>
      __$$CompaniesStateImplCopyWithImpl<_$CompaniesStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CompaniesState implements CompaniesState {
  const factory _CompaniesState({
    final bool? isLoading,
    final bool? isSuccess,
    final bool? isError,
    final CompaniesModel? data,
  }) = _$CompaniesStateImpl;

  @override
  bool? get isLoading;
  @override
  bool? get isSuccess;
  @override
  bool? get isError;
  @override
  CompaniesModel? get data;

  /// Create a copy of CompaniesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompaniesStateImplCopyWith<_$CompaniesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
