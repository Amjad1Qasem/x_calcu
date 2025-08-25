// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_partner_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddPartnerState {
  bool? get isLoading => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  bool? get isError => throw _privateConstructorUsedError;
  PartnerModel? get data => throw _privateConstructorUsedError;

  /// Create a copy of AddPartnerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddPartnerStateCopyWith<AddPartnerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPartnerStateCopyWith<$Res> {
  factory $AddPartnerStateCopyWith(
    AddPartnerState value,
    $Res Function(AddPartnerState) then,
  ) = _$AddPartnerStateCopyWithImpl<$Res, AddPartnerState>;
  @useResult
  $Res call({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    PartnerModel? data,
  });

  $PartnerModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$AddPartnerStateCopyWithImpl<$Res, $Val extends AddPartnerState>
    implements $AddPartnerStateCopyWith<$Res> {
  _$AddPartnerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddPartnerState
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
                        as PartnerModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of AddPartnerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartnerModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PartnerModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddPartnerStateImplCopyWith<$Res>
    implements $AddPartnerStateCopyWith<$Res> {
  factory _$$AddPartnerStateImplCopyWith(
    _$AddPartnerStateImpl value,
    $Res Function(_$AddPartnerStateImpl) then,
  ) = __$$AddPartnerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    PartnerModel? data,
  });

  @override
  $PartnerModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$AddPartnerStateImplCopyWithImpl<$Res>
    extends _$AddPartnerStateCopyWithImpl<$Res, _$AddPartnerStateImpl>
    implements _$$AddPartnerStateImplCopyWith<$Res> {
  __$$AddPartnerStateImplCopyWithImpl(
    _$AddPartnerStateImpl _value,
    $Res Function(_$AddPartnerStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddPartnerState
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
      _$AddPartnerStateImpl(
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
                    as PartnerModel?,
      ),
    );
  }
}

/// @nodoc

class _$AddPartnerStateImpl implements _AddPartnerState {
  const _$AddPartnerStateImpl({
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
  final PartnerModel? data;

  @override
  String toString() {
    return 'AddPartnerState(isLoading: $isLoading, isSuccess: $isSuccess, isError: $isError, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPartnerStateImpl &&
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

  /// Create a copy of AddPartnerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPartnerStateImplCopyWith<_$AddPartnerStateImpl> get copyWith =>
      __$$AddPartnerStateImplCopyWithImpl<_$AddPartnerStateImpl>(
        this,
        _$identity,
      );
}

abstract class _AddPartnerState implements AddPartnerState {
  const factory _AddPartnerState({
    final bool? isLoading,
    final bool? isSuccess,
    final bool? isError,
    final PartnerModel? data,
  }) = _$AddPartnerStateImpl;

  @override
  bool? get isLoading;
  @override
  bool? get isSuccess;
  @override
  bool? get isError;
  @override
  PartnerModel? get data;

  /// Create a copy of AddPartnerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddPartnerStateImplCopyWith<_$AddPartnerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
