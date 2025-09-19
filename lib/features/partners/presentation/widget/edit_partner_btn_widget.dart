import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_calcu/features/partners/cubit/edit_partner/edit_partner_cubit.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class EditPartnerBtnWidget extends StatelessWidget {
  final EditPartnerState editPartnerState;
  final int partnerId;

  const EditPartnerBtnWidget({
    super.key,
    required this.editPartnerState,
    required this.partnerId,
  });

  @override
  Widget build(BuildContext context) {
    final editPartnerCubit = getIt<EditPartnerCubit>();

    return BlocBuilder<EditPartnerCubit, EditPartnerState>(
      bloc: editPartnerCubit,

      builder: (context, state) {
        return AppButton(
          label:
              (state.isLoading == true)
                  ? 'updating_partner'.tr()
                  : 'update'.tr(),
          loading: state.isLoading == true,
          disable: state.isLoading == true,
          onTap:
              (state.isLoading == true)
                  ? null
                  : () {
                    // Validate form before submission
                    if (editPartnerCubit.editPartnerFormKey.currentState
                            ?.validate() ==
                        true) {
                      // Clear previous errors
                      editPartnerCubit.clearValidationErrors();

                      // Update the partner
                      editPartnerCubit.updatePartner(partnerId: partnerId);
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
