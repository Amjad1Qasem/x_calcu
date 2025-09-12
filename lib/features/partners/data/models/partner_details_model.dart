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
     double? totalInvoiceValues,
     double? totalInvoicePayments,
     double? remainingInvoices,
     double? dueAmount,
     double? receivedAmount,
     double? remainingAmount,
     double? profits,
  }) = _PartnerDetailsStatistic;

  factory PartnerDetailsStatistic.fromJson(Map<String, dynamic> json) =>
      _$PartnerDetailsStatisticFromJson(json);
}

@freezed
class PartnerDetailsOperation with _$PartnerDetailsOperation {
  const factory PartnerDetailsOperation({
     int? id,
     String? partnerName,
     String? clientName,
     String? operationType,
     String? invoiceNumber,
     double? invoiceValue,
     PartnerDetailsPayment? invoicePayment,
     double? remainingFromInvoice,
     PartnerDetailsPercentage? myPercentage,
     double? dueAmount,
     PartnerDetailsPayment? receivedAmount,
     double? remainingAmount,
     String? date,
     String? notificationDate,
    String? notes,
  }) = _PartnerDetailsOperation;

  factory PartnerDetailsOperation.fromJson(Map<String, dynamic> json) =>
      _$PartnerDetailsOperationFromJson(json);
}

@freezed
class PartnerDetailsPayment with _$PartnerDetailsPayment {
  const factory PartnerDetailsPayment({
     double? totalValue,
     List<PartnerDetailsPaymentDetail>? details,
  }) = _PartnerDetailsPayment;

  factory PartnerDetailsPayment.fromJson(Map<String, dynamic> json) =>
      _$PartnerDetailsPaymentFromJson(json);
}

@freezed
class PartnerDetailsPaymentDetail with _$PartnerDetailsPaymentDetail {
  const factory PartnerDetailsPaymentDetail({
     double? invoiceValue,
     String? invoiceDate,
  }) = _PartnerDetailsPaymentDetail;

  factory PartnerDetailsPaymentDetail.fromJson(Map<String, dynamic> json) =>
      _$PartnerDetailsPaymentDetailFromJson(json);
}

@freezed
class PartnerDetailsPercentage with _$PartnerDetailsPercentage {
  const factory PartnerDetailsPercentage({
     String? percentage,
     double? percentageValue,
  }) = _PartnerDetailsPercentage;

  factory PartnerDetailsPercentage.fromJson(Map<String, dynamic> json) =>
      _$PartnerDetailsPercentageFromJson(json);
}
