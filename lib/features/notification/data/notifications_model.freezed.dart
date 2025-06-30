// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NotificationsModel _$NotificationsModelFromJson(Map<String, dynamic> json) {
  return _NotificationsModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationsModel {
  String? get title => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;
  NotificationsType get type => throw _privateConstructorUsedError;

  /// Serializes this NotificationsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationsModelCopyWith<NotificationsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsModelCopyWith<$Res> {
  factory $NotificationsModelCopyWith(
    NotificationsModel value,
    $Res Function(NotificationsModel) then,
  ) = _$NotificationsModelCopyWithImpl<$Res, NotificationsModel>;
  @useResult
  $Res call({
    String? title,
    String? message,
    String? date,
    bool? isRead,
    NotificationsType type,
  });
}

/// @nodoc
class _$NotificationsModelCopyWithImpl<$Res, $Val extends NotificationsModel>
    implements $NotificationsModelCopyWith<$Res> {
  _$NotificationsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? message = freezed,
    Object? date = freezed,
    Object? isRead = freezed,
    Object? type = null,
  }) {
    return _then(
      _value.copyWith(
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            message:
                freezed == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String?,
            date:
                freezed == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as String?,
            isRead:
                freezed == isRead
                    ? _value.isRead
                    : isRead // ignore: cast_nullable_to_non_nullable
                        as bool?,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as NotificationsType,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationsModelImplCopyWith<$Res>
    implements $NotificationsModelCopyWith<$Res> {
  factory _$$NotificationsModelImplCopyWith(
    _$NotificationsModelImpl value,
    $Res Function(_$NotificationsModelImpl) then,
  ) = __$$NotificationsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? title,
    String? message,
    String? date,
    bool? isRead,
    NotificationsType type,
  });
}

/// @nodoc
class __$$NotificationsModelImplCopyWithImpl<$Res>
    extends _$NotificationsModelCopyWithImpl<$Res, _$NotificationsModelImpl>
    implements _$$NotificationsModelImplCopyWith<$Res> {
  __$$NotificationsModelImplCopyWithImpl(
    _$NotificationsModelImpl _value,
    $Res Function(_$NotificationsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? message = freezed,
    Object? date = freezed,
    Object? isRead = freezed,
    Object? type = null,
  }) {
    return _then(
      _$NotificationsModelImpl(
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String?,
        date:
            freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as String?,
        isRead:
            freezed == isRead
                ? _value.isRead
                : isRead // ignore: cast_nullable_to_non_nullable
                    as bool?,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as NotificationsType,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationsModelImpl implements _NotificationsModel {
  const _$NotificationsModelImpl({
    this.title,
    this.message,
    this.date,
    this.isRead,
    required this.type,
  });

  factory _$NotificationsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationsModelImplFromJson(json);

  @override
  final String? title;
  @override
  final String? message;
  @override
  final String? date;
  @override
  final bool? isRead;
  @override
  final NotificationsType type;

  @override
  String toString() {
    return 'NotificationsModel(title: $title, message: $message, date: $date, isRead: $isRead, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, message, date, isRead, type);

  /// Create a copy of NotificationsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsModelImplCopyWith<_$NotificationsModelImpl> get copyWith =>
      __$$NotificationsModelImplCopyWithImpl<_$NotificationsModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationsModelImplToJson(this);
  }
}

abstract class _NotificationsModel implements NotificationsModel {
  const factory _NotificationsModel({
    final String? title,
    final String? message,
    final String? date,
    final bool? isRead,
    required final NotificationsType type,
  }) = _$NotificationsModelImpl;

  factory _NotificationsModel.fromJson(Map<String, dynamic> json) =
      _$NotificationsModelImpl.fromJson;

  @override
  String? get title;
  @override
  String? get message;
  @override
  String? get date;
  @override
  bool? get isRead;
  @override
  NotificationsType get type;

  /// Create a copy of NotificationsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationsModelImplCopyWith<_$NotificationsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
