import 'package:freezed_annotation/freezed_annotation.dart';
part 'statistics_model.freezed.dart';
part 'statistics_model.g.dart';

@freezed
class StatisticModel with _$StatisticModel {
  const factory StatisticModel({
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'مجاميع قيم الفواتير') double? totalInvoiceValues,
    @JsonKey(name: 'مجاميع سداد الفواتير') double? totalPaidInvoices,
    @JsonKey(name: 'باقي الفواتير') double? remainingInvoices,
    @JsonKey(name: 'المبلغ المستحقة') double? dueAmount,
    @JsonKey(name: 'المبلغ المقبوضة') double? receivedAmount,
    @JsonKey(name: 'المبلغ المتبقية') double? remainingAmount,
    @JsonKey(name: 'الارباح') double? profits,
  }) = _StatisticModel;

  factory StatisticModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticModelFromJson(
        json["data"] is Map<String, dynamic> ? json["data"] : json,
      );
}
