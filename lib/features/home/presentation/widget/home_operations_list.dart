import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:x_calcu/features/home/cubit/home_cubit.dart';
import 'package:x_calcu/features/home/presentation/widget/operation_card.dart';
import 'package:x_calcu/features/home/presentation/widget/operation_card_shimmer.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/global/components/utils/empty_list_widget.dart';
import 'package:x_calcu/global/components/utils/error_widget_screen.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class HomeOperationsList extends StatelessWidget {
  final PagingController<int, OperationModel> pagingController;

  const HomeOperationsList({super.key, required this.pagingController});

  @override
  Widget build(BuildContext context) {
    return PagedSliverList<int, OperationModel>(
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<OperationModel>(
        itemBuilder:
            (context, operation, index) => OperationCard(
              operation: operation,
              onTap:
                  () => context.push(
                    RouterPath.showOperationsDetailsScreen,
                    extra: operation,
                  ),
            ),
        firstPageProgressIndicatorBuilder: (context) => _buildShimmerList(),
        newPageProgressIndicatorBuilder: (context) => _buildShimmerList(),
        firstPageErrorIndicatorBuilder:
            (context) => ErrorWidgetScreen(
              message: pagingController.error.toString(),
              onRetry: () => pagingController.refresh(),
            ),
        newPageErrorIndicatorBuilder:
            (context) => ErrorWidgetScreen(
              message: pagingController.error.toString(),
              onRetry: () => pagingController.retryLastFailedRequest(),
            ),
        noItemsFoundIndicatorBuilder:
            (context) => EmptyListWidget(
              message:
                  getIt<HomeCubit>().isSearching
                      ? 'No operations found for "${getIt<HomeCubit>().searchQuery}"'
                      : getIt<HomeCubit>().isInput
                      ? 'no_input_operations_message'.tr()
                      : 'no_output_operations_message'.tr(),
            ),
      ),
    );
  }

  Widget _buildShimmerList() {
    return Column(
      children: List.generate(3, (index) => const OperationCardShimmer()),
    );
  }
}
