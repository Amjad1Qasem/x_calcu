import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/home/presentation/widget/operation_card.dart';
import 'package:x_calcu/features/operations/cubit/delete_operation/delete_operation_cubit.dart';
import 'package:x_calcu/features/partners/presentation/widget/selection/selectable_operation_card.dart';
import 'package:x_calcu/features/partners/cubit/selection/selection_cubit.dart';
import 'package:x_calcu/features/partners/cubit/partner_details/partner_details_cubit.dart'
    hide Error;
import 'package:x_calcu/features/partners/data/models/partner_details_model.dart';
import 'package:x_calcu/features/operations/utils/operation_delete_helper.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/components/utils/error_widget_screen.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class PartnerDetailsOperationsList extends StatelessWidget {
  final PartnerDetailsState state;
  final PartnerDetailsCubit cubit;
  final int partnerId;

  const PartnerDetailsOperationsList({
    super.key,
    required this.state,
    required this.cubit,
    required this.partnerId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteOperationCubit, DeleteOperationState>(
      bloc: getIt<DeleteOperationCubit>(),
      listener: (context, deleteOperationState) {
        if (deleteOperationState is Success) {
          cubit.getPartnerDetails(partnerId: partnerId);
        }
        if (deleteOperationState is Error) {
          snackBar(
            context: context,
            title: deleteOperationState.message,
            isErrorMessage: true,
          );
        }
      },
      child: state.when(
        initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
        loading:
            () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
        loaded: (data, operations) => _buildOperationsList(context, operations),
        error:
            (message) => SliverToBoxAdapter(
              child: ErrorWidgetScreen(
                isIcon: false,
                onRetry:
                    () => cubit.getPartnerDetails(
                      partnerId: 0,
                    ), // Will be handled by parent
                message: message,
              ),
            ),
      ),
    );
  }

  Widget _buildOperationsList(
    BuildContext context,
    List<PartnerDetailsOperation> operations,
  ) {
    // Filter out operations with null or empty data
    final validOperations =
        operations.where((operation) {
          return operation.partnerName != null ||
              operation.clientName != null ||
              operation.invoiceNumber != null ||
              operation.invoiceValue != null;
        }).toList();

    if (validOperations.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
          child: Center(
            child: Text(
              'no_operations_found'.tr(),
              style: TextStyle(
                color: Utils(context).secondTextColor,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        // Check if we need to load more operations
        if (index == validOperations.length - 1 && !cubit.hasReachedMax) {
          cubit.loadMoreOperations();
        }

        final operation = validOperations[index];

        // Check if we're in selection mode
        return BlocBuilder<SelectionCubit, SelectionState>(
          builder: (context, selectionState) {
            final isSelectionMode = selectionState.maybeWhen(
              selectionMode: () => true,
              selectionActive: (_) => true,
              orElse: () => false,
            );

            if (isSelectionMode) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                child: SelectableOperationCard(
                  operation: operation,
                  onTap:
                      () => context.push(
                        RouterPath.showOperationsDetailsScreen,
                        extra: {
                          'operationId': operation.id,
                          'isFromNotification': false,
                        },
                      ),
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                child: OperationCard(
                  partnerOperation: operation,
                  onDelete:
                      () => OperationDeleteHelper.showDeleteConfirmation(
                        context,
                        operation.id!,
                      ),
                  onTap:
                      () => context.push(
                        RouterPath.showOperationsDetailsScreen,
                        extra: {
                          'operationId': operation.id,
                          'isFromNotification': false,
                        },
                      ),
                ),
              );
            }
          },
        );
      }, childCount: validOperations.length),
    );
  }
}
