import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/operations/cubit/edit_operation/edit_operation_cubit.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class SaveUpdateOperationBtn extends StatelessWidget {
  const SaveUpdateOperationBtn({
    super.key,
    required this.editOperationState,
    required this.operationId,
  });

  final int operationId;
  final EditOperationState editOperationState;

  @override
  Widget build(BuildContext context) {
    printSuccess(
      'editOperationState.isLoading ${editOperationState.isLoading}',
    );
    return GestureDetector(
      onTap:
          editOperationState.isLoading == true
              ? null
              : () {
                printSuccess(
                  'editOperationState.isLoading ${editOperationState.isLoading}',
                );

                // Get the EditOperationCubit instance
                final editCubit = getIt<EditOperationCubit>();

                // Validate the form before updating
                if (editCubit.editOperationKey.currentState?.validate() ==
                    true) {
                  editCubit.updateOperation(operationId: operationId);
                } else {
                  printWarning('Form validation failed');
                }
              },
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 12.sp),
        child:
            editOperationState.isLoading == true
                ? SizedBox(
                  width: 20.sp,
                  height: 20.sp,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Utils(context).secondary,
                    ),
                  ),
                )
                : Text(
                  'save'.tr(),
                  style: Utils(context).normalText.copyWith(
                    color: Utils(context).secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
      ),
    );
  }
}
