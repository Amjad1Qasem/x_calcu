// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistic_partner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StatisticPartnerModel _$StatisticPartnerModelFromJson(
  Map<String, dynamic> json,
) {
  return _StatisticPartnerModel.fromJson(json);
}

/// @nodoc
mixin _$StatisticPartnerModel {
  String get title => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  /// Serializes this StatisticPartnerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatisticPartnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatisticPartnerModelCopyWith<StatisticPartnerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticPartnerModelCopyWith<$Res> {
  factory $StatisticPartnerModelCopyWith(
    StatisticPartnerModel value,
    $Res Function(StatisticPartnerModel) then,
  ) = _$StatisticPartnerModelCopyWithImpl<$Res, StatisticPartnerModel>;
  @useResult
  $Res call({String title, String value});
}

/// @nodoc
class _$StatisticPartnerModelCopyWithImpl<
  $Res,
  $Val extends StatisticPartnerModel
>
    implements $StatisticPartnerModelCopyWith<$Res> {
  _$StatisticPartnerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatisticPartnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? title = null, Object? value = null}) {
    return _then(
      _value.copyWith(
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            value:
                null == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StatisticPartnerModelImplCopyWith<$Res>
    implements $StatisticPartnerModelCopyWith<$Res> {
  factory _$$StatisticPartnerModelImplCopyWith(
    _$StatisticPartnerModelImpl value,
    $Res Function(_$StatisticPartnerModelImpl) then,
  ) = __$$StatisticPartnerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String value});
}

/// @nodoc
class __$$StatisticPartnerModelImplCopyWithImpl<$Res>
    extends
        _$StatisticPartnerModelCopyWithImpl<$Res, _$StatisticPartnerModelImpl>
    implements _$$StatisticPartnerModelImplCopyWith<$Res> {
  __$$StatisticPartnerModelImplCopyWithImpl(
    _$StatisticPartnerModelImpl _value,
    $Res Function(_$StatisticPartnerModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatisticPartnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? title = null, Object? value = null}) {
    return _then(
      _$StatisticPartnerModelImpl(
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        value:
            null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StatisticPartnerModelImpl implements _StatisticPartnerModel {
  const _$StatisticPartnerModelImpl({required this.title, required this.value});

  factory _$StatisticPartnerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatisticPartnerModelImplFromJson(json);

  @override
  final String title;
  @override
  final String value;

  @override
  String toString() {
    return 'StatisticPartnerModel(title: $title, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticPartnerModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, value);

  /// Create a copy of StatisticPartnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticPartnerModelImplCopyWith<_$StatisticPartnerModelImpl>
  get copyWith =>
      __$$StatisticPartnerModelImplCopyWithImpl<_$StatisticPartnerModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StatisticPartnerModelImplToJson(this);
  }
}

abstract class _StatisticPartnerModel implements StatisticPartnerModel {
  const factory _StatisticPartnerModel({
    required final String title,
    required final String value,
  }) = _$StatisticPartnerModelImpl;

  factory _StatisticPartnerModel.fromJson(Map<String, dynamic> json) =
      _$StatisticPartnerModelImpl.fromJson;

  @override
  String get title;
  @override
  String get value;

  /// Create a copy of StatisticPartnerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatisticPartnerModelImplCopyWith<_$StatisticPartnerModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
