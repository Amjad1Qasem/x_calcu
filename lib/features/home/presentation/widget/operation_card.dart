import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/global/components/x_calc/x_cal_card.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/x_calc/operation_type.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/functions/format_time.dart';

// Operation Card Widget
class OperationCard extends StatelessWidget {
  const OperationCard({super.key, required this.onTap, this.operation});
  final Function()? onTap;
  final OperationModel? operation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 2.w),
      child: XCalCard(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 13.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: operation!.notes != null,
              child: Column(
                children: [
                  Text(
                    operation?.notes ?? '',
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
    final isInput = operation?.operationType?.toLowerCase() == 'input';
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
              operation?.totalDue?.toStringAsFixed(0) ?? 'لا يوجد',
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
    final formattedDate = FormatTime.formatDateFromDateTime(
      DateTime.parse(operation?.operationDate ?? ''),
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(CupertinoIcons.person, size: 20.sp, color: Utils(context).primary),
        CommonSizes.hTheSmallestSpace,
        Text(
          operation?.clientName ?? 'لا يوجد',
          style: Utils(
            context,
          ).normalText.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        Spacer(),
        Visibility(
          visible: operation!.operationDate != null,
          child: Icon(
            Iconsax.calendar_edit_copy,
            size: 20.sp,
            color: Utils(context).primary,
          ),
        ),
        CommonSizes.hTheSmallestSpace,
        Visibility(
          visible: operation!.operationDate != null,
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
