import 'package:freezed_annotation/freezed_annotation.dart';
part 'operations_model.freezed.dart';
part 'operations_model.g.dart';

// Model for paid invoice details
@freezed
class PaidInvoiceDetail with _$PaidInvoiceDetail {
  const factory PaidInvoiceDetail({
    @JsonKey(name: 'invoice_value') double? invoiceValue,
    @JsonKey(name: 'invoice_date') String? invoiceDate,
  }) = _PaidInvoiceDetail;

  factory PaidInvoiceDetail.fromJson(Map<String, dynamic> json) =>
      _$PaidInvoiceDetailFromJson(json);
}

// Model for paid invoice summary
@freezed
class PaidInvoiceSummary with _$PaidInvoiceSummary {
  const factory PaidInvoiceSummary({
    @JsonKey(name: 'قيمة السداد الكلية') double? totalPaidValue,
    @JsonKey(name: 'القيم التفصيلية') List<PaidInvoiceDetail>? paidDetails,
  }) = _PaidInvoiceSummary;

  factory PaidInvoiceSummary.fromJson(Map<String, dynamic> json) =>
      _$PaidInvoiceSummaryFromJson(json);
}

// Model for percentage details
@freezed
class PercentageDetails with _$PercentageDetails {
  const factory PercentageDetails({
    @JsonKey(name: 'النسبة المئوية') String? percentage,
    @JsonKey(name: 'قيمة النسبة المئوية') double? percentageValue,
  }) = _PercentageDetails;

  factory PercentageDetails.fromJson(Map<String, dynamic> json) =>
      _$PercentageDetailsFromJson(json);
}

// Model for received amount details
@freezed
class ReceivedAmountDetail with _$ReceivedAmountDetail {
  const factory ReceivedAmountDetail({
    @JsonKey(name: 'invoice_value') double? invoiceValue,
    @JsonKey(name: 'invoice_date') String? invoiceDate,
  }) = _ReceivedAmountDetail;

  factory ReceivedAmountDetail.fromJson(Map<String, dynamic> json) =>
      _$ReceivedAmountDetailFromJson(json);
}

// Model for received amount summary
@freezed
class ReceivedAmountSummary with _$ReceivedAmountSummary {
  const factory ReceivedAmountSummary({
    @JsonKey(name: 'قيمة المقبوضات الكلية') double? totalReceivedValue,
    @JsonKey(name: 'القيم التفصيلية')
    List<ReceivedAmountDetail>? receivedDetails,
  }) = _ReceivedAmountSummary;

  factory ReceivedAmountSummary.fromJson(Map<String, dynamic> json) =>
      _$ReceivedAmountSummaryFromJson(json);
}

@freezed
class OperationModel with _$OperationModel {
  const factory OperationModel({
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
  }) = _OperationModel;

  factory OperationModel.fromJson(Map<String, dynamic> json) =>
      _$OperationModelFromJson(json);
}

@freezed
class DropDownModel with _$DropDownModel {
  const factory DropDownModel({int? id, String? name}) = _DropDownModel;

  factory DropDownModel.fromJson(Map<String, dynamic> json) =>
      _$DropDownModelFromJson(
        json["data"] is Map<String, dynamic> ? json["data"] : json,
      );
}

@freezed
class DinamicFiledsModel with _$DinamicFiledsModel {
  const factory DinamicFiledsModel({int? id, String? value, String? data}) =
      _DinamicFiledsModel;

  factory DinamicFiledsModel.fromJson(Map<String, dynamic> json) =>
      _$DinamicFiledsModelFromJson(
        json["data"] is Map<String, dynamic> ? json["data"] : json,
      );
}
