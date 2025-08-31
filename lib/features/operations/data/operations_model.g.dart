// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaidInvoiceDetailImpl _$$PaidInvoiceDetailImplFromJson(
  Map<String, dynamic> json,
) => _$PaidInvoiceDetailImpl(
  invoiceValue: (json['invoice_value'] as num?)?.toDouble(),
  invoiceDate: json['invoice_date'] as String?,
);

Map<String, dynamic> _$$PaidInvoiceDetailImplToJson(
  _$PaidInvoiceDetailImpl instance,
) => <String, dynamic>{
  'invoice_value': instance.invoiceValue,
  'invoice_date': instance.invoiceDate,
};

_$PaidInvoiceSummaryImpl _$$PaidInvoiceSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$PaidInvoiceSummaryImpl(
  totalPaidValue: (json['قيمة السداد الكلية'] as num?)?.toDouble(),
  paidDetails:
      (json['القيم التفصيلية'] as List<dynamic>?)
          ?.map((e) => PaidInvoiceDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$PaidInvoiceSummaryImplToJson(
  _$PaidInvoiceSummaryImpl instance,
) => <String, dynamic>{
  'قيمة السداد الكلية': instance.totalPaidValue,
  'القيم التفصيلية': instance.paidDetails,
};

_$PercentageDetailsImpl _$$PercentageDetailsImplFromJson(
  Map<String, dynamic> json,
) => _$PercentageDetailsImpl(
  percentage: json['النسبة المئوية'] as String?,
  percentageValue: (json['قيمة النسبة المئوية'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$PercentageDetailsImplToJson(
  _$PercentageDetailsImpl instance,
) => <String, dynamic>{
  'النسبة المئوية': instance.percentage,
  'قيمة النسبة المئوية': instance.percentageValue,
};

_$ReceivedAmountDetailImpl _$$ReceivedAmountDetailImplFromJson(
  Map<String, dynamic> json,
) => _$ReceivedAmountDetailImpl(
  invoiceValue: (json['invoice_value'] as num?)?.toDouble(),
  invoiceDate: json['invoice_date'] as String?,
);

Map<String, dynamic> _$$ReceivedAmountDetailImplToJson(
  _$ReceivedAmountDetailImpl instance,
) => <String, dynamic>{
  'invoice_value': instance.invoiceValue,
  'invoice_date': instance.invoiceDate,
};

_$ReceivedAmountSummaryImpl _$$ReceivedAmountSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$ReceivedAmountSummaryImpl(
  totalReceivedValue: (json['قيمة المقبوضات الكلية'] as num?)?.toDouble(),
  receivedDetails:
      (json['القيم التفصيلية'] as List<dynamic>?)
          ?.map((e) => ReceivedAmountDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$ReceivedAmountSummaryImplToJson(
  _$ReceivedAmountSummaryImpl instance,
) => <String, dynamic>{
  'قيمة المقبوضات الكلية': instance.totalReceivedValue,
  'القيم التفصيلية': instance.receivedDetails,
};

_$OperationModelImpl _$$OperationModelImplFromJson(Map<String, dynamic> json) =>
    _$OperationModelImpl(
      id: (json['id'] as num?)?.toInt(),
      partnerName: json['اسم الشريك'] as String?,
      clientName: json['اسم العميل'] as String?,
      operationType: json['نوع العملية'] as String?,
      invoiceNumber: json['رقم الفاتورة'] as String?,
      invoiceValue: (json['قيمة الفاتورة'] as num?)?.toDouble(),
      paidInvoice:
          json['سدد من الفاتورة'] == null
              ? null
              : PaidInvoiceSummary.fromJson(
                json['سدد من الفاتورة'] as Map<String, dynamic>,
              ),
      remainingInvoice: (json['باقي من الفاتورة'] as num?)?.toDouble(),
      percentageDetails:
          json['نسبتي من المبلغ'] == null
              ? null
              : PercentageDetails.fromJson(
                json['نسبتي من المبلغ'] as Map<String, dynamic>,
              ),
      totalDue: (json['المبلغ المستحق'] as num?)?.toDouble(),
      receivedAmount:
          json['المبلغ المقبوض'] == null
              ? null
              : ReceivedAmountSummary.fromJson(
                json['المبلغ المقبوض'] as Map<String, dynamic>,
              ),
      remainingAmount: (json['المبلغ المتبقي'] as num?)?.toDouble(),
      operationDate: json['التاريخ'] as String?,
      reminderDate: json['تاريخ التنبيه'] as String?,
      notes: json['الملاحظات'] as String?,
    );

Map<String, dynamic> _$$OperationModelImplToJson(
  _$OperationModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'اسم الشريك': instance.partnerName,
  'اسم العميل': instance.clientName,
  'نوع العملية': instance.operationType,
  'رقم الفاتورة': instance.invoiceNumber,
  'قيمة الفاتورة': instance.invoiceValue,
  'سدد من الفاتورة': instance.paidInvoice,
  'باقي من الفاتورة': instance.remainingInvoice,
  'نسبتي من المبلغ': instance.percentageDetails,
  'المبلغ المستحق': instance.totalDue,
  'المبلغ المقبوض': instance.receivedAmount,
  'المبلغ المتبقي': instance.remainingAmount,
  'التاريخ': instance.operationDate,
  'تاريخ التنبيه': instance.reminderDate,
  'الملاحظات': instance.notes,
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
