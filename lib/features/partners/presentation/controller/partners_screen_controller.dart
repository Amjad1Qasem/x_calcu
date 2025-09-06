import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:x_calcu/features/partners/cubit/partners/partner_cubit.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class PartnersScreenController {
  final PagingController<int, PartnerModel> pagingController;
  bool isSearchExpanded = false;

  PartnersScreenController()
    : pagingController = PagingController(firstPageKey: 1) {
    _initialize();
  }

  void _initialize() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    getIt<PartnerCubit>().getPartners(refresh: true);
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final cubit = getIt<PartnerCubit>();

      if (pageKey == 1) {
        // Always refresh for first page to ensure clean state
        await cubit.getPartners(refresh: true);
      } else {
        await cubit.loadMorePartners();
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void handleStateChange(dynamic state) {
    if (state is PartnersLoaded) {
      if (state.hasReachedMax) {
        pagingController.appendLastPage(state.data);
      } else {
        pagingController.appendPage(state.data, state.currentPage + 1);
      }
    } else if (state is PartnersError) {
      pagingController.error = state.message;
    } else if (state is PartnersLoading) {
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
  }

  Future<void> handleRefresh() async {
    // Clear all filters and search when refreshing
    getIt<PartnerCubit>().clearAllFilters();
    pagingController.refresh();
    printSuccess('RefreshIndicator - All filters cleared');
  }

  void dispose() {
    pagingController.dispose();
  }
}
