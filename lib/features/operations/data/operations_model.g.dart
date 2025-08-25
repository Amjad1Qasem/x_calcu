// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OperationModelImpl _$$OperationModelImplFromJson(Map<String, dynamic> json) =>
    _$OperationModelImpl(
      partnerName: json['partnerName'] as String?,
      clientName: json['clientName'] as String?,
      operationTypeId: (json['operationTypeId'] as num?)?.toInt(),
      invoiceNumber: json['invoiceNumber'] as String?,
      invoiceValue: (json['invoiceValue'] as num?)?.toDouble(),
      paidValue: (json['paidValue'] as num?)?.toDouble(),
      paidDate: json['paidDate'] as String?,
      remainingInvoice: (json['remainingInvoice'] as num?)?.toDouble(),
      percentage: (json['percentage'] as num?)?.toDouble(),
      percentageValue: (json['percentageValue'] as num?)?.toDouble(),
      totalDue: (json['totalDue'] as num?)?.toDouble(),
      receivedValue: (json['receivedValue'] as num?)?.toDouble(),
      receivedDate: json['receivedDate'] as String?,
      remainingAmount: (json['remainingAmount'] as num?)?.toDouble(),
      operationDate: json['operationDate'] as String?,
      reminderDate: json['reminderDate'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$OperationModelImplToJson(
  _$OperationModelImpl instance,
) => <String, dynamic>{
  'partnerName': instance.partnerName,
  'clientName': instance.clientName,
  'operationTypeId': instance.operationTypeId,
  'invoiceNumber': instance.invoiceNumber,
  'invoiceValue': instance.invoiceValue,
  'paidValue': instance.paidValue,
  'paidDate': instance.paidDate,
  'remainingInvoice': instance.remainingInvoice,
  'percentage': instance.percentage,
  'percentageValue': instance.percentageValue,
  'totalDue': instance.totalDue,
  'receivedValue': instance.receivedValue,
  'receivedDate': instance.receivedDate,
  'remainingAmount': instance.remainingAmount,
  'operationDate': instance.operationDate,
  'reminderDate': instance.reminderDate,
  'notes': instance.notes,
};

_$DropDownModelImpl _$$DropDownModelImplFromJson(Map<String, dynamic> json) =>
    _$DropDownModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$DropDownModelImplToJson(_$DropDownModelImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_$DinamicFiledsModelImpl _$$DinamicFiledsModelImplFromJson(
  Map<String, dynamic> json,
) => _$DinamicFiledsModelImpl(
  id: (json['id'] as num?)?.toInt(),
  value: json['value'] as String?,
  data: json['data'] as String?,
);

Map<String, dynamic> _$$DinamicFiledsModelImplToJson(
  _$DinamicFiledsModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'value': instance.value,
  'data': instance.data,
};
