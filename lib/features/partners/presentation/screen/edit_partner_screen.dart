import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/operations/data/cubit_type.dart';
import 'package:x_calcu/features/partners/cubit/edit_partner/edit_partner_cubit.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/features/partners/presentation/widget/partner_form_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/edit_partner_btn_widget.dart';
import 'package:x_calcu/global/components/loaders/loading_overlay.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class EditPartnerScreen extends StatefulWidget {
  const EditPartnerScreen({super.key, required this.partner});

  final PartnerModel partner;

  @override
  State<EditPartnerScreen> createState() => _EditPartnerScreenState();
}

class _EditPartnerScreenState extends State<EditPartnerScreen> {
  late EditPartnerCubit _editPartnerCubit;

  @override
  void initState() {
    super.initState();
    _editPartnerCubit = getIt<EditPartnerCubit>();
    // Initialize the cubit with the partner data
    _editPartnerCubit.initializeWithModel(widget.partner);
  }

  @override
  void dispose() {
    // Reset the cubit state when leaving the screen
    _editPartnerCubit.resetState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Skaffold(
      isAppBarNull: false,
      isBack: true,
      title: 'edit_partner'.tr(),
      body: BlocConsumer<EditPartnerCubit, EditPartnerState>(
        bloc: _editPartnerCubit,
        listener: (context, state) {
          printWarning('EditPartnerScreen state: $state');

          if (state.isLoading == true) {
            LoadingOverlay.of(context).show();
          } else if (state.isSuccess == true) {
            LoadingOverlay.of(context).hide();
            context.pop();
            showSuccessSnackBar(
              context: context,
              title: 'partner_updated_successfully'.tr(),
              subtitle: 'partner_updated_in_list'.tr(),
            );
          } else if (state.isError == true) {
            LoadingOverlay.of(context).hide();
            String errorMessage = 'failed_to_update_partner'.tr();

            // Check if we have validation errors
            if (_editPartnerCubit.validationErrors.isNotEmpty) {
              // Show the first validation error as the main message
              final firstError =
                  _editPartnerCubit.validationErrors.values.first;
              if (firstError is List && firstError.isNotEmpty) {
                errorMessage = firstError.first.toString();
              }
            } else if (state.errorMessage.isNotEmpty) {
              errorMessage = state.errorMessage;
            }

            showErrorSnackBar(
              context: context,
              title: errorMessage,
              subtitle: 'please_check_input_and_try_again'.tr(),
            );
          }
        },
        builder: (context, state) {
          printWarning('EditPartnerScreen builder state: $state');
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PartnerFormWidget(
                  cubitType: CubitType.edit,
                  cubit: _editPartnerCubit,
                ),
                CommonSizes.vLargerSpace,
                EditPartnerBtnWidget(
                  editPartnerState: state,
                  partnerId: widget.partner.id!,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
