import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/operations/cubit/edit_operation/edit_operation_cubit.dart';
import 'package:x_calcu/features/operations/data/cubit_type.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/features/operations/presentation/widget/operations_fields_widget.dart';
import 'package:x_calcu/features/operations/presentation/widget/update_operation_widgets/save_update_operation_btn.dart';
import 'package:x_calcu/global/components/loaders/loading_overlay.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class EditOperationsScreen extends StatefulWidget {
  const EditOperationsScreen({
    super.key,
    this.isFromPartner,
    required this.operation,
  });

  final bool? isFromPartner;
  final OperationModel operation;

  @override
  State<EditOperationsScreen> createState() => _EditOperationsScreenState();
}

class _EditOperationsScreenState extends State<EditOperationsScreen> {
  late EditOperationCubit _editOperationCubit;

  @override
  void initState() {
    super.initState();
    _editOperationCubit = getIt<EditOperationCubit>();
    // Initialize the cubit with the operation data
    _editOperationCubit.initializeWithModel(widget.operation);
  }

  @override
  void dispose() {
    // Reset the cubit state when leaving the screen
    _editOperationCubit.resetState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EditOperationCubit, EditOperationState>(
        bloc: _editOperationCubit,
        listener: (context, state) {
          printWarning('state is :: $state');
          if (state.isLoading == true) {
            LoadingOverlay.of(context).show();
          } else if (state.isSuccess == true) {
            LoadingOverlay.of(context).hide();
            context.pop();
            context.pop();
            snackBar(
              context: context,
              title: 'operation_updated_successfully'.tr(),
              isErrorMessage: false,
            );
          } else if (state.isError == true) {
            LoadingOverlay.of(context).hide();
            snackBar(
              context: context,
              title: state.errorMessage,
              isErrorMessage: true,
            );
          }
        },
        builder: (context, state) {
          printWarning('builder state is :: $state');
          return Skaffold(
            isAppBarNull: false,
            isBack: true,
            title: 'edit_operation'.tr(),
            actions: [
              SaveUpdateOperationBtn(
                editOperationState: state,
                operationId: widget.operation.id!,
              ),
            ],
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OperationsFieldsWidget(
                    isFromPartner: widget.isFromPartner ?? false,
                    isReadOnly: false,
                    model: widget.operation,
                    cubitType: CubitType.edit,
                  ),
                  CommonSizes.vLargerSpace,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
