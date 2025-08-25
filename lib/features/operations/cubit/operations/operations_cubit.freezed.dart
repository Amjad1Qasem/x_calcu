// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operations_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OperationsState {
  bool? get isLoading => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;
  bool? get isError => throw _privateConstructorUsedError;
  bool? get isOutputOperation => throw _privateConstructorUsedError;
  OperationModel? get operation => throw _privateConstructorUsedError;

  /// Create a copy of OperationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OperationsStateCopyWith<OperationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationsStateCopyWith<$Res> {
  factory $OperationsStateCopyWith(
    OperationsState value,
    $Res Function(OperationsState) then,
  ) = _$OperationsStateCopyWithImpl<$Res, OperationsState>;
  @useResult
  $Res call({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    bool? isOutputOperation,
    OperationModel? operation,
  });

  $OperationModelCopyWith<$Res>? get operation;
}

/// @nodoc
class _$OperationsStateCopyWithImpl<$Res, $Val extends OperationsState>
    implements $OperationsStateCopyWith<$Res> {
  _$OperationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? isError = freezed,
    Object? isOutputOperation = freezed,
    Object? operation = freezed,
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
            isOutputOperation:
                freezed == isOutputOperation
                    ? _value.isOutputOperation
                    : isOutputOperation // ignore: cast_nullable_to_non_nullable
                        as bool?,
            operation:
                freezed == operation
                    ? _value.operation
                    : operation // ignore: cast_nullable_to_non_nullable
                        as OperationModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of OperationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperationModelCopyWith<$Res>? get operation {
    if (_value.operation == null) {
      return null;
    }

    return $OperationModelCopyWith<$Res>(_value.operation!, (value) {
      return _then(_value.copyWith(operation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OperationsStateImplCopyWith<$Res>
    implements $OperationsStateCopyWith<$Res> {
  factory _$$OperationsStateImplCopyWith(
    _$OperationsStateImpl value,
    $Res Function(_$OperationsStateImpl) then,
  ) = __$$OperationsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    bool? isOutputOperation,
    OperationModel? operation,
  });

  @override
  $OperationModelCopyWith<$Res>? get operation;
}

/// @nodoc
class __$$OperationsStateImplCopyWithImpl<$Res>
    extends _$OperationsStateCopyWithImpl<$Res, _$OperationsStateImpl>
    implements _$$OperationsStateImplCopyWith<$Res> {
  __$$OperationsStateImplCopyWithImpl(
    _$OperationsStateImpl _value,
    $Res Function(_$OperationsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OperationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? isError = freezed,
    Object? isOutputOperation = freezed,
    Object? operation = freezed,
  }) {
    return _then(
      _$OperationsStateImpl(
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
        isOutputOperation:
            freezed == isOutputOperation
                ? _value.isOutputOperation
                : isOutputOperation // ignore: cast_nullable_to_non_nullable
                    as bool?,
        operation:
            freezed == operation
                ? _value.operation
                : operation // ignore: cast_nullable_to_non_nullable
                    as OperationModel?,
      ),
    );
  }
}

/// @nodoc

class _$OperationsStateImpl implements _OperationsState {
  const _$OperationsStateImpl({
    this.isLoading = false,
    this.isSuccess = false,
    this.isError = false,
    this.isOutputOperation = false,
    this.operation,
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
  @JsonKey()
  final bool? isOutputOperation;
  @override
  final OperationModel? operation;

  @override
  String toString() {
    return 'OperationsState(isLoading: $isLoading, isSuccess: $isSuccess, isError: $isError, isOutputOperation: $isOutputOperation, operation: $operation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isOutputOperation, isOutputOperation) ||
                other.isOutputOperation == isOutputOperation) &&
            (identical(other.operation, operation) ||
                other.operation == operation));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isSuccess,
    isError,
    isOutputOperation,
    operation,
  );

  /// Create a copy of OperationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationsStateImplCopyWith<_$OperationsStateImpl> get copyWith =>
      __$$OperationsStateImplCopyWithImpl<_$OperationsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _OperationsState implements OperationsState {
  const factory _OperationsState({
    final bool? isLoading,
    final bool? isSuccess,
    final bool? isError,
    final bool? isOutputOperation,
    final OperationModel? operation,
  }) = _$OperationsStateImpl;

  @override
  bool? get isLoading;
  @override
  bool? get isSuccess;
  @override
  bool? get isError;
  @override
  bool? get isOutputOperation;
  @override
  OperationModel? get operation;

  /// Create a copy of OperationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperationsStateImplCopyWith<_$OperationsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
