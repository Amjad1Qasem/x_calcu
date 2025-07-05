// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_partner_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetPartnerState {
  List<DropDownModel> get fielData => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;

  /// Create a copy of GetPartnerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetPartnerStateCopyWith<GetPartnerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPartnerStateCopyWith<$Res> {
  factory $GetPartnerStateCopyWith(
    GetPartnerState value,
    $Res Function(GetPartnerState) then,
  ) = _$GetPartnerStateCopyWithImpl<$Res, GetPartnerState>;
  @useResult
  $Res call({
    List<DropDownModel> fielData,
    bool isError,
    bool isLoading,
    bool isSuccess,
  });
}

/// @nodoc
class _$GetPartnerStateCopyWithImpl<$Res, $Val extends GetPartnerState>
    implements $GetPartnerStateCopyWith<$Res> {
  _$GetPartnerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetPartnerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fielData = null,
    Object? isError = null,
    Object? isLoading = null,
    Object? isSuccess = null,
  }) {
    return _then(
      _value.copyWith(
            fielData:
                null == fielData
                    ? _value.fielData
                    : fielData // ignore: cast_nullable_to_non_nullable
                        as List<DropDownModel>,
            isError:
                null == isError
                    ? _value.isError
                    : isError // ignore: cast_nullable_to_non_nullable
                        as bool,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            isSuccess:
                null == isSuccess
                    ? _value.isSuccess
                    : isSuccess // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetPartnerStateImplCopyWith<$Res>
    implements $GetPartnerStateCopyWith<$Res> {
  factory _$$GetPartnerStateImplCopyWith(
    _$GetPartnerStateImpl value,
    $Res Function(_$GetPartnerStateImpl) then,
  ) = __$$GetPartnerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<DropDownModel> fielData,
    bool isError,
    bool isLoading,
    bool isSuccess,
  });
}

/// @nodoc
class __$$GetPartnerStateImplCopyWithImpl<$Res>
    extends _$GetPartnerStateCopyWithImpl<$Res, _$GetPartnerStateImpl>
    implements _$$GetPartnerStateImplCopyWith<$Res> {
  __$$GetPartnerStateImplCopyWithImpl(
    _$GetPartnerStateImpl _value,
    $Res Function(_$GetPartnerStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetPartnerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fielData = null,
    Object? isError = null,
    Object? isLoading = null,
    Object? isSuccess = null,
  }) {
    return _then(
      _$GetPartnerStateImpl(
        fielData:
            null == fielData
                ? _value._fielData
                : fielData // ignore: cast_nullable_to_non_nullable
                    as List<DropDownModel>,
        isError:
            null == isError
                ? _value.isError
                : isError // ignore: cast_nullable_to_non_nullable
                    as bool,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        isSuccess:
            null == isSuccess
                ? _value.isSuccess
                : isSuccess // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$GetPartnerStateImpl implements _GetPartnerState {
  const _$GetPartnerStateImpl({
    final List<DropDownModel> fielData = const [],
    this.isError = false,
    this.isLoading = false,
    this.isSuccess = false,
  }) : _fielData = fielData;

  final List<DropDownModel> _fielData;
  @override
  @JsonKey()
  List<DropDownModel> get fielData {
    if (_fielData is EqualUnmodifiableListView) return _fielData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fielData);
  }

  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;

  @override
  String toString() {
    return 'GetPartnerState(fielData: $fielData, isError: $isError, isLoading: $isLoading, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPartnerStateImpl &&
            const DeepCollectionEquality().equals(other._fielData, _fielData) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_fielData),
    isError,
    isLoading,
    isSuccess,
  );

  /// Create a copy of GetPartnerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPartnerStateImplCopyWith<_$GetPartnerStateImpl> get copyWith =>
      __$$GetPartnerStateImplCopyWithImpl<_$GetPartnerStateImpl>(
        this,
        _$identity,
      );
}

abstract class _GetPartnerState implements GetPartnerState {
  const factory _GetPartnerState({
    final List<DropDownModel> fielData,
    final bool isError,
    final bool isLoading,
    final bool isSuccess,
  }) = _$GetPartnerStateImpl;

  @override
  List<DropDownModel> get fielData;
  @override
  bool get isError;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;

  /// Create a copy of GetPartnerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetPartnerStateImplCopyWith<_$GetPartnerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
