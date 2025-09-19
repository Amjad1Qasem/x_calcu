import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_details_model.freezed.dart';
part 'partner_details_model.g.dart';

@freezed
class PartnerDetailsData with _$PartnerDetailsData {
  const factory PartnerDetailsData({
    PartnerDetailsPartner? partner,
    PartnerDetailsStatistic? statistic,
  }) = _PartnerDetailsData;

  factory PartnerDetailsData.fromJson(Map<String, dynamic> json) =>
      _$PartnerDetailsDataFromJson(json);
}

@freezed
class PartnerDetailsPartner with _$PartnerDetailsPartner {
  const factory PartnerDetailsPartner({
    int? id,
    String? name,
    String? email,
    String? phone,
    double? totalPercentageValue,
    String? createdAt,
    String? updatedAt,
  }) = _PartnerDetailsPartner;

  factory PartnerDetailsPartner.fromJson(Map<String, dynamic> json) =>
      _$PartnerDetailsPartnerFromJson(json);
}

@freezed
class PartnerDetailsStatistic with _$PartnerDetailsStatistic {
  const factory PartnerDetailsStatistic({
    @JsonKey(name: 'مجاميع قيم الفواتير') double? totalInvoiceValues,
    @JsonKey(name: 'مجاميع سداد الفواتير') double? totalInvoicePayments,
    @JsonKey(name: 'باقي الفواتير') double? remainingInvoices,
    @JsonKey(name: 'المبلغ المستحقة') double? dueAmount,
    @JsonKey(name: 'المبلغ المقبوضة') double? receivedAmount,
    @JsonKey(name: 'المبلغ المتبقية') double? remainingAmount,
    @JsonKey(name: 'الارباح') double? profits,
  }) = _PartnerDetailsStatistic;

  factory PartnerDetailsStatistic.fromJson(Map<String, dynamic> json) =>
      _$PartnerDetailsStatisticFromJson(json);
}

@freezed
class PartnerDetailsOperation with _$PartnerDetailsOperation {
  const factory PartnerDetailsOperation({
    int? id,
    @JsonKey(name: 'اسم الشريك') String? partnerName,
    @JsonKey(name: 'اسم العميل') String? clientName,
    @JsonKey(name: 'نوع العملية') String? operationType,
    @JsonKey(name: 'رقم الفاتورة') String? invoiceNumber,
    @JsonKey(name: 'قيمة الفاتورة') double? invoiceValue,
    @JsonKey(name: 'سدد من الفاتورة') PartnerDetailsPayment? invoicePayment,
    @JsonKey(name: 'باقي من الفاتورة') double? remainingFromInvoice,
    @JsonKey(name: 'نسبتي من المبلغ') PartnerDetailsPercentage? myPercentage,
    @JsonKey(name: 'المبلغ المستحق') double? dueAmount,
    @JsonKey(name: 'المبلغ المقبوض') PartnerDetailsPayment? receivedAmount,
    @JsonKey(name: 'المبلغ المتبقي') double? remainingAmount,
    @JsonKey(name: 'التاريخ') String? date,
    @JsonKey(name: 'تاريخ التنبيه') String? notificationDate,
    @JsonKey(name: 'الملاحظات') String? notes,
  }) = _PartnerDetailsOperation;

  factory PartnerDetailsOperation.fromJson(Map<String, dynamic> json) =>
      _$PartnerDetailsOperationFromJson(json);
}

@freezed
class PartnerDetailsPayment with _$PartnerDetailsPayment {
  const factory PartnerDetailsPayment({
    @JsonKey(name: 'قيمة السداد الكلية') double? totalValue,
    @JsonKey(name: 'القيم التفصيلية')
    List<PartnerDetailsPaymentDetail>? details,
  }) = _PartnerDetailsPayment;

  factory PartnerDetailsPayment.fromJson(Map<String, dynamic> json) =>
      _$PartnerDetailsPaymentFromJson(json);
}

@freezed
class PartnerDetailsPaymentDetail with _$PartnerDetailsPaymentDetail {
  const factory PartnerDetailsPaymentDetail({
    @JsonKey(name: 'invoice_value') double? invoiceValue,
    @JsonKey(name: 'invoice_date') String? invoiceDate,
  }) = _PartnerDetailsPaymentDetail;

  factory PartnerDetailsPaymentDetail.fromJson(Map<String, dynamic> json) =>
      _$PartnerDetailsPaymentDetailFromJson(json);
}

@freezed
class PartnerDetailsPercentage with _$PartnerDetailsPercentage {
  const factory PartnerDetailsPercentage({
    @JsonKey(name: 'النسبة المئوية') String? percentage,
    @JsonKey(name: 'قيمة النسبة المئوية') double? percentageValue,
  }) = _PartnerDetailsPercentage;

  factory PartnerDetailsPercentage.fromJson(Map<String, dynamic> json) =>
      _$PartnerDetailsPercentageFromJson(json);
}
