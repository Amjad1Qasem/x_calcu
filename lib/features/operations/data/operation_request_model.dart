import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_request_model.freezed.dart';
part 'operation_request_model.g.dart';

// Model for API request body (create/update operations)
@freezed
class OperationRequestModel with _$OperationRequestModel {
  const factory OperationRequestModel({
    @JsonKey(name: 'partner_id') int? partnerId,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'operationType') String? operationType,
    @JsonKey(name: 'invoice_number') String? invoiceNumber,
    @JsonKey(name: 'invoice_value') double? invoiceValue,
    @JsonKey(name: 'percentage_of_bill') String? percentageOfBill,
    @JsonKey(name: 'invoice_date') String? invoiceDate,
    @JsonKey(name: 'alert_date') String? alertDate,
    @JsonKey(name: 'comments') String? comments,
    @JsonKey(name: 'paid_bills') List<PaidBillRequest>? paidBills,
    @JsonKey(name: 'received_amounts')
    List<ReceivedAmountRequest>? receivedAmounts,
  }) = _OperationRequestModel;

  factory OperationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$OperationRequestModelFromJson(json);
}

// Model for paid bill in request
@freezed
class PaidBillRequest with _$PaidBillRequest {
  const factory PaidBillRequest({
    @JsonKey(name: 'invoice_value') String? invoiceValue,
    @JsonKey(name: 'invoice_date') String? invoiceDate,
  }) = _PaidBillRequest;

  factory PaidBillRequest.fromJson(Map<String, dynamic> json) =>
      _$PaidBillRequestFromJson(json);
}

// Model for received amount in request
@freezed
class ReceivedAmountRequest with _$ReceivedAmountRequest {
  const factory ReceivedAmountRequest({
    @JsonKey(name: 'invoice_value') String? invoiceValue,
    @JsonKey(name: 'invoice_date') String? invoiceDate,
  }) = _ReceivedAmountRequest;

  factory ReceivedAmountRequest.fromJson(Map<String, dynamic> json) =>
      _$ReceivedAmountRequestFromJson(json);
}
