import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/features/partners/data/models/partner_details_model.dart';
import 'package:x_calcu/global/components/x_calc/x_cal_card.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/x_calc/operation_type.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/functions/format_time.dart';

// Operation Card Widget
class OperationCard extends StatefulWidget {
  const OperationCard({
    super.key,
    required this.onTap,
    this.onDelete,
    this.operation,
    this.partnerOperation,
  });
  final Function()? onTap;
  final Function()? onDelete;
  final OperationModel? operation;
  final PartnerDetailsOperation? partnerOperation;

  @override
  State<OperationCard> createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    final currentOperation = widget.partnerOperation ?? widget.operation;
    final notes = widget.partnerOperation?.notes ?? widget.operation?.notes;
    final isVisible = notes != null && notes.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 2.w),
      child: XCalCard(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 13.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: isVisible,
              child: Column(
                children: [
                  Text(
                    notes ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Utils(
                      context,
                    ).normalText.copyWith(fontWeight: FontWeight.w500),
                  ),
                  CommonSizes.vSmallestSpace,
                ],
              ),
            ),
            typeAndAmount(context),
            CommonSizes.vSmallestSpace,
            nameAnDate(context),
            CommonSizes.vPluSmallerSpace,
            _cardBtnsWidget(context, currentOperation),
          ],
        ),
      ),
    );
  }

  Widget _cardBtnsWidget(BuildContext context, Object? currentOperation) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            onTap: _isDeleting ? null : widget.onTap,
            label: 'show_details'.tr(),
            icon: Iconsax.eye_copy,
            padding: EdgeInsets.zero,
            raduis: 16.r,
            textStyle: Utils(
              context,
            ).buttonText.copyWith(color: Utils(context).secondTextColor),
            color: Utils(context).primaryContainer,
          ),
        ),

        CommonSizes.hSmallestSpace,
        if (currentOperation != null && widget.onDelete != null)
          GestureDetector(
            onTap: _isDeleting ? null : _handleDelete,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child:
                  _isDeleting
                      ? SizedBox(
                        width: 18.sp,
                        height: 18.sp,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                      )
                      : Icon(Iconsax.trash, size: 18.sp, color: Colors.red),
            ),
          ),
      ],
    );
  }

  void _handleDelete() async {
    if (_isDeleting) return;

    setState(() {
      _isDeleting = true;
    });

    try {
      // Call the onDelete callback
      if (widget.onDelete != null) {
        await widget.onDelete!();
      }
    } finally {
      if (mounted) {
        setState(() {
          _isDeleting = false;
        });
      }
    }
  }

  Row typeAndAmount(BuildContext context) {
    final operationType =
        widget.partnerOperation?.operationType ??
        widget.operation?.operationType;
    final isInput = operationType?.toLowerCase() == 'input';
    final dueAmount =
        widget.partnerOperation?.dueAmount ?? widget.operation?.totalDue;

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
            Text("${'amount_due'.tr()} :", style: Utils(context).normalText),
            Text(
              dueAmount?.toStringAsFixed(0) ?? 'no_data'.tr(),
              style: Utils(
                context,
              ).normalText.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Row nameAnDate(BuildContext context) {
    final clientName =
        widget.partnerOperation?.clientName ?? widget.operation?.clientName;
    final operationDate =
        widget.partnerOperation?.date ?? widget.operation?.operationDate;

    String formattedDate = '';
    if (operationDate != null && operationDate.isNotEmpty) {
      try {
        formattedDate = FormatTime.formatDateFromDateTime(
          DateTime.parse(operationDate),
        );
      } catch (e) {
        formattedDate = operationDate;
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(CupertinoIcons.person, size: 20.sp, color: Utils(context).primary),
        CommonSizes.hTheSmallestSpace,
        Text(
          clientName ?? 'no_data'.tr(),
          style: Utils(
            context,
          ).normalText.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        Spacer(),
        Visibility(
          visible: operationDate != null && operationDate.isNotEmpty,
          child: Icon(
            Iconsax.calendar_edit_copy,
            size: 20.sp,
            color: Utils(context).primary,
          ),
        ),
        CommonSizes.hTheSmallestSpace,
        Visibility(
          visible: operationDate != null && operationDate.isNotEmpty,
          child: Text(
            formattedDate,
            style: Utils(
              context,
            ).normalText.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
