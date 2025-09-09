import 'package:flutter/cupertino.dart';
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
class OperationCard extends StatelessWidget {
  const OperationCard({
    super.key,
    required this.onTap,
    this.operation,
    this.partnerOperation,
  });
  final Function()? onTap;
  final OperationModel? operation;
  final PartnerDetailsOperation? partnerOperation;

  @override
  Widget build(BuildContext context) {
    final currentOperation = partnerOperation ?? operation;
    final notes = partnerOperation?.notes ?? operation?.notes;
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
            AppButton(
              onTap: onTap,
              label: 'Show details',
              icon: Iconsax.eye_copy,
              padding: EdgeInsets.zero,
              raduis: 16.r,
              textStyle: Utils(
                context,
              ).buttonText.copyWith(color: Utils(context).secondTextColor),
              color: Utils(context).primaryContainer,
            ),
          ],
        ),
      ),
    );
  }

  Row typeAndAmount(BuildContext context) {
    final currentOperation = partnerOperation ?? operation;
    final operationType =
        partnerOperation?.operationType ?? operation?.operationType;
    final isInput = operationType?.toLowerCase() == 'input';
    final dueAmount = partnerOperation?.dueAmount ?? operation?.totalDue;

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
    final currentOperation = partnerOperation ?? operation;
    final clientName = partnerOperation?.clientName ?? operation?.clientName;
    final operationDate = partnerOperation?.date ?? operation?.operationDate;

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
          clientName ?? 'لا يوجد',
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
