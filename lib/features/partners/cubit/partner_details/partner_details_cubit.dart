import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/partners/data/models/partner_details_model.dart';
import 'package:x_calcu/features/partners/data/repo/partner_repo.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

part 'partner_details_state.dart';
part 'partner_details_cubit.freezed.dart';

class PartnerDetailsCubit extends Cubit<PartnerDetailsState> {
  final PartnerRepo _partnerRepo;
  PartnerDetailsCubit(this._partnerRepo) : super(PartnerDetailsState.initial());

  // Filter variables
  bool isInput = true;
  String _currentOperationType = 'input';
  String _orderBy = 'asc';
  int? _currentPartnerId;
  DateTime? _startDate;
  DateTime? _endDate;

  // Getter for current partner ID
  int? get currentPartnerId => _currentPartnerId;

  // Pagination variables for operations
  List<PartnerDetailsOperation> _allOperations = [];
  int _currentPage = 1;
  bool _hasReachedMax = false;

  // Getters
  String get currentOperationType => _currentOperationType;
  int get currentPage => _currentPage;
  bool get hasReachedMax => _hasReachedMax;
  List<PartnerDetailsOperation> get allOperations => _allOperations;
  String get orderBy => _orderBy;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;

  /// **Filter Result by Input or Output**
  void operationFilter() {
    isInput = !isInput;
    _currentOperationType = isInput ? 'input' : 'output';
    emit(PartnerDetailsState.loading());
    printSuccess('Filter changed to: $_currentOperationType');

    // Reset pagination state
    resetPagination();

    // Refresh data with new filter if we have a partner ID
    if (_currentPartnerId != null) {
      getPartnerDetails(partnerId: _currentPartnerId!);
    }
  }

  /// **Reset pagination state */
  void resetPagination() {
    _currentPage = 1;
    _allOperations.clear();
    _hasReachedMax = false;
  }

  /// **Get Partner Details with Operations */
  Future<void> getPartnerDetails({
    required int partnerId,
    bool refresh = false,
  }) async {
    _currentPartnerId = partnerId;

    if (refresh) {
      emit(PartnerDetailsState.loading());
      resetPagination();
    } else if (state is! Loading) {
      emit(PartnerDetailsState.loading());
    }

    printSuccess(
      '📡 API Call - Partner ID: $partnerId, Operation Type: $_currentOperationType',
    );

    // Get partner details and statistics
    final detailsResult = await _partnerRepo.getPartnerDetailsWithOperations(
      id: partnerId,
      operationType: _currentOperationType,
      orderBy: _orderBy,
      startDate: _startDate,
      endDate: _endDate,
    );

    detailsResult.when(
      success: (detailsData) async {
        printSuccess('✅ Partner details loaded successfully');

        // For now, we'll load operations separately since the API structure needs to be verified
        // TODO: Use operations from detailsData.operations when API returns them properly
        await _loadOperationsPage(partnerId: partnerId, page: 1);

        // Emit loaded state with both details and operations
        if (state is! Loading) return; // Check if still loading
        emit(
          PartnerDetailsState.loaded(
            data: detailsData,
            operations: _allOperations.isNotEmpty ? _allOperations : [],
          ),
        );
      },
      failure: (failure) {
        printError('❌ Failed to load partner details: ${failure.message}');
        emit(PartnerDetailsState.error(message: failure.message));
      },
    );
  }

  /// **Load operations page */
  Future<void> _loadOperationsPage({
    required int partnerId,
    required int page,
  }) async {
    printSuccess(
      '📡 PartnerDetailsCubit: _loadOperationsPage called for page: $page',
    );

    final operationsResult = await _partnerRepo.getPartnerOperations(
      id: partnerId,
      operationType: _currentOperationType,
      page: page,
      orderBy: _orderBy,
      startDate: _startDate,
      endDate: _endDate,
    );

    operationsResult.when(
      success: (operationsData) {
        if (page == 1) {
          _allOperations = operationsData;
        } else {
          _allOperations.addAll(operationsData);
        }

        _hasReachedMax = operationsData.length < 10; // Assuming page size is 10
        _currentPage = page;

        printSuccess('✅ Operations page $page loaded successfully');
      },
      failure: (failure) {
        printError(
          '❌ Failed to load operations page $page: ${failure.message}',
        );
      },
    );
  }

  /// **Load more operations */
  Future<void> loadMoreOperations() async {
    if (_hasReachedMax || _currentPartnerId == null) return;

    final nextPage = _currentPage + 1;
    await _loadOperationsPage(partnerId: _currentPartnerId!, page: nextPage);

    // Update state with new operations
    if (state is Loaded) {
      final currentState = state as Loaded;
      emit(
        PartnerDetailsState.loaded(
          data: currentState.data,
          operations: _allOperations.isNotEmpty ? _allOperations : [],
        ),
      );
    }
  }

  /// **Refresh Partner Details */
  Future<void> refreshPartnerDetails({required int partnerId}) async {
    await getPartnerDetails(partnerId: partnerId, refresh: true);
  }

  /// **Set Order By */
  void setOrderBy(String orderBy) {
    _orderBy = orderBy;
    printSuccess('🔄 PartnerDetailsCubit: setOrderBy called with: $orderBy');
    resetPagination();
    emit(PartnerDetailsState.loading());
    if (_currentPartnerId != null) {
      getPartnerDetails(partnerId: _currentPartnerId!);
    }
  }

  /// **Set Date Range */
  void setDateRange(DateTime? startDate, DateTime? endDate) {
    _startDate = startDate;
    _endDate = endDate;
    printSuccess(
      '🔄 PartnerDetailsCubit: setDateRange called with startDate: $startDate, endDate: $endDate',
    );
    resetPagination();
    emit(PartnerDetailsState.loading());
    if (_currentPartnerId != null) {
      getPartnerDetails(partnerId: _currentPartnerId!);
    }
  }

  /// **Clear Date Range */
  void clearDateRange() {
    _startDate = null;
    _endDate = null;
    printSuccess('🔄 PartnerDetailsCubit: clearDateRange called');
    resetPagination();
    emit(PartnerDetailsState.loading());
    if (_currentPartnerId != null) {
      getPartnerDetails(partnerId: _currentPartnerId!);
    }
  }
}
