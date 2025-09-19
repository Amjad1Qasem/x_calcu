import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/partners/data/models/statistic_partner_model.dart';
import 'package:x_calcu/features/partners/data/repo/partner_repo.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

part 'statistics_state.dart';
part 'statistics_cubit.freezed.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  final PartnerRepo _partnerRepo;

  StatisticsCubit(this._partnerRepo) : super(StatisticsState.initial());

  String _currentOperationType = 'input';

  /// **Get Statistics Data */
  Future<void> getStatistics({String? operationType}) async {
    // Update operation type if provided
    if (operationType != null) {
      _currentOperationType = operationType;
    }

    printSuccess(
      '🔄 StatisticsCubit.getStatistics() called with operationType: $_currentOperationType',
    );

    emit(StatisticsState.loading());

    try {
      final result = await _partnerRepo.getStatistic(
        operationType: _currentOperationType,
      );

      result.when(
        success: (statisticsData) {
          // Convert PartnerStatisticsModel to StatisticPartnerModel list
          final data = [
            StatisticPartnerModel(
              title: "total_invoice_values".tr(),
              value:
                  statisticsData.totalInvoiceValues?.toStringAsFixed(2) ?? "0",
            ),
            StatisticPartnerModel(
              title: "total_paid_invoices".tr(),
              value:
                  statisticsData.totalPaidInvoices?.toStringAsFixed(2) ?? "0",
            ),
            StatisticPartnerModel(
              title: "remaining_invoices".tr(),
              value:
                  statisticsData.remainingInvoices?.toStringAsFixed(2) ?? "0",
            ),
            StatisticPartnerModel(
              title: "due_amount".tr(),
              value: statisticsData.dueAmount?.toStringAsFixed(2) ?? "0",
            ),
            StatisticPartnerModel(
              title: "received_amount".tr(),
              value: statisticsData.receivedAmount?.toStringAsFixed(2) ?? "0",
            ),
            StatisticPartnerModel(
              title: "remaining_amount".tr(),
              value: statisticsData.remainingAmount?.toStringAsFixed(2) ?? "0",
            ),
            StatisticPartnerModel(
              title: "profits".tr(),
              value: statisticsData.profits?.toStringAsFixed(2) ?? "0",
            ),
          ];

          printSuccess(
            '✅ StatisticsCubit: Statistics loaded successfully: ${data.length} items',
          );

          emit(StatisticsState.loaded(data: data));
        },
        failure: (error) {
          printError('❌ StatisticsCubit: Failed to get statistics: $error');
          emit(StatisticsState.error(message: error.message));
        },
      );
    } catch (e) {
      printError('💥 StatisticsCubit: Exception in getStatistics: $e');
      emit(StatisticsState.error(message: "failed_to_load_statistics".tr()));
    }
  }

  /// **Update Operation Type and Refresh Statistics */
  Future<void> updateOperationType(String operationType) async {
    _currentOperationType = operationType;
    await getStatistics();
  }

  /// **Get Current Operation Type */
  String get currentOperationType => _currentOperationType;
}
