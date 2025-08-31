// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operations_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PaidInvoiceDetail _$PaidInvoiceDetailFromJson(Map<String, dynamic> json) {
  return _PaidInvoiceDetail.fromJson(json);
}

/// @nodoc
mixin _$PaidInvoiceDetail {
  @JsonKey(name: 'invoice_value')
  double? get invoiceValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_date')
  String? get invoiceDate => throw _privateConstructorUsedError;

  /// Serializes this PaidInvoiceDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaidInvoiceDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaidInvoiceDetailCopyWith<PaidInvoiceDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaidInvoiceDetailCopyWith<$Res> {
  factory $PaidInvoiceDetailCopyWith(
    PaidInvoiceDetail value,
    $Res Function(PaidInvoiceDetail) then,
  ) = _$PaidInvoiceDetailCopyWithImpl<$Res, PaidInvoiceDetail>;
  @useResult
  $Res call({
    @JsonKey(name: 'invoice_value') double? invoiceValue,
    @JsonKey(name: 'invoice_date') String? invoiceDate,
  });
}

/// @nodoc
class _$PaidInvoiceDetailCopyWithImpl<$Res, $Val extends PaidInvoiceDetail>
    implements $PaidInvoiceDetailCopyWith<$Res> {
  _$PaidInvoiceDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaidInvoiceDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? invoiceValue = freezed, Object? invoiceDate = freezed}) {
    return _then(
      _value.copyWith(
            invoiceValue:
                freezed == invoiceValue
                    ? _value.invoiceValue
                    : invoiceValue // ignore: cast_nullable_to_non_nullable
                        as double?,
            invoiceDate:
                freezed == invoiceDate
                    ? _value.invoiceDate
                    : invoiceDate // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaidInvoiceDetailImplCopyWith<$Res>
    implements $PaidInvoiceDetailCopyWith<$Res> {
  factory _$$PaidInvoiceDetailImplCopyWith(
    _$PaidInvoiceDetailImpl value,
    $Res Function(_$PaidInvoiceDetailImpl) then,
  ) = __$$PaidInvoiceDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'invoice_value') double? invoiceValue,
    @JsonKey(name: 'invoice_date') String? invoiceDate,
  });
}

/// @nodoc
class __$$PaidInvoiceDetailImplCopyWithImpl<$Res>
    extends _$PaidInvoiceDetailCopyWithImpl<$Res, _$PaidInvoiceDetailImpl>
    implements _$$PaidInvoiceDetailImplCopyWith<$Res> {
  __$$PaidInvoiceDetailImplCopyWithImpl(
    _$PaidInvoiceDetailImpl _value,
    $Res Function(_$PaidInvoiceDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaidInvoiceDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? invoiceValue = freezed, Object? invoiceDate = freezed}) {
    return _then(
      _$PaidInvoiceDetailImpl(
        invoiceValue:
            freezed == invoiceValue
                ? _value.invoiceValue
                : invoiceValue // ignore: cast_nullable_to_non_nullable
                    as double?,
        invoiceDate:
            freezed == invoiceDate
                ? _value.invoiceDate
                : invoiceDate // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaidInvoiceDetailImpl implements _PaidInvoiceDetail {
  const _$PaidInvoiceDetailImpl({
    @JsonKey(name: 'invoice_value') this.invoiceValue,
    @JsonKey(name: 'invoice_date') this.invoiceDate,
  });

  factory _$PaidInvoiceDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaidInvoiceDetailImplFromJson(json);

  @override
  @JsonKey(name: 'invoice_value')
  final double? invoiceValue;
  @override
  @JsonKey(name: 'invoice_date')
  final String? invoiceDate;

  @override
  String toString() {
    return 'PaidInvoiceDetail(invoiceValue: $invoiceValue, invoiceDate: $invoiceDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaidInvoiceDetailImpl &&
            (identical(other.invoiceValue, invoiceValue) ||
                other.invoiceValue == invoiceValue) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, invoiceValue, invoiceDate);

  /// Create a copy of PaidInvoiceDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaidInvoiceDetailImplCopyWith<_$PaidInvoiceDetailImpl> get copyWith =>
      __$$PaidInvoiceDetailImplCopyWithImpl<_$PaidInvoiceDetailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaidInvoiceDetailImplToJson(this);
  }
}

abstract class _PaidInvoiceDetail implements PaidInvoiceDetail {
  const factory _PaidInvoiceDetail({
    @JsonKey(name: 'invoice_value') final double? invoiceValue,
    @JsonKey(name: 'invoice_date') final String? invoiceDate,
  }) = _$PaidInvoiceDetailImpl;

  factory _PaidInvoiceDetail.fromJson(Map<String, dynamic> json) =
      _$PaidInvoiceDetailImpl.fromJson;

  @override
  @JsonKey(name: 'invoice_value')
  double? get invoiceValue;
  @override
  @JsonKey(name: 'invoice_date')
  String? get invoiceDate;

  /// Create a copy of PaidInvoiceDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaidInvoiceDetailImplCopyWith<_$PaidInvoiceDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaidInvoiceSummary _$PaidInvoiceSummaryFromJson(Map<String, dynamic> json) {
  return _PaidInvoiceSummary.fromJson(json);
}

/// @nodoc
mixin _$PaidInvoiceSummary {
  @JsonKey(name: 'قيمة السداد الكلية')
  double? get totalPaidValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'القيم التفصيلية')
  List<PaidInvoiceDetail>? get paidDetails =>
      throw _privateConstructorUsedError;

  /// Serializes this PaidInvoiceSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaidInvoiceSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaidInvoiceSummaryCopyWith<PaidInvoiceSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaidInvoiceSummaryCopyWith<$Res> {
  factory $PaidInvoiceSummaryCopyWith(
    PaidInvoiceSummary value,
    $Res Function(PaidInvoiceSummary) then,
  ) = _$PaidInvoiceSummaryCopyWithImpl<$Res, PaidInvoiceSummary>;
  @useResult
  $Res call({
    @JsonKey(name: 'قيمة السداد الكلية') double? totalPaidValue,
    @JsonKey(name: 'القيم التفصيلية') List<PaidInvoiceDetail>? paidDetails,
  });
}

/// @nodoc
class _$PaidInvoiceSummaryCopyWithImpl<$Res, $Val extends PaidInvoiceSummary>
    implements $PaidInvoiceSummaryCopyWith<$Res> {
  _$PaidInvoiceSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaidInvoiceSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? totalPaidValue = freezed, Object? paidDetails = freezed}) {
    return _then(
      _value.copyWith(
            totalPaidValue:
                freezed == totalPaidValue
                    ? _value.totalPaidValue
                    : totalPaidValue // ignore: cast_nullable_to_non_nullable
                        as double?,
            paidDetails:
                freezed == paidDetails
                    ? _value.paidDetails
                    : paidDetails // ignore: cast_nullable_to_non_nullable
                        as List<PaidInvoiceDetail>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaidInvoiceSummaryImplCopyWith<$Res>
    implements $PaidInvoiceSummaryCopyWith<$Res> {
  factory _$$PaidInvoiceSummaryImplCopyWith(
    _$PaidInvoiceSummaryImpl value,
    $Res Function(_$PaidInvoiceSummaryImpl) then,
  ) = __$$PaidInvoiceSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'قيمة السداد الكلية') double? totalPaidValue,
    @JsonKey(name: 'القيم التفصيلية') List<PaidInvoiceDetail>? paidDetails,
  });
}

/// @nodoc
class __$$PaidInvoiceSummaryImplCopyWithImpl<$Res>
    extends _$PaidInvoiceSummaryCopyWithImpl<$Res, _$PaidInvoiceSummaryImpl>
    implements _$$PaidInvoiceSummaryImplCopyWith<$Res> {
  __$$PaidInvoiceSummaryImplCopyWithImpl(
    _$PaidInvoiceSummaryImpl _value,
    $Res Function(_$PaidInvoiceSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaidInvoiceSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? totalPaidValue = freezed, Object? paidDetails = freezed}) {
    return _then(
      _$PaidInvoiceSummaryImpl(
        totalPaidValue:
            freezed == totalPaidValue
                ? _value.totalPaidValue
                : totalPaidValue // ignore: cast_nullable_to_non_nullable
                    as double?,
        paidDetails:
            freezed == paidDetails
                ? _value._paidDetails
                : paidDetails // ignore: cast_nullable_to_non_nullable
                    as List<PaidInvoiceDetail>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaidInvoiceSummaryImpl implements _PaidInvoiceSummary {
  const _$PaidInvoiceSummaryImpl({
    @JsonKey(name: 'قيمة السداد الكلية') this.totalPaidValue,
    @JsonKey(name: 'القيم التفصيلية')
    final List<PaidInvoiceDetail>? paidDetails,
  }) : _paidDetails = paidDetails;

  factory _$PaidInvoiceSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaidInvoiceSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'قيمة السداد الكلية')
  final double? totalPaidValue;
  final List<PaidInvoiceDetail>? _paidDetails;
  @override
  @JsonKey(name: 'القيم التفصيلية')
  List<PaidInvoiceDetail>? get paidDetails {
    final value = _paidDetails;
    if (value == null) return null;
    if (_paidDetails is EqualUnmodifiableListView) return _paidDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PaidInvoiceSummary(totalPaidValue: $totalPaidValue, paidDetails: $paidDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaidInvoiceSummaryImpl &&
            (identical(other.totalPaidValue, totalPaidValue) ||
                other.totalPaidValue == totalPaidValue) &&
            const DeepCollectionEquality().equals(
              other._paidDetails,
              _paidDetails,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalPaidValue,
    const DeepCollectionEquality().hash(_paidDetails),
  );

  /// Create a copy of PaidInvoiceSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaidInvoiceSummaryImplCopyWith<_$PaidInvoiceSummaryImpl> get copyWith =>
      __$$PaidInvoiceSummaryImplCopyWithImpl<_$PaidInvoiceSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaidInvoiceSummaryImplToJson(this);
  }
}

abstract class _PaidInvoiceSummary implements PaidInvoiceSummary {
  const factory _PaidInvoiceSummary({
    @JsonKey(name: 'قيمة السداد الكلية') final double? totalPaidValue,
    @JsonKey(name: 'القيم التفصيلية')
    final List<PaidInvoiceDetail>? paidDetails,
  }) = _$PaidInvoiceSummaryImpl;

  factory _PaidInvoiceSummary.fromJson(Map<String, dynamic> json) =
      _$PaidInvoiceSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'قيمة السداد الكلية')
  double? get totalPaidValue;
  @override
  @JsonKey(name: 'القيم التفصيلية')
  List<PaidInvoiceDetail>? get paidDetails;

  /// Create a copy of PaidInvoiceSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaidInvoiceSummaryImplCopyWith<_$PaidInvoiceSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PercentageDetails _$PercentageDetailsFromJson(Map<String, dynamic> json) {
  return _PercentageDetails.fromJson(json);
}

/// @nodoc
mixin _$PercentageDetails {
  @JsonKey(name: 'النسبة المئوية')
  String? get percentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'قيمة النسبة المئوية')
  double? get percentageValue => throw _privateConstructorUsedError;

  /// Serializes this PercentageDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PercentageDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PercentageDetailsCopyWith<PercentageDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PercentageDetailsCopyWith<$Res> {
  factory $PercentageDetailsCopyWith(
    PercentageDetails value,
    $Res Function(PercentageDetails) then,
  ) = _$PercentageDetailsCopyWithImpl<$Res, PercentageDetails>;
  @useResult
  $Res call({
    @JsonKey(name: 'النسبة المئوية') String? percentage,
    @JsonKey(name: 'قيمة النسبة المئوية') double? percentageValue,
  });
}

/// @nodoc
class _$PercentageDetailsCopyWithImpl<$Res, $Val extends PercentageDetails>
    implements $PercentageDetailsCopyWith<$Res> {
  _$PercentageDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PercentageDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? percentage = freezed, Object? percentageValue = freezed}) {
    return _then(
      _value.copyWith(
            percentage:
                freezed == percentage
                    ? _value.percentage
                    : percentage // ignore: cast_nullable_to_non_nullable
                        as String?,
            percentageValue:
                freezed == percentageValue
                    ? _value.percentageValue
                    : percentageValue // ignore: cast_nullable_to_non_nullable
                        as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PercentageDetailsImplCopyWith<$Res>
    implements $PercentageDetailsCopyWith<$Res> {
  factory _$$PercentageDetailsImplCopyWith(
    _$PercentageDetailsImpl value,
    $Res Function(_$PercentageDetailsImpl) then,
  ) = __$$PercentageDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'النسبة المئوية') String? percentage,
    @JsonKey(name: 'قيمة النسبة المئوية') double? percentageValue,
  });
}

/// @nodoc
class __$$PercentageDetailsImplCopyWithImpl<$Res>
    extends _$PercentageDetailsCopyWithImpl<$Res, _$PercentageDetailsImpl>
    implements _$$PercentageDetailsImplCopyWith<$Res> {
  __$$PercentageDetailsImplCopyWithImpl(
    _$PercentageDetailsImpl _value,
    $Res Function(_$PercentageDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PercentageDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? percentage = freezed, Object? percentageValue = freezed}) {
    return _then(
      _$PercentageDetailsImpl(
        percentage:
            freezed == percentage
                ? _value.percentage
                : percentage // ignore: cast_nullable_to_non_nullable
                    as String?,
        percentageValue:
            freezed == percentageValue
                ? _value.percentageValue
                : percentageValue // ignore: cast_nullable_to_non_nullable
                    as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PercentageDetailsImpl implements _PercentageDetails {
  const _$PercentageDetailsImpl({
    @JsonKey(name: 'النسبة المئوية') this.percentage,
    @JsonKey(name: 'قيمة النسبة المئوية') this.percentageValue,
  });

  factory _$PercentageDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PercentageDetailsImplFromJson(json);

  @override
  @JsonKey(name: 'النسبة المئوية')
  final String? percentage;
  @override
  @JsonKey(name: 'قيمة النسبة المئوية')
  final double? percentageValue;

  @override
  String toString() {
    return 'PercentageDetails(percentage: $percentage, percentageValue: $percentageValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PercentageDetailsImpl &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.percentageValue, percentageValue) ||
                other.percentageValue == percentageValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, percentage, percentageValue);

  /// Create a copy of PercentageDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PercentageDetailsImplCopyWith<_$PercentageDetailsImpl> get copyWith =>
      __$$PercentageDetailsImplCopyWithImpl<_$PercentageDetailsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PercentageDetailsImplToJson(this);
  }
}

abstract class _PercentageDetails implements PercentageDetails {
  const factory _PercentageDetails({
    @JsonKey(name: 'النسبة المئوية') final String? percentage,
    @JsonKey(name: 'قيمة النسبة المئوية') final double? percentageValue,
  }) = _$PercentageDetailsImpl;

  factory _PercentageDetails.fromJson(Map<String, dynamic> json) =
      _$PercentageDetailsImpl.fromJson;

  @override
  @JsonKey(name: 'النسبة المئوية')
  String? get percentage;
  @override
  @JsonKey(name: 'قيمة النسبة المئوية')
  double? get percentageValue;

  /// Create a copy of PercentageDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PercentageDetailsImplCopyWith<_$PercentageDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReceivedAmountDetail _$ReceivedAmountDetailFromJson(Map<String, dynamic> json) {
  return _ReceivedAmountDetail.fromJson(json);
}

/// @nodoc
mixin _$ReceivedAmountDetail {
  @JsonKey(name: 'invoice_value')
  double? get invoiceValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_date')
  String? get invoiceDate => throw _privateConstructorUsedError;

  /// Serializes this ReceivedAmountDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceivedAmountDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceivedAmountDetailCopyWith<ReceivedAmountDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceivedAmountDetailCopyWith<$Res> {
  factory $ReceivedAmountDetailCopyWith(
    ReceivedAmountDetail value,
    $Res Function(ReceivedAmountDetail) then,
  ) = _$ReceivedAmountDetailCopyWithImpl<$Res, ReceivedAmountDetail>;
  @useResult
  $Res call({
    @JsonKey(name: 'invoice_value') double? invoiceValue,
    @JsonKey(name: 'invoice_date') String? invoiceDate,
  });
}

/// @nodoc
class _$ReceivedAmountDetailCopyWithImpl<
  $Res,
  $Val extends ReceivedAmountDetail
>
    implements $ReceivedAmountDetailCopyWith<$Res> {
  _$ReceivedAmountDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceivedAmountDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? invoiceValue = freezed, Object? invoiceDate = freezed}) {
    return _then(
      _value.copyWith(
            invoiceValue:
                freezed == invoiceValue
                    ? _value.invoiceValue
                    : invoiceValue // ignore: cast_nullable_to_non_nullable
                        as double?,
            invoiceDate:
                freezed == invoiceDate
                    ? _value.invoiceDate
                    : invoiceDate // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReceivedAmountDetailImplCopyWith<$Res>
    implements $ReceivedAmountDetailCopyWith<$Res> {
  factory _$$ReceivedAmountDetailImplCopyWith(
    _$ReceivedAmountDetailImpl value,
    $Res Function(_$ReceivedAmountDetailImpl) then,
  ) = __$$ReceivedAmountDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'invoice_value') double? invoiceValue,
    @JsonKey(name: 'invoice_date') String? invoiceDate,
  });
}

/// @nodoc
class __$$ReceivedAmountDetailImplCopyWithImpl<$Res>
    extends _$ReceivedAmountDetailCopyWithImpl<$Res, _$ReceivedAmountDetailImpl>
    implements _$$ReceivedAmountDetailImplCopyWith<$Res> {
  __$$ReceivedAmountDetailImplCopyWithImpl(
    _$ReceivedAmountDetailImpl _value,
    $Res Function(_$ReceivedAmountDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReceivedAmountDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? invoiceValue = freezed, Object? invoiceDate = freezed}) {
    return _then(
      _$ReceivedAmountDetailImpl(
        invoiceValue:
            freezed == invoiceValue
                ? _value.invoiceValue
                : invoiceValue // ignore: cast_nullable_to_non_nullable
                    as double?,
        invoiceDate:
            freezed == invoiceDate
                ? _value.invoiceDate
                : invoiceDate // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceivedAmountDetailImpl implements _ReceivedAmountDetail {
  const _$ReceivedAmountDetailImpl({
    @JsonKey(name: 'invoice_value') this.invoiceValue,
    @JsonKey(name: 'invoice_date') this.invoiceDate,
  });

  factory _$ReceivedAmountDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceivedAmountDetailImplFromJson(json);

  @override
  @JsonKey(name: 'invoice_value')
  final double? invoiceValue;
  @override
  @JsonKey(name: 'invoice_date')
  final String? invoiceDate;

  @override
  String toString() {
    return 'ReceivedAmountDetail(invoiceValue: $invoiceValue, invoiceDate: $invoiceDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceivedAmountDetailImpl &&
            (identical(other.invoiceValue, invoiceValue) ||
                other.invoiceValue == invoiceValue) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, invoiceValue, invoiceDate);

  /// Create a copy of ReceivedAmountDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceivedAmountDetailImplCopyWith<_$ReceivedAmountDetailImpl>
  get copyWith =>
      __$$ReceivedAmountDetailImplCopyWithImpl<_$ReceivedAmountDetailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceivedAmountDetailImplToJson(this);
  }
}

abstract class _ReceivedAmountDetail implements ReceivedAmountDetail {
  const factory _ReceivedAmountDetail({
    @JsonKey(name: 'invoice_value') final double? invoiceValue,
    @JsonKey(name: 'invoice_date') final String? invoiceDate,
  }) = _$ReceivedAmountDetailImpl;

  factory _ReceivedAmountDetail.fromJson(Map<String, dynamic> json) =
      _$ReceivedAmountDetailImpl.fromJson;

  @override
  @JsonKey(name: 'invoice_value')
  double? get invoiceValue;
  @override
  @JsonKey(name: 'invoice_date')
  String? get invoiceDate;

  /// Create a copy of ReceivedAmountDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceivedAmountDetailImplCopyWith<_$ReceivedAmountDetailImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ReceivedAmountSummary _$ReceivedAmountSummaryFromJson(
  Map<String, dynamic> json,
) {
  return _ReceivedAmountSummary.fromJson(json);
}

/// @nodoc
mixin _$ReceivedAmountSummary {
  @JsonKey(name: 'قيمة المقبوضات الكلية')
  double? get totalReceivedValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'القيم التفصيلية')
  List<ReceivedAmountDetail>? get receivedDetails =>
      throw _privateConstructorUsedError;

  /// Serializes this ReceivedAmountSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceivedAmountSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceivedAmountSummaryCopyWith<ReceivedAmountSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceivedAmountSummaryCopyWith<$Res> {
  factory $ReceivedAmountSummaryCopyWith(
    ReceivedAmountSummary value,
    $Res Function(ReceivedAmountSummary) then,
  ) = _$ReceivedAmountSummaryCopyWithImpl<$Res, ReceivedAmountSummary>;
  @useResult
  $Res call({
    @JsonKey(name: 'قيمة المقبوضات الكلية') double? totalReceivedValue,
    @JsonKey(name: 'القيم التفصيلية')
    List<ReceivedAmountDetail>? receivedDetails,
  });
}

/// @nodoc
class _$ReceivedAmountSummaryCopyWithImpl<
  $Res,
  $Val extends ReceivedAmountSummary
>
    implements $ReceivedAmountSummaryCopyWith<$Res> {
  _$ReceivedAmountSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceivedAmountSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReceivedValue = freezed,
    Object? receivedDetails = freezed,
  }) {
    return _then(
      _value.copyWith(
            totalReceivedValue:
                freezed == totalReceivedValue
                    ? _value.totalReceivedValue
                    : totalReceivedValue // ignore: cast_nullable_to_non_nullable
                        as double?,
            receivedDetails:
                freezed == receivedDetails
                    ? _value.receivedDetails
                    : receivedDetails // ignore: cast_nullable_to_non_nullable
                        as List<ReceivedAmountDetail>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReceivedAmountSummaryImplCopyWith<$Res>
    implements $ReceivedAmountSummaryCopyWith<$Res> {
  factory _$$ReceivedAmountSummaryImplCopyWith(
    _$ReceivedAmountSummaryImpl value,
    $Res Function(_$ReceivedAmountSummaryImpl) then,
  ) = __$$ReceivedAmountSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'قيمة المقبوضات الكلية') double? totalReceivedValue,
    @JsonKey(name: 'القيم التفصيلية')
    List<ReceivedAmountDetail>? receivedDetails,
  });
}

/// @nodoc
class __$$ReceivedAmountSummaryImplCopyWithImpl<$Res>
    extends
        _$ReceivedAmountSummaryCopyWithImpl<$Res, _$ReceivedAmountSummaryImpl>
    implements _$$ReceivedAmountSummaryImplCopyWith<$Res> {
  __$$ReceivedAmountSummaryImplCopyWithImpl(
    _$ReceivedAmountSummaryImpl _value,
    $Res Function(_$ReceivedAmountSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReceivedAmountSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReceivedValue = freezed,
    Object? receivedDetails = freezed,
  }) {
    return _then(
      _$ReceivedAmountSummaryImpl(
        totalReceivedValue:
            freezed == totalReceivedValue
                ? _value.totalReceivedValue
                : totalReceivedValue // ignore: cast_nullable_to_non_nullable
                    as double?,
        receivedDetails:
            freezed == receivedDetails
                ? _value._receivedDetails
                : receivedDetails // ignore: cast_nullable_to_non_nullable
                    as List<ReceivedAmountDetail>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceivedAmountSummaryImpl implements _ReceivedAmountSummary {
  const _$ReceivedAmountSummaryImpl({
    @JsonKey(name: 'قيمة المقبوضات الكلية') this.totalReceivedValue,
    @JsonKey(name: 'القيم التفصيلية')
    final List<ReceivedAmountDetail>? receivedDetails,
  }) : _receivedDetails = receivedDetails;

  factory _$ReceivedAmountSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceivedAmountSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'قيمة المقبوضات الكلية')
  final double? totalReceivedValue;
  final List<ReceivedAmountDetail>? _receivedDetails;
  @override
  @JsonKey(name: 'القيم التفصيلية')
  List<ReceivedAmountDetail>? get receivedDetails {
    final value = _receivedDetails;
    if (value == null) return null;
    if (_receivedDetails is EqualUnmodifiableListView) return _receivedDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReceivedAmountSummary(totalReceivedValue: $totalReceivedValue, receivedDetails: $receivedDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceivedAmountSummaryImpl &&
            (identical(other.totalReceivedValue, totalReceivedValue) ||
                other.totalReceivedValue == totalReceivedValue) &&
            const DeepCollectionEquality().equals(
              other._receivedDetails,
              _receivedDetails,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalReceivedValue,
    const DeepCollectionEquality().hash(_receivedDetails),
  );

  /// Create a copy of ReceivedAmountSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceivedAmountSummaryImplCopyWith<_$ReceivedAmountSummaryImpl>
  get copyWith =>
      __$$ReceivedAmountSummaryImplCopyWithImpl<_$ReceivedAmountSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceivedAmountSummaryImplToJson(this);
  }
}

abstract class _ReceivedAmountSummary implements ReceivedAmountSummary {
  const factory _ReceivedAmountSummary({
    @JsonKey(name: 'قيمة المقبوضات الكلية') final double? totalReceivedValue,
    @JsonKey(name: 'القيم التفصيلية')
    final List<ReceivedAmountDetail>? receivedDetails,
  }) = _$ReceivedAmountSummaryImpl;

  factory _ReceivedAmountSummary.fromJson(Map<String, dynamic> json) =
      _$ReceivedAmountSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'قيمة المقبوضات الكلية')
  double? get totalReceivedValue;
  @override
  @JsonKey(name: 'القيم التفصيلية')
  List<ReceivedAmountDetail>? get receivedDetails;

  /// Create a copy of ReceivedAmountSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceivedAmountSummaryImplCopyWith<_$ReceivedAmountSummaryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

OperationModel _$OperationModelFromJson(Map<String, dynamic> json) {
  return _OperationModel.fromJson(json);
}

/// @nodoc
mixin _$OperationModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'اسم الشريك')
  String? get partnerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'اسم العميل')
  String? get clientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'نوع العملية')
  String? get operationType => throw _privateConstructorUsedError;
  @JsonKey(name: 'رقم الفاتورة')
  String? get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'قيمة الفاتورة')
  double? get invoiceValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'سدد من الفاتورة')
  PaidInvoiceSummary? get paidInvoice => throw _privateConstructorUsedError;
  @JsonKey(name: 'باقي من الفاتورة')
  double? get remainingInvoice => throw _privateConstructorUsedError;
  @JsonKey(name: 'نسبتي من المبلغ')
  PercentageDetails? get percentageDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'المبلغ المستحق')
  double? get totalDue => throw _privateConstructorUsedError;
  @JsonKey(name: 'المبلغ المقبوض')
  ReceivedAmountSummary? get receivedAmount =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'المبلغ المتبقي')
  double? get remainingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'التاريخ')
  String? get operationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'تاريخ التنبيه')
  String? get reminderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'الملاحظات')
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this OperationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OperationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OperationModelCopyWith<OperationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperationModelCopyWith<$Res> {
  factory $OperationModelCopyWith(
    OperationModel value,
    $Res Function(OperationModel) then,
  ) = _$OperationModelCopyWithImpl<$Res, OperationModel>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'اسم الشريك') String? partnerName,
    @JsonKey(name: 'اسم العميل') String? clientName,
    @JsonKey(name: 'نوع العملية') String? operationType,
    @JsonKey(name: 'رقم الفاتورة') String? invoiceNumber,
    @JsonKey(name: 'قيمة الفاتورة') double? invoiceValue,
    @JsonKey(name: 'سدد من الفاتورة') PaidInvoiceSummary? paidInvoice,
    @JsonKey(name: 'باقي من الفاتورة') double? remainingInvoice,
    @JsonKey(name: 'نسبتي من المبلغ') PercentageDetails? percentageDetails,
    @JsonKey(name: 'المبلغ المستحق') double? totalDue,
    @JsonKey(name: 'المبلغ المقبوض') ReceivedAmountSummary? receivedAmount,
    @JsonKey(name: 'المبلغ المتبقي') double? remainingAmount,
    @JsonKey(name: 'التاريخ') String? operationDate,
    @JsonKey(name: 'تاريخ التنبيه') String? reminderDate,
    @JsonKey(name: 'الملاحظات') String? notes,
  });

  $PaidInvoiceSummaryCopyWith<$Res>? get paidInvoice;
  $PercentageDetailsCopyWith<$Res>? get percentageDetails;
  $ReceivedAmountSummaryCopyWith<$Res>? get receivedAmount;
}

/// @nodoc
class _$OperationModelCopyWithImpl<$Res, $Val extends OperationModel>
    implements $OperationModelCopyWith<$Res> {
  _$OperationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OperationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? partnerName = freezed,
    Object? clientName = freezed,
    Object? operationType = freezed,
    Object? invoiceNumber = freezed,
    Object? invoiceValue = freezed,
    Object? paidInvoice = freezed,
    Object? remainingInvoice = freezed,
    Object? percentageDetails = freezed,
    Object? totalDue = freezed,
    Object? receivedAmount = freezed,
    Object? remainingAmount = freezed,
    Object? operationDate = freezed,
    Object? reminderDate = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            partnerName:
                freezed == partnerName
                    ? _value.partnerName
                    : partnerName // ignore: cast_nullable_to_non_nullable
                        as String?,
            clientName:
                freezed == clientName
                    ? _value.clientName
                    : clientName // ignore: cast_nullable_to_non_nullable
                        as String?,
            operationType:
                freezed == operationType
                    ? _value.operationType
                    : operationType // ignore: cast_nullable_to_non_nullable
                        as String?,
            invoiceNumber:
                freezed == invoiceNumber
                    ? _value.invoiceNumber
                    : invoiceNumber // ignore: cast_nullable_to_non_nullable
                        as String?,
            invoiceValue:
                freezed == invoiceValue
                    ? _value.invoiceValue
                    : invoiceValue // ignore: cast_nullable_to_non_nullable
                        as double?,
            paidInvoice:
                freezed == paidInvoice
                    ? _value.paidInvoice
                    : paidInvoice // ignore: cast_nullable_to_non_nullable
                        as PaidInvoiceSummary?,
            remainingInvoice:
                freezed == remainingInvoice
                    ? _value.remainingInvoice
                    : remainingInvoice // ignore: cast_nullable_to_non_nullable
                        as double?,
            percentageDetails:
                freezed == percentageDetails
                    ? _value.percentageDetails
                    : percentageDetails // ignore: cast_nullable_to_non_nullable
                        as PercentageDetails?,
            totalDue:
                freezed == totalDue
                    ? _value.totalDue
                    : totalDue // ignore: cast_nullable_to_non_nullable
                        as double?,
            receivedAmount:
                freezed == receivedAmount
                    ? _value.receivedAmount
                    : receivedAmount // ignore: cast_nullable_to_non_nullable
                        as ReceivedAmountSummary?,
            remainingAmount:
                freezed == remainingAmount
                    ? _value.remainingAmount
                    : remainingAmount // ignore: cast_nullable_to_non_nullable
                        as double?,
            operationDate:
                freezed == operationDate
                    ? _value.operationDate
                    : operationDate // ignore: cast_nullable_to_non_nullable
                        as String?,
            reminderDate:
                freezed == reminderDate
                    ? _value.reminderDate
                    : reminderDate // ignore: cast_nullable_to_non_nullable
                        as String?,
            notes:
                freezed == notes
                    ? _value.notes
                    : notes // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of OperationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaidInvoiceSummaryCopyWith<$Res>? get paidInvoice {
    if (_value.paidInvoice == null) {
      return null;
    }

    return $PaidInvoiceSummaryCopyWith<$Res>(_value.paidInvoice!, (value) {
      return _then(_value.copyWith(paidInvoice: value) as $Val);
    });
  }

  /// Create a copy of OperationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PercentageDetailsCopyWith<$Res>? get percentageDetails {
    if (_value.percentageDetails == null) {
      return null;
    }

    return $PercentageDetailsCopyWith<$Res>(_value.percentageDetails!, (value) {
      return _then(_value.copyWith(percentageDetails: value) as $Val);
    });
  }

  /// Create a copy of OperationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReceivedAmountSummaryCopyWith<$Res>? get receivedAmount {
    if (_value.receivedAmount == null) {
      return null;
    }

    return $ReceivedAmountSummaryCopyWith<$Res>(_value.receivedAmount!, (
      value,
    ) {
      return _then(_value.copyWith(receivedAmount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OperationModelImplCopyWith<$Res>
    implements $OperationModelCopyWith<$Res> {
  factory _$$OperationModelImplCopyWith(
    _$OperationModelImpl value,
    $Res Function(_$OperationModelImpl) then,
  ) = __$$OperationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'اسم الشريك') String? partnerName,
    @JsonKey(name: 'اسم العميل') String? clientName,
    @JsonKey(name: 'نوع العملية') String? operationType,
    @JsonKey(name: 'رقم الفاتورة') String? invoiceNumber,
    @JsonKey(name: 'قيمة الفاتورة') double? invoiceValue,
    @JsonKey(name: 'سدد من الفاتورة') PaidInvoiceSummary? paidInvoice,
    @JsonKey(name: 'باقي من الفاتورة') double? remainingInvoice,
    @JsonKey(name: 'نسبتي من المبلغ') PercentageDetails? percentageDetails,
    @JsonKey(name: 'المبلغ المستحق') double? totalDue,
    @JsonKey(name: 'المبلغ المقبوض') ReceivedAmountSummary? receivedAmount,
    @JsonKey(name: 'المبلغ المتبقي') double? remainingAmount,
    @JsonKey(name: 'التاريخ') String? operationDate,
    @JsonKey(name: 'تاريخ التنبيه') String? reminderDate,
    @JsonKey(name: 'الملاحظات') String? notes,
  });

  @override
  $PaidInvoiceSummaryCopyWith<$Res>? get paidInvoice;
  @override
  $PercentageDetailsCopyWith<$Res>? get percentageDetails;
  @override
  $ReceivedAmountSummaryCopyWith<$Res>? get receivedAmount;
}

/// @nodoc
class __$$OperationModelImplCopyWithImpl<$Res>
    extends _$OperationModelCopyWithImpl<$Res, _$OperationModelImpl>
    implements _$$OperationModelImplCopyWith<$Res> {
  __$$OperationModelImplCopyWithImpl(
    _$OperationModelImpl _value,
    $Res Function(_$OperationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OperationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? partnerName = freezed,
    Object? clientName = freezed,
    Object? operationType = freezed,
    Object? invoiceNumber = freezed,
    Object? invoiceValue = freezed,
    Object? paidInvoice = freezed,
    Object? remainingInvoice = freezed,
    Object? percentageDetails = freezed,
    Object? totalDue = freezed,
    Object? receivedAmount = freezed,
    Object? remainingAmount = freezed,
    Object? operationDate = freezed,
    Object? reminderDate = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$OperationModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        partnerName:
            freezed == partnerName
                ? _value.partnerName
                : partnerName // ignore: cast_nullable_to_non_nullable
                    as String?,
        clientName:
            freezed == clientName
                ? _value.clientName
                : clientName // ignore: cast_nullable_to_non_nullable
                    as String?,
        operationType:
            freezed == operationType
                ? _value.operationType
                : operationType // ignore: cast_nullable_to_non_nullable
                    as String?,
        invoiceNumber:
            freezed == invoiceNumber
                ? _value.invoiceNumber
                : invoiceNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
        invoiceValue:
            freezed == invoiceValue
                ? _value.invoiceValue
                : invoiceValue // ignore: cast_nullable_to_non_nullable
                    as double?,
        paidInvoice:
            freezed == paidInvoice
                ? _value.paidInvoice
                : paidInvoice // ignore: cast_nullable_to_non_nullable
                    as PaidInvoiceSummary?,
        remainingInvoice:
            freezed == remainingInvoice
                ? _value.remainingInvoice
                : remainingInvoice // ignore: cast_nullable_to_non_nullable
                    as double?,
        percentageDetails:
            freezed == percentageDetails
                ? _value.percentageDetails
                : percentageDetails // ignore: cast_nullable_to_non_nullable
                    as PercentageDetails?,
        totalDue:
            freezed == totalDue
                ? _value.totalDue
                : totalDue // ignore: cast_nullable_to_non_nullable
                    as double?,
        receivedAmount:
            freezed == receivedAmount
                ? _value.receivedAmount
                : receivedAmount // ignore: cast_nullable_to_non_nullable
                    as ReceivedAmountSummary?,
        remainingAmount:
            freezed == remainingAmount
                ? _value.remainingAmount
                : remainingAmount // ignore: cast_nullable_to_non_nullable
                    as double?,
        operationDate:
            freezed == operationDate
                ? _value.operationDate
                : operationDate // ignore: cast_nullable_to_non_nullable
                    as String?,
        reminderDate:
            freezed == reminderDate
                ? _value.reminderDate
                : reminderDate // ignore: cast_nullable_to_non_nullable
                    as String?,
        notes:
            freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OperationModelImpl implements _OperationModel {
  const _$OperationModelImpl({
    this.id,
    @JsonKey(name: 'اسم الشريك') this.partnerName,
    @JsonKey(name: 'اسم العميل') this.clientName,
    @JsonKey(name: 'نوع العملية') this.operationType,
    @JsonKey(name: 'رقم الفاتورة') this.invoiceNumber,
    @JsonKey(name: 'قيمة الفاتورة') this.invoiceValue,
    @JsonKey(name: 'سدد من الفاتورة') this.paidInvoice,
    @JsonKey(name: 'باقي من الفاتورة') this.remainingInvoice,
    @JsonKey(name: 'نسبتي من المبلغ') this.percentageDetails,
    @JsonKey(name: 'المبلغ المستحق') this.totalDue,
    @JsonKey(name: 'المبلغ المقبوض') this.receivedAmount,
    @JsonKey(name: 'المبلغ المتبقي') this.remainingAmount,
    @JsonKey(name: 'التاريخ') this.operationDate,
    @JsonKey(name: 'تاريخ التنبيه') this.reminderDate,
    @JsonKey(name: 'الملاحظات') this.notes,
  });

  factory _$OperationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperationModelImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'اسم الشريك')
  final String? partnerName;
  @override
  @JsonKey(name: 'اسم العميل')
  final String? clientName;
  @override
  @JsonKey(name: 'نوع العملية')
  final String? operationType;
  @override
  @JsonKey(name: 'رقم الفاتورة')
  final String? invoiceNumber;
  @override
  @JsonKey(name: 'قيمة الفاتورة')
  final double? invoiceValue;
  @override
  @JsonKey(name: 'سدد من الفاتورة')
  final PaidInvoiceSummary? paidInvoice;
  @override
  @JsonKey(name: 'باقي من الفاتورة')
  final double? remainingInvoice;
  @override
  @JsonKey(name: 'نسبتي من المبلغ')
  final PercentageDetails? percentageDetails;
  @override
  @JsonKey(name: 'المبلغ المستحق')
  final double? totalDue;
  @override
  @JsonKey(name: 'المبلغ المقبوض')
  final ReceivedAmountSummary? receivedAmount;
  @override
  @JsonKey(name: 'المبلغ المتبقي')
  final double? remainingAmount;
  @override
  @JsonKey(name: 'التاريخ')
  final String? operationDate;
  @override
  @JsonKey(name: 'تاريخ التنبيه')
  final String? reminderDate;
  @override
  @JsonKey(name: 'الملاحظات')
  final String? notes;

  @override
  String toString() {
    return 'OperationModel(id: $id, partnerName: $partnerName, clientName: $clientName, operationType: $operationType, invoiceNumber: $invoiceNumber, invoiceValue: $invoiceValue, paidInvoice: $paidInvoice, remainingInvoice: $remainingInvoice, percentageDetails: $percentageDetails, totalDue: $totalDue, receivedAmount: $receivedAmount, remainingAmount: $remainingAmount, operationDate: $operationDate, reminderDate: $reminderDate, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.partnerName, partnerName) ||
                other.partnerName == partnerName) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.invoiceValue, invoiceValue) ||
                other.invoiceValue == invoiceValue) &&
            (identical(other.paidInvoice, paidInvoice) ||
                other.paidInvoice == paidInvoice) &&
            (identical(other.remainingInvoice, remainingInvoice) ||
                other.remainingInvoice == remainingInvoice) &&
            (identical(other.percentageDetails, percentageDetails) ||
                other.percentageDetails == percentageDetails) &&
            (identical(other.totalDue, totalDue) ||
                other.totalDue == totalDue) &&
            (identical(other.receivedAmount, receivedAmount) ||
                other.receivedAmount == receivedAmount) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.operationDate, operationDate) ||
                other.operationDate == operationDate) &&
            (identical(other.reminderDate, reminderDate) ||
                other.reminderDate == reminderDate) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    partnerName,
    clientName,
    operationType,
    invoiceNumber,
    invoiceValue,
    paidInvoice,
    remainingInvoice,
    percentageDetails,
    totalDue,
    receivedAmount,
    remainingAmount,
    operationDate,
    reminderDate,
    notes,
  );

  /// Create a copy of OperationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationModelImplCopyWith<_$OperationModelImpl> get copyWith =>
      __$$OperationModelImplCopyWithImpl<_$OperationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OperationModelImplToJson(this);
  }
}

abstract class _OperationModel implements OperationModel {
  const factory _OperationModel({
    final int? id,
    @JsonKey(name: 'اسم الشريك') final String? partnerName,
    @JsonKey(name: 'اسم العميل') final String? clientName,
    @JsonKey(name: 'نوع العملية') final String? operationType,
    @JsonKey(name: 'رقم الفاتورة') final String? invoiceNumber,
    @JsonKey(name: 'قيمة الفاتورة') final double? invoiceValue,
    @JsonKey(name: 'سدد من الفاتورة') final PaidInvoiceSummary? paidInvoice,
    @JsonKey(name: 'باقي من الفاتورة') final double? remainingInvoice,
    @JsonKey(name: 'نسبتي من المبلغ')
    final PercentageDetails? percentageDetails,
    @JsonKey(name: 'المبلغ المستحق') final double? totalDue,
    @JsonKey(name: 'المبلغ المقبوض')
    final ReceivedAmountSummary? receivedAmount,
    @JsonKey(name: 'المبلغ المتبقي') final double? remainingAmount,
    @JsonKey(name: 'التاريخ') final String? operationDate,
    @JsonKey(name: 'تاريخ التنبيه') final String? reminderDate,
    @JsonKey(name: 'الملاحظات') final String? notes,
  }) = _$OperationModelImpl;

  factory _OperationModel.fromJson(Map<String, dynamic> json) =
      _$OperationModelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'اسم الشريك')
  String? get partnerName;
  @override
  @JsonKey(name: 'اسم العميل')
  String? get clientName;
  @override
  @JsonKey(name: 'نوع العملية')
  String? get operationType;
  @override
  @JsonKey(name: 'رقم الفاتورة')
  String? get invoiceNumber;
  @override
  @JsonKey(name: 'قيمة الفاتورة')
  double? get invoiceValue;
  @override
  @JsonKey(name: 'سدد من الفاتورة')
  PaidInvoiceSummary? get paidInvoice;
  @override
  @JsonKey(name: 'باقي من الفاتورة')
  double? get remainingInvoice;
  @override
  @JsonKey(name: 'نسبتي من المبلغ')
  PercentageDetails? get percentageDetails;
  @override
  @JsonKey(name: 'المبلغ المستحق')
  double? get totalDue;
  @override
  @JsonKey(name: 'المبلغ المقبوض')
  ReceivedAmountSummary? get receivedAmount;
  @override
  @JsonKey(name: 'المبلغ المتبقي')
  double? get remainingAmount;
  @override
  @JsonKey(name: 'التاريخ')
  String? get operationDate;
  @override
  @JsonKey(name: 'تاريخ التنبيه')
  String? get reminderDate;
  @override
  @JsonKey(name: 'الملاحظات')
  String? get notes;

  /// Create a copy of OperationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperationModelImplCopyWith<_$OperationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DropDownModel _$DropDownModelFromJson(Map<String, dynamic> json) {
  return _DropDownModel.fromJson(json);
}

/// @nodoc
mixin _$DropDownModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this DropDownModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DropDownModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DropDownModelCopyWith<DropDownModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DropDownModelCopyWith<$Res> {
  factory $DropDownModelCopyWith(
    DropDownModel value,
    $Res Function(DropDownModel) then,
  ) = _$DropDownModelCopyWithImpl<$Res, DropDownModel>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$DropDownModelCopyWithImpl<$Res, $Val extends DropDownModel>
    implements $DropDownModelCopyWith<$Res> {
  _$DropDownModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DropDownModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DropDownModelImplCopyWith<$Res>
    implements $DropDownModelCopyWith<$Res> {
  factory _$$DropDownModelImplCopyWith(
    _$DropDownModelImpl value,
    $Res Function(_$DropDownModelImpl) then,
  ) = __$$DropDownModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$DropDownModelImplCopyWithImpl<$Res>
    extends _$DropDownModelCopyWithImpl<$Res, _$DropDownModelImpl>
    implements _$$DropDownModelImplCopyWith<$Res> {
  __$$DropDownModelImplCopyWithImpl(
    _$DropDownModelImpl _value,
    $Res Function(_$DropDownModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DropDownModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _$DropDownModelImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DropDownModelImpl implements _DropDownModel {
  const _$DropDownModelImpl({this.id, this.name});

  factory _$DropDownModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DropDownModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'DropDownModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DropDownModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of DropDownModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DropDownModelImplCopyWith<_$DropDownModelImpl> get copyWith =>
      __$$DropDownModelImplCopyWithImpl<_$DropDownModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DropDownModelImplToJson(this);
  }
}

abstract class _DropDownModel implements DropDownModel {
  const factory _DropDownModel({final int? id, final String? name}) =
      _$DropDownModelImpl;

  factory _DropDownModel.fromJson(Map<String, dynamic> json) =
      _$DropDownModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of DropDownModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DropDownModelImplCopyWith<_$DropDownModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DinamicFiledsModel _$DinamicFiledsModelFromJson(Map<String, dynamic> json) {
  return _DinamicFiledsModel.fromJson(json);
}

/// @nodoc
mixin _$DinamicFiledsModel {
  int? get id => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  /// Serializes this DinamicFiledsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DinamicFiledsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DinamicFiledsModelCopyWith<DinamicFiledsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DinamicFiledsModelCopyWith<$Res> {
  factory $DinamicFiledsModelCopyWith(
    DinamicFiledsModel value,
    $Res Function(DinamicFiledsModel) then,
  ) = _$DinamicFiledsModelCopyWithImpl<$Res, DinamicFiledsModel>;
  @useResult
  $Res call({int? id, String? value, String? data});
}

/// @nodoc
class _$DinamicFiledsModelCopyWithImpl<$Res, $Val extends DinamicFiledsModel>
    implements $DinamicFiledsModelCopyWith<$Res> {
  _$DinamicFiledsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DinamicFiledsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            value:
                freezed == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as String?,
            data:
                freezed == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DinamicFiledsModelImplCopyWith<$Res>
    implements $DinamicFiledsModelCopyWith<$Res> {
  factory _$$DinamicFiledsModelImplCopyWith(
    _$DinamicFiledsModelImpl value,
    $Res Function(_$DinamicFiledsModelImpl) then,
  ) = __$$DinamicFiledsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? value, String? data});
}

/// @nodoc
class __$$DinamicFiledsModelImplCopyWithImpl<$Res>
    extends _$DinamicFiledsModelCopyWithImpl<$Res, _$DinamicFiledsModelImpl>
    implements _$$DinamicFiledsModelImplCopyWith<$Res> {
  __$$DinamicFiledsModelImplCopyWithImpl(
    _$DinamicFiledsModelImpl _value,
    $Res Function(_$DinamicFiledsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DinamicFiledsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? data = freezed,
  }) {
    return _then(
      _$DinamicFiledsModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        value:
            freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as String?,
        data:
            freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DinamicFiledsModelImpl implements _DinamicFiledsModel {
  const _$DinamicFiledsModelImpl({this.id, this.value, this.data});

  factory _$DinamicFiledsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DinamicFiledsModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? value;
  @override
  final String? data;

  @override
  String toString() {
    return 'DinamicFiledsModel(id: $id, value: $value, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DinamicFiledsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, value, data);

  /// Create a copy of DinamicFiledsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DinamicFiledsModelImplCopyWith<_$DinamicFiledsModelImpl> get copyWith =>
      __$$DinamicFiledsModelImplCopyWithImpl<_$DinamicFiledsModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DinamicFiledsModelImplToJson(this);
  }
}

abstract class _DinamicFiledsModel implements DinamicFiledsModel {
  const factory _DinamicFiledsModel({
    final int? id,
    final String? value,
    final String? data,
  }) = _$DinamicFiledsModelImpl;

  factory _DinamicFiledsModel.fromJson(Map<String, dynamic> json) =
      _$DinamicFiledsModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get value;
  @override
  String? get data;

  /// Create a copy of DinamicFiledsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DinamicFiledsModelImplCopyWith<_$DinamicFiledsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
