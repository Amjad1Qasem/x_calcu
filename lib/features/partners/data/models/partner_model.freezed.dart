// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PartnerModel _$PartnerModelFromJson(Map<String, dynamic> json) {
  return _PartnerModel.fromJson(json);
}

/// @nodoc
mixin _$PartnerModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_percentage_value')
  String? get totalPercentageValue => throw _privateConstructorUsedError;

  /// Serializes this PartnerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PartnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PartnerModelCopyWith<PartnerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerModelCopyWith<$Res> {
  factory $PartnerModelCopyWith(
    PartnerModel value,
    $Res Function(PartnerModel) then,
  ) = _$PartnerModelCopyWithImpl<$Res, PartnerModel>;
  @useResult
  $Res call({
    int? id,
    String? name,
    String? phone,
    String? email,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'total_percentage_value') String? totalPercentageValue,
  });
}

/// @nodoc
class _$PartnerModelCopyWithImpl<$Res, $Val extends PartnerModel>
    implements $PartnerModelCopyWith<$Res> {
  _$PartnerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PartnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? totalPercentageValue = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            phone:
                freezed == phone
                    ? _value.phone
                    : phone // ignore: cast_nullable_to_non_nullable
                        as String?,
            email:
                freezed == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            totalPercentageValue:
                freezed == totalPercentageValue
                    ? _value.totalPercentageValue
                    : totalPercentageValue // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PartnerModelImplCopyWith<$Res>
    implements $PartnerModelCopyWith<$Res> {
  factory _$$PartnerModelImplCopyWith(
    _$PartnerModelImpl value,
    $Res Function(_$PartnerModelImpl) then,
  ) = __$$PartnerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? name,
    String? phone,
    String? email,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'total_percentage_value') String? totalPercentageValue,
  });
}

/// @nodoc
class __$$PartnerModelImplCopyWithImpl<$Res>
    extends _$PartnerModelCopyWithImpl<$Res, _$PartnerModelImpl>
    implements _$$PartnerModelImplCopyWith<$Res> {
  __$$PartnerModelImplCopyWithImpl(
    _$PartnerModelImpl _value,
    $Res Function(_$PartnerModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PartnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
    Object? totalPercentageValue = freezed,
  }) {
    return _then(
      _$PartnerModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        phone:
            freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                    as String?,
        email:
            freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        totalPercentageValue:
            freezed == totalPercentageValue
                ? _value.totalPercentageValue
                : totalPercentageValue // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PartnerModelImpl implements _PartnerModel {
  const _$PartnerModelImpl({
    this.id,
    this.name,
    this.phone,
    this.email,
    @JsonKey(name: 'updated_at') this.updatedAt,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'total_percentage_value') this.totalPercentageValue,
  });

  factory _$PartnerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartnerModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'total_percentage_value')
  final String? totalPercentageValue;

  @override
  String toString() {
    return 'PartnerModel(id: $id, name: $name, phone: $phone, email: $email, updatedAt: $updatedAt, createdAt: $createdAt, totalPercentageValue: $totalPercentageValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartnerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.totalPercentageValue, totalPercentageValue) ||
                other.totalPercentageValue == totalPercentageValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    phone,
    email,
    updatedAt,
    createdAt,
    totalPercentageValue,
  );

  /// Create a copy of PartnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PartnerModelImplCopyWith<_$PartnerModelImpl> get copyWith =>
      __$$PartnerModelImplCopyWithImpl<_$PartnerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartnerModelImplToJson(this);
  }
}

abstract class _PartnerModel implements PartnerModel {
  const factory _PartnerModel({
    final int? id,
    final String? name,
    final String? phone,
    final String? email,
    @JsonKey(name: 'updated_at') final String? updatedAt,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'total_percentage_value') final String? totalPercentageValue,
  }) = _$PartnerModelImpl;

  factory _PartnerModel.fromJson(Map<String, dynamic> json) =
      _$PartnerModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'total_percentage_value')
  String? get totalPercentageValue;

  /// Create a copy of PartnerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PartnerModelImplCopyWith<_$PartnerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
