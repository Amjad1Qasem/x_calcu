import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_calcu/features/operations/cubit/create_operation/create_operation_cubit.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/loaders/loading_overlay.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/global/utils/router/navigation_extension.dart';

class AddOperationsBtnWidget extends StatelessWidget {
  const AddOperationsBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final createOperationCubit = getIt<CreateOperationCubit>();

    return BlocConsumer<CreateOperationCubit, CreateOperationState>(
      bloc: createOperationCubit,
      listener: (context, state) {
        // Handle loading state
        if (state.isLoading) {
          LoadingOverlay.of(context).show();
        }
        // Handle success state
        if (state.isSuccess) {
          LoadingOverlay.of(context).hide();
          snackBar(
            context: context,
            title: 'operation_created_successfully'.tr(),
            isErrorMessage: false,
          );

          context.pop(); // Uncomment if you want to navigate back
        }

        // Handle error state
        if (state.isError) {
          LoadingOverlay.of(context).hide();
          String errorMessage = 'failed_to_create_operation'.tr();

          // Check if we have validation errors
          if (createOperationCubit.validationErrors.isNotEmpty) {
            // Show the first validation error as the main message
            final firstError =
                createOperationCubit.validationErrors.values.first;
            if (firstError is List && firstError.isNotEmpty) {
              errorMessage = firstError.first.toString();
            }
          } else if (state.errorMessage.isNotEmpty) {
            errorMessage = state.errorMessage;
          }

          snackBar(context: context, title: errorMessage, isErrorMessage: true);
        }
      },
      builder: (context, state) {
        return AppButton(
          label: state.isLoading ? 'creating_operation'.tr() : 'add'.tr(),
          loading: state.isLoading,
          disable: state.isLoading,
          onTap:
              state.isLoading
                  ? null
                  : () {
                    // Validate form before submission
                    if (createOperationCubit.createOperationKey.currentState
                            ?.validate() ==
                        true) {
                      // Clear previous errors
                      createOperationCubit.clearValidationErrors();

                      // Create the operation (notification scheduling is now handled in the cubit)
                      createOperationCubit.createOperation();
                    } else {
                      // Show validation error
                      snackBar(
                        context: context,
                        title: 'please_fill_all_required_fields'.tr(),
                        isErrorMessage: true,
                      );
                    }
                  },
        );
      },
    );
  }
}
