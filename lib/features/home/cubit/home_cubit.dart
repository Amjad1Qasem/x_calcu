import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/home/data/home_repo.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());
  bool isInput = true;

  // Search variables
  String _searchQuery = '';
  bool _isSearching = false;

  // Filter variables
  String _orderBy = 'asc';
  DateTime? _startDate;
  DateTime? _endDate;

  // Pagination variables
  static const int _pageSize = 10;
  List<OperationModel> _allOperations = [];
  int _currentPage = 1;
  bool _hasReachedMax = false;

  /// **Filter Result by Input or Output*
  void operationFilter() {
    isInput = !isInput;
    // Reset pagination state
    resetPagination();
    emit(HomeState.filterChanged(isInput: isInput));
    // Automatically refresh operations with new filter
    getOperations(refresh: true);
  }

  /// **Get Operations Data */
  Future<void> getOperations({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _allOperations.clear();
      _hasReachedMax = false;
      emit(HomeState.loading());
    } else if (_allOperations.isEmpty) {
      emit(HomeState.loading());
    }

    final searchParam = _isSearching ? _searchQuery : null;
    print(
      '📡 API Call - operationType: ${isInput ? 'input' : 'output'}, search: "$searchParam", page: $_currentPage',
    );

    final result = await _homeRepo.getOperationsDataWithFilter(
      operationType: isInput ? 'input' : 'output',
      orderBy: _orderBy,
      search: searchParam,
      startDate: _startDate,
      endDate: _endDate,
      page: _currentPage,
      limit: _pageSize,
    );

    result.when(
      success: (data) {
        if (refresh || _allOperations.isEmpty) {
          _allOperations = data;
        } else {
          _allOperations.addAll(data);
        }

        _hasReachedMax = data.length < _pageSize;

        emit(
          HomeState.loaded(
            operations: _allOperations,
            hasReachedMax: _hasReachedMax,
            currentPage: _currentPage,
          ),
        );
      },
      failure: (error) => emit(HomeState.error(message: error.message)),
    );
  }

  /// **Load More Operations */
  Future<void> loadMoreOperations() async {
    if (_hasReachedMax) return;

    emit(
      HomeState.loadingMore(
        operations: _allOperations,
        currentPage: _currentPage,
      ),
    );

    _currentPage++;

    final searchParam = _isSearching ? _searchQuery : null;
    print(
      '📡 Load More API Call - search: "$searchParam", page: $_currentPage',
    );

    final result = await _homeRepo.getOperationsDataWithFilter(
      operationType: isInput ? 'input' : 'output',
      orderBy: _orderBy,
      search: searchParam,
      startDate: _startDate,
      endDate: _endDate,
      page: _currentPage,
      limit: _pageSize,
    );

    result.when(
      success: (data) {
        _allOperations.addAll(data);
        _hasReachedMax = data.length < _pageSize;

        emit(
          HomeState.loaded(
            operations: _allOperations,
            hasReachedMax: _hasReachedMax,
            currentPage: _currentPage,
          ),
        );
      },
      failure: (error) {
        // Revert page increment on failure
        _currentPage--;
        emit(HomeState.error(message: error.message));
      },
    );
  }

  /// **Get Operations Data with Filter */
  Future<void> getOperationsWithFilter({
    String? operationType,
    String? orderBy,
    String? search,
  }) async {
    emit(HomeState.loading());

    final result = await _homeRepo.getOperationsDataWithFilter(
      operationType: operationType ?? (isInput ? 'input' : 'output'),
      orderBy: orderBy ?? 'asc',
      search: search,
    );

    result.when(
      success: (data) => emit(HomeState.loaded(operations: data)),
      failure: (error) => emit(HomeState.error(message: error.message)),
    );
  }

  /// **Reset pagination state */
  void resetPagination() {
    _currentPage = 1;
    _allOperations.clear();
    _hasReachedMax = false;
  }

  /// **Search Operations */
  Future<void> searchOperations(String query) async {
    _searchQuery = query.trim();
    _isSearching = _searchQuery.isNotEmpty;

    print('🔍 Searching for: "$_searchQuery"');
    print('🔍 Is searching: $_isSearching');

    // Reset pagination for new search
    resetPagination();
    emit(HomeState.searching(query: _searchQuery));

    // Fetch operations with search
    await getOperations(refresh: true);
  }

  /// **Clear Search */
  void clearSearch() {
    _searchQuery = '';
    _isSearching = false;

    print('🧹 Clearing search');

    // Reset pagination and fetch all operations
    resetPagination();
    emit(HomeState.searchCleared());

    // Fetch operations without search
    getOperations(refresh: true);
  }

  /// **Get search query */
  String get searchQuery => _searchQuery;

  /// **Is searching */
  bool get isSearching => _isSearching;

  /// **Set Order By */
  void setOrderBy(String orderBy) {
    _orderBy = orderBy;
    resetPagination();
    emit(HomeState.filterChanged(isInput: isInput));
    getOperations(refresh: true);
  }

  /// **Set Date Range */
  void setDateRange(DateTime? startDate, DateTime? endDate) {
    _startDate = startDate;
    _endDate = endDate;
    resetPagination();
    emit(HomeState.filterChanged(isInput: isInput));
    getOperations(refresh: true);
  }

  /// **Clear All Filters and Search */
  void clearAllFilters() {
    _searchQuery = '';
    _isSearching = false;
    _orderBy = 'asc';
    _startDate = null;
    _endDate = null;
    resetPagination();
    emit(HomeState.searchCleared());
    getOperations(refresh: true);
  }

  /// **Clear Date Range */
  void clearDateRange() {
    _startDate = null;
    _endDate = null;
    resetPagination();
    emit(HomeState.filterChanged(isInput: isInput));
    getOperations(refresh: true);
  }

  /// **Get current order by */
  String get orderBy => _orderBy;

  /// **Get current start date */
  DateTime? get startDate => _startDate;

  /// **Get current end date */
  DateTime? get endDate => _endDate;
}
