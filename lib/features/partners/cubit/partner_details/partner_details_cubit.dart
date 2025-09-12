import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/partners/data/models/partner_details_model.dart';
import 'package:x_calcu/features/partners/data/models/partner_operations_model.dart';
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
  int? _currentPartnerId;

  // Pagination variables for operations
  List<PartnerDetailsOperation> _allOperations = [];
  int _currentPage = 1;
  bool _hasReachedMax = false;

  // Getters
  String get currentOperationType => _currentOperationType;
  int get currentPage => _currentPage;
  bool get hasReachedMax => _hasReachedMax;
  List<PartnerDetailsOperation> get allOperations => _allOperations;

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
    );

    detailsResult.when(
      success: (detailsData) async {
        printSuccess('✅ Partner details loaded successfully');

        // Get first page of operations
        await _loadOperationsPage(partnerId: partnerId, page: 1);

        // Emit loaded state with both details and operations
        if (state is! Loading) return; // Check if still loading
        emit(
          PartnerDetailsState.loaded(
            data: detailsData,
            operations: PartnerOperationsModel(
              data: _allOperations,
              links: null, // No pagination links from API
            ),
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
    final operationsResult = await _partnerRepo.getPartnerOperations(
      id: partnerId,
      operationType: _currentOperationType,
      page: page,
    );

    operationsResult.when(
      success: (operationsData) {
        if (page == 1) {
          _allOperations = operationsData.data;
        } else {
          _allOperations.addAll(operationsData.data);
        }

        _hasReachedMax = operationsData.links?.hasNext != true;
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
          operations: PartnerOperationsModel(
            data: _allOperations,
            links: null, // No pagination links from API
          ),
        ),
      );
    }
  }

  /// **Refresh Partner Details */
  Future<void> refreshPartnerDetails({required int partnerId}) async {
    await getPartnerDetails(partnerId: partnerId, refresh: true);
  }
}
