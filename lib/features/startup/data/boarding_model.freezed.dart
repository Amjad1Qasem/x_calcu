// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boarding_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Boarding _$BoardingFromJson(Map<String, dynamic> json) {
  return _Boarding.fromJson(json);
}

/// @nodoc
mixin _$Boarding {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;

  /// Serializes this Boarding to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Boarding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoardingCopyWith<Boarding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardingCopyWith<$Res> {
  factory $BoardingCopyWith(Boarding value, $Res Function(Boarding) then) =
      _$BoardingCopyWithImpl<$Res, Boarding>;
  @useResult
  $Res call({
    int? id,
    String? title,
    String? image,
    String? description,
    int? order,
  });
}

/// @nodoc
class _$BoardingCopyWithImpl<$Res, $Val extends Boarding>
    implements $BoardingCopyWith<$Res> {
  _$BoardingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Boarding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? order = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            image:
                freezed == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            order:
                freezed == order
                    ? _value.order
                    : order // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BoardingImplCopyWith<$Res>
    implements $BoardingCopyWith<$Res> {
  factory _$$BoardingImplCopyWith(
    _$BoardingImpl value,
    $Res Function(_$BoardingImpl) then,
  ) = __$$BoardingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? title,
    String? image,
    String? description,
    int? order,
  });
}

/// @nodoc
class __$$BoardingImplCopyWithImpl<$Res>
    extends _$BoardingCopyWithImpl<$Res, _$BoardingImpl>
    implements _$$BoardingImplCopyWith<$Res> {
  __$$BoardingImplCopyWithImpl(
    _$BoardingImpl _value,
    $Res Function(_$BoardingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Boarding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? order = freezed,
  }) {
    return _then(
      _$BoardingImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        image:
            freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        order:
            freezed == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardingImpl implements _Boarding {
  const _$BoardingImpl({
    this.id,
    this.title,
    this.image,
    this.description,
    this.order,
  });

  factory _$BoardingImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardingImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? image;
  @override
  final String? description;
  @override
  final int? order;

  @override
  String toString() {
    return 'Boarding(id: $id, title: $title, image: $image, description: $description, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, image, description, order);

  /// Create a copy of Boarding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardingImplCopyWith<_$BoardingImpl> get copyWith =>
      __$$BoardingImplCopyWithImpl<_$BoardingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardingImplToJson(this);
  }
}

abstract class _Boarding implements Boarding {
  const factory _Boarding({
    final int? id,
    final String? title,
    final String? image,
    final String? description,
    final int? order,
  }) = _$BoardingImpl;

  factory _Boarding.fromJson(Map<String, dynamic> json) =
      _$BoardingImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get image;
  @override
  String? get description;
  @override
  int? get order;

  /// Create a copy of Boarding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardingImplCopyWith<_$BoardingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
