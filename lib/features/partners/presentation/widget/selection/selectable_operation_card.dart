import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/partners/cubit/selection/selection_cubit.dart';
import 'package:x_calcu/features/partners/data/models/partner_details_model.dart';
import 'package:x_calcu/global/components/x_calc/x_cal_card.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/x_calc/operation_type.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/functions/format_time.dart';

class SelectableOperationCard extends StatelessWidget {
  final PartnerDetailsOperation operation;
  final Function()? onTap;

  const SelectableOperationCard({
    super.key,
    required this.operation,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectionCubit, SelectionState>(
      builder: (context, state) {
        final isSelectionMode = state.maybeWhen(
          selectionMode: () => true,
          selectionActive: (_) => true,
          orElse: () => false,
        );

        final isSelected = state.maybeWhen(
          selectionActive:
              (selectedItems) =>
                  selectedItems.any((item) => item.id == operation.id),
          orElse: () => false,
        );

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 0.w),

          child: GestureDetector(
            onTap: () {
              if (isSelectionMode) {
                // Toggle selection
                context.read<SelectionCubit>().toggleItemSelection(operation);
              } else {
                // Normal tap behavior
                onTap?.call();
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                // border: Border.all(
                //   color: isSelected ? Colors.green : Colors.transparent,
                //   width: isSelected ? 2.5 : 0,
                // ),
                // boxShadow:
                //     isSelected
                //         ? [
                //           BoxShadow(
                //             color: Colors.green.withValues(alpha: 0.2),
                //             blurRadius: 8,
                //             spreadRadius: 1,
                //             offset: const Offset(0, 2),
                //           ),
                //         ]
                //         : null,
              ),
              child: Stack(
                children: [
                  XCalCard(
                    shadow: isSelected ? true : false,
                    radius: 16.r,
                    padding: EdgeInsets.symmetric(
                      vertical: 15.h,
                      horizontal: 13.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Notes section
                        if (operation.notes != null &&
                            operation.notes!.isNotEmpty) ...[
                          Text(
                            operation.notes!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Utils(
                              context,
                            ).normalText.copyWith(fontWeight: FontWeight.w500),
                          ),
                          CommonSizes.vSmallestSpace,
                        ],

                        // Type and amount
                        _buildTypeAndAmount(context),
                        CommonSizes.vSmallestSpace,

                        // Name and date
                        _buildNameAndDate(context),
                        CommonSizes.vPluSmallerSpace,

                        // Show details button (only when not in selection mode)
                        if (!isSelectionMode)
                          AppButton(
                            onTap: onTap,
                            label: "show_details".tr(),
                            icon: Iconsax.eye_copy,
                            padding: EdgeInsets.zero,
                            raduis: 16.r,
                            textStyle: Utils(context).buttonText.copyWith(
                              color: Utils(context).secondTextColor,
                            ),
                            color: Utils(context).primaryContainer,
                          ),
                      ],
                    ),
                  ),
                  CommonSizes.hSmallestSpace,
                  // Modern Selection indicator
                  if (isSelectionMode)
                    PositionedDirectional(
                      top: 10.h,
                      end: 10.w,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: 24.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.green : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color:
                                isSelected
                                    ? Colors.green
                                    : Colors.grey.withValues(alpha: 0.4),
                            width: 2.5,
                          ),
                          boxShadow:
                              isSelected
                                  ? [
                                    BoxShadow(
                                      color: Colors.green.withValues(
                                        alpha: 0.3,
                                      ),
                                      blurRadius: 6,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                  : null,
                        ),
                        child:
                            isSelected
                                ? Icon(
                                  Icons.check_rounded,
                                  size: 14.sp,
                                  color: Colors.white,
                                )
                                : Icon(
                                  Icons.circle_outlined,
                                  size: 14.sp,
                                  color: Colors.grey.withValues(alpha: 0.6),
                                ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTypeAndAmount(BuildContext context) {
    final operationType = operation.operationType;
    final isInput = operationType?.toLowerCase() == 'input';
    final dueAmount = operation.dueAmount;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OperationType(
          type:
              isInput
                  ? OperationTypeEnum.inputOperation
                  : OperationTypeEnum.outputOperation,
        ),
        CommonSizes.hSmallestSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Amount due: ', style: Utils(context).normalText),
            Text(
              dueAmount?.toStringAsFixed(0) ?? 'لا يوجد',
              style: Utils(context).normalText.copyWith(
                fontWeight: FontWeight.w700,
                color: Utils(context).primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNameAndDate(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Iconsax.user_copy,
                size: 20.sp,
                color: Utils(context).primary,
              ),
              CommonSizes.hTheSmallestSpace,
              Expanded(
                child: Text(
                  operation.clientName ?? 'Unknown Client',
                  overflow: TextOverflow.ellipsis,
                  style: Utils(context).normalText.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        CommonSizes.hSmallerSpace,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Iconsax.calendar_1_copy,
              size: 20.sp,
              color: Utils(context).primary,
            ),
            CommonSizes.hTheSmallestSpace,
            Text(
              operation.date != null
                  ? FormatTime.formatDate(operation.date!)
                  : 'No date',
              overflow: TextOverflow.ellipsis,
              style: Utils(context).normalText.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
