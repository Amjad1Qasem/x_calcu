import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/partners/cubit/add_partner/add_partner_cubit.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/loaders/loading_overlay.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class AddPartnerBtnWidget extends StatelessWidget {
  const AddPartnerBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final addPartnerCubit = getIt<AddPartnerCubit>();

    return BlocConsumer<AddPartnerCubit, AddPartnerState>(
      bloc: addPartnerCubit,
      listener: (context, state) {
        // Handle loading state
        if (state.isLoading == true) {
          LoadingOverlay.of(context).show();
        } else {
          LoadingOverlay.of(context).hide();
        }

        // Handle success state
        if (state.isSuccess == true) {
          showSuccessSnackBar(
            context: context,
            title: 'partner_created_successfully'.tr(),
            subtitle: 'partner_added_to_list'.tr(),
          );

          // Navigate back after successful creation
          context.pop();
        }

        // Handle error state
        if (state.isError == true) {
          String errorMessage = 'failed_to_create_partner'.tr();

          // Check if we have validation errors
          if (addPartnerCubit.validationErrors.isNotEmpty) {
            // Show the first validation error as the main message
            final firstError = addPartnerCubit.validationErrors.values.first;
            if (firstError is List && firstError.isNotEmpty) {
              errorMessage = firstError.first.toString();
            }
          } else {
            errorMessage = 'failed_to_create_partner'.tr();
          }

          showErrorSnackBar(
            context: context,
            title: errorMessage,
            subtitle: 'please_check_input_and_try_again'.tr(),
          );
        }
      },
      builder: (context, state) {
        return AppButton(
          label:
              (state.isLoading == true) ? 'creating_partner'.tr() : 'add'.tr(),
          loading: state.isLoading == true,
          disable: state.isLoading == true,
          onTap:
              (state.isLoading == true)
                  ? null
                  : () {
                    // Validate form before submission
                    if (addPartnerCubit.addPartnerFormKey.currentState
                            ?.validate() ==
                        true) {
                      // Clear previous errors
                      addPartnerCubit.clearValidationErrors();

                      // Create the partner
                      addPartnerCubit.addPartner();
                    } else {
                      // Show validation error
                      showErrorSnackBar(
                        context: context,
                        title: 'please_fill_all_required_fields'.tr(),
                        subtitle: 'partner_name_is_required'.tr(),
                      );
                    }
                  },
        );
      },
    );
  }
}
