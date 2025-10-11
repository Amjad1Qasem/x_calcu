import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_calcu/features/operations/cubit/delete_operation/delete_operation_cubit.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class OperationDeleteHelper {
  /// Show delete confirmation dialog for OperationModel
  static void showDeleteConfirmation(
    BuildContext context,
    int operationId, {
    Function()? onRefresh,
  }) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('delete_operation'.tr()),
            content: Text('delete_operation_confirmation'.tr()),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('cancel'.tr()),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _deleteOperation(context, operationId, onRefresh: onRefresh);
                },
                child: Text('delete'.tr(), style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }

  /// Delete operation and handle the result
  static void _deleteOperation(
    BuildContext context,
    int operationId, {
    Function()? onRefresh,
  }) {
    final operationsCubit = getIt<DeleteOperationCubit>();
    operationsCubit.deleteOperation(operationId: operationId);

    // Listen to the result with proper context checking
    operationsCubit.stream.listen((state) {
      if (!context.mounted) return; // Check if widget is still mounted

      if (state is Success) {
        snackBar(
          context: context,
          title: 'operation_deleted_successfully'.tr(),
          isErrorMessage: false,
        );
        // Refresh the operations list after successful deletion
        if (onRefresh != null) {
          onRefresh();
        }
      } else if (state is Error) {
        snackBar(context: context, title: state.message, isErrorMessage: true);
      }
    });
  }
}
