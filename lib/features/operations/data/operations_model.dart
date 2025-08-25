import 'package:freezed_annotation/freezed_annotation.dart';
part 'operations_model.freezed.dart';
part 'operations_model.g.dart';

@freezed
class OperationModel with _$OperationModel {
  const factory OperationModel({
    String? partnerName,
    String? clientName,
    int? operationTypeId,
    String? invoiceNumber,
    double? invoiceValue,
    double? paidValue,
    String? paidDate,
    double? remainingInvoice,
    double? percentage,
    double? percentageValue,
    double? totalDue,
    double? receivedValue,
    String? receivedDate,
    double? remainingAmount,
    String? operationDate,
    String? reminderDate,
    String? notes,
  }) = _OperationModel;

  factory OperationModel.fromJson(Map<String, dynamic> json) =>
      _$OperationModelFromJson(
        json["data"] is Map<String, dynamic> ? json["data"] : json,
      );
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
  const factory DinamicFiledsModel({int? id, String? value,String? data,}) =
      _DinamicFiledsModel;

  factory DinamicFiledsModel.fromJson(Map<String, dynamic> json) =>
      _$DinamicFiledsModelFromJson(
        json["data"] is Map<String, dynamic> ? json["data"] : json,
      );
}
