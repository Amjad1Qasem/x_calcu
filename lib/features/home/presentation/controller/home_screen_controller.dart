import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:x_calcu/features/home/cubit/home_cubit.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class HomeScreenController {
  final PagingController<int, OperationModel> pagingController;
  bool isSearchExpanded = false;

  HomeScreenController()
    : pagingController = PagingController(firstPageKey: 1) {
    _initialize();
  }

  void _initialize() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    getIt<HomeCubit>().getOperations();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final cubit = getIt<HomeCubit>();

      if (pageKey == 1) {
        // Always refresh for first page to ensure clean state
        await cubit.getOperations(refresh: true);
      } else {
        await cubit.loadMoreOperations();
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void handleStateChange(dynamic state) {
    if (state is Loaded) {
      if (state.hasReachedMax) {
        pagingController.appendLastPage(state.operations);
      } else {
        pagingController.appendPage(state.operations, state.currentPage + 1);
      }
    } else if (state is Error) {
      pagingController.error = state.message;
    } else if (state is FilterChanged ||
        state is Searching ||
        state is SearchCleared) {
      // Reset pagination when filter changes
      pagingController.refresh();
      // Clear any existing error state
      if (pagingController.error != null) {
        pagingController.error = null;
      }
    }
  }

  void toggleSearchExpanded() {
    isSearchExpanded = !isSearchExpanded;
  }

  void collapseSearch() {
    isSearchExpanded = false;
    getIt<HomeCubit>().clearSearch();
  }

  Future<void> handleRefresh() async {
    // Clear all filters and search when refreshing
    getIt<HomeCubit>().clearAllFilters();
    pagingController.refresh();
    printSuccess('RefreshIndicator - All filters cleared');
  }

  void dispose() {
    pagingController.dispose();
  }
}
