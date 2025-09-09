import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/features/partners/data/repo/partner_repo.dart';
import 'package:x_calcu/features/partners/data/models/statistic_partner_model.dart';
import 'package:x_calcu/global/networking/failure.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

part 'partner_state.dart';
part 'partner_cubit.freezed.dart';

class PartnerCubit extends Cubit<PartnerState> {
  final PartnerRepo _partnerRepo;
  PartnerCubit(this._partnerRepo) : super(PartnerState.initial());

  // Filter variables
  bool isInput = true;
  String _orderBy = 'asc';

  // Pagination variables
  static const int _pageSize = 10;
  List<PartnerModel> _allPartners = [];
  int _currentPage = 1;
  bool _hasReachedMax = false;

  // Getters
  int get currentPage => _currentPage;
  bool get hasReachedMax => _hasReachedMax;
  List<PartnerModel> get allPartners => _allPartners;
  String get orderBy => _orderBy;

  /// **Filter Result by Input or Output**
  void operationFilter() {
    isInput = !isInput;
    // Reset pagination state
    resetPagination();
    emit(PartnerState.partnersloading());
    // Automatically refresh partners with new filter
    getPartners(refresh: true);
  }

  /// **Get Partners Data */
  Future<void> getPartners({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _allPartners.clear();
      _hasReachedMax = false;
      emit(PartnerState.partnersloading());
    } else if (_allPartners.isEmpty) {
      emit(PartnerState.partnersloading());
    }

    print(
      '📡 API Call - operationType: ${isInput ? 'input' : 'output'}, page: $_currentPage',
    );

    final result = await _partnerRepo.getPartnersDataWithFilter(
      operationType: isInput ? 'input' : 'output',
      orderBy: _orderBy,
      page: _currentPage,
      limit: _pageSize,
    );

    result.when(
      success: (data) {
        if (refresh || _allPartners.isEmpty) {
          _allPartners = data;
        } else {
          _allPartners.addAll(data);
        }

        _hasReachedMax = data.length < _pageSize;

        emit(
          PartnerState.partnersloaded(
            data: _allPartners,
            hasReachedMax: _hasReachedMax,
            currentPage: _currentPage,
          ),
        );
      },
      failure:
          (error) => emit(PartnerState.partnerserror(message: error.message)),
    );
  }

  /// **Load More Partners */
  Future<void> loadMorePartners() async {
    if (_hasReachedMax) return;

    emit(PartnerState.partnersloading());

    _currentPage++;

    print('📡 Load More API Call - page: $_currentPage');

    final result = await _partnerRepo.getPartnersDataWithFilter(
      operationType: isInput ? 'input' : 'output',
      orderBy: _orderBy,
      page: _currentPage,
      limit: _pageSize,
    );

    result.when(
      success: (data) {
        _allPartners.addAll(data);
        _hasReachedMax = data.length < _pageSize;

        emit(
          PartnerState.partnersloaded(
            data: _allPartners,
            hasReachedMax: _hasReachedMax,
            currentPage: _currentPage,
          ),
        );
      },
      failure: (error) {
        // Revert page increment on failure
        _currentPage--;
        emit(PartnerState.partnerserror(message: error.message));
      },
    );
  }

  /// **Reset pagination state */
  void resetPagination() {
    _currentPage = 1;
    _allPartners.clear();
    _hasReachedMax = false;
  }

  /// **Set Order By */
  void setOrderBy(String orderBy) {
    _orderBy = orderBy;
    resetPagination();
    emit(PartnerState.partnersloading());
    getPartners(refresh: true);
  }

  /// **Clear All Filters */
  void clearAllFilters() {
    _orderBy = 'asc';
    resetPagination();
    emit(PartnerState.partnersloading());
    getPartners(refresh: true);
  }

  // Get Partner Details
  Future<void> getPartner({required int id}) async {
    emit(PartnerState.partnerloading());
    final response = await _partnerRepo.getPartnerDetailsData(id: id);

    response.when(
      success: (data) {
        emit(PartnerState.partnerloaded(data: data));
      },
      failure: (error) {
        printError('Failed to get partner details: $error');
        emit(
          PartnerState.partnererror(
            message:
                error is ValidationInputError
                    ? error.message
                    : 'Failed to get partner',
          ),
        );
      },
    );
  }

  // Remove partner from local list (used by DeletePartnerCubit)
  void removePartnerFromList(int id) {
    _allPartners.removeWhere((partner) => partner.id == id);
    emit(
      PartnerState.partnersloaded(
        data: _allPartners,
        hasReachedMax: _hasReachedMax,
        currentPage: _currentPage,
      ),
    );
  }

  // In Partners Screen
  Future<void> getStatistics({int? parentId}) async {
    emit(PartnerState.loading());

    try {
      final result = await _partnerRepo.getStatistic(
        operationType: isInput ? 'input' : 'output',
        parentId: parentId ?? 1, // Default parentId if not provided
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
          emit(PartnerState.loaded(data: data));
        },
        failure: (error) {
          printError('Failed to get statistics: $error');
          emit(PartnerState.error(message: error.message));
        },
      );
    } catch (e) {
      printError('Exception in getStatistics: $e');
      emit(PartnerState.error(message: "failed_to_load_statistics".tr()));
    }
  }
}
