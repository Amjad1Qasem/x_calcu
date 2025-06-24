// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_policy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PrivacyPolicyModel _$PrivacyPolicyModelFromJson(Map<String, dynamic> json) {
  return _PrivacyPolicyModel.fromJson(json);
}

/// @nodoc
mixin _$PrivacyPolicyModel {
  String? get key => throw _privateConstructorUsedError;
  List<String>? get values => throw _privateConstructorUsedError;

  /// Serializes this PrivacyPolicyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivacyPolicyModelCopyWith<PrivacyPolicyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyPolicyModelCopyWith<$Res> {
  factory $PrivacyPolicyModelCopyWith(
    PrivacyPolicyModel value,
    $Res Function(PrivacyPolicyModel) then,
  ) = _$PrivacyPolicyModelCopyWithImpl<$Res, PrivacyPolicyModel>;
  @useResult
  $Res call({String? key, List<String>? values});
}

/// @nodoc
class _$PrivacyPolicyModelCopyWithImpl<$Res, $Val extends PrivacyPolicyModel>
    implements $PrivacyPolicyModelCopyWith<$Res> {
  _$PrivacyPolicyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? key = freezed, Object? values = freezed}) {
    return _then(
      _value.copyWith(
            key:
                freezed == key
                    ? _value.key
                    : key // ignore: cast_nullable_to_non_nullable
                        as String?,
            values:
                freezed == values
                    ? _value.values
                    : values // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrivacyPolicyModelImplCopyWith<$Res>
    implements $PrivacyPolicyModelCopyWith<$Res> {
  factory _$$PrivacyPolicyModelImplCopyWith(
    _$PrivacyPolicyModelImpl value,
    $Res Function(_$PrivacyPolicyModelImpl) then,
  ) = __$$PrivacyPolicyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? key, List<String>? values});
}

/// @nodoc
class __$$PrivacyPolicyModelImplCopyWithImpl<$Res>
    extends _$PrivacyPolicyModelCopyWithImpl<$Res, _$PrivacyPolicyModelImpl>
    implements _$$PrivacyPolicyModelImplCopyWith<$Res> {
  __$$PrivacyPolicyModelImplCopyWithImpl(
    _$PrivacyPolicyModelImpl _value,
    $Res Function(_$PrivacyPolicyModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? key = freezed, Object? values = freezed}) {
    return _then(
      _$PrivacyPolicyModelImpl(
        key:
            freezed == key
                ? _value.key
                : key // ignore: cast_nullable_to_non_nullable
                    as String?,
        values:
            freezed == values
                ? _value._values
                : values // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacyPolicyModelImpl implements _PrivacyPolicyModel {
  _$PrivacyPolicyModelImpl({this.key, final List<String>? values})
    : _values = values;

  factory _$PrivacyPolicyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacyPolicyModelImplFromJson(json);

  @override
  final String? key;
  final List<String>? _values;
  @override
  List<String>? get values {
    final value = _values;
    if (value == null) return null;
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PrivacyPolicyModel(key: $key, values: $values)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyPolicyModelImpl &&
            (identical(other.key, key) || other.key == key) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    key,
    const DeepCollectionEquality().hash(_values),
  );

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacyPolicyModelImplCopyWith<_$PrivacyPolicyModelImpl> get copyWith =>
      __$$PrivacyPolicyModelImplCopyWithImpl<_$PrivacyPolicyModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacyPolicyModelImplToJson(this);
  }
}

abstract class _PrivacyPolicyModel implements PrivacyPolicyModel {
  factory _PrivacyPolicyModel({final String? key, final List<String>? values}) =
      _$PrivacyPolicyModelImpl;

  factory _PrivacyPolicyModel.fromJson(Map<String, dynamic> json) =
      _$PrivacyPolicyModelImpl.fromJson;

  @override
  String? get key;
  @override
  List<String>? get values;

  /// Create a copy of PrivacyPolicyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivacyPolicyModelImplCopyWith<_$PrivacyPolicyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
