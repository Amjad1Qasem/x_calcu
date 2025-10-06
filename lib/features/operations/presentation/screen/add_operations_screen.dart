import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/operations/cubit/create_operation/create_operation_cubit.dart';
import 'package:x_calcu/features/operations/data/cubit_type.dart';
import 'package:x_calcu/features/operations/presentation/widget/create_operation_widgets/add_operations_btn_widget.dart';
import 'package:x_calcu/features/operations/presentation/widget/operations_fields_widget.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/global/components/auth_guard.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/navigation/navigation_helper.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class AddOperationsScreen extends StatefulWidget {
  const AddOperationsScreen({super.key, this.isFromPartner, this.partner});
  final bool? isFromPartner;
  final PartnerModel? partner;

  @override
  State<AddOperationsScreen> createState() => _AddOperationsScreenState();
}

class _AddOperationsScreenState extends State<AddOperationsScreen> {
  late CreateOperationCubit _createOperationCubit;

  @override
  void initState() {
    super.initState();
    _createOperationCubit = getIt<CreateOperationCubit>();

    // Set partner data if provided
    if (widget.partner != null) {
      _createOperationCubit.setSelectedPartner(
        widget.partner!.id!,
        widget.partner!.name!,
      );
    }

    // Reset state to clear any previous data (preserve partner if provided)
    _createOperationCubit.resetState(preservePartner: widget.partner != null);
  }

  @override
  void dispose() {
    // Don't reset state in dispose to preserve partner selection
    // The cubit will be reset when needed (e.g., after successful operation creation)
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthGuard(
      child: BlocConsumer<CreateOperationCubit, CreateOperationState>(
        bloc: _createOperationCubit,
        listener: (context, state) {
          if (state.isLoading) {
          } else if (state.isSuccess) {
            snackBar(
              context: context,
              title: 'operation_created_successfully'.tr(),
              isErrorMessage: false,
            );
            // Navigate back to home - use go instead of pop to avoid navigation stack issues

            NavigationHelper.goToHome(context);
          } else if (state.isError) {
            snackBar(
              context: context,
              title:
                  state.errorMessage.isNotEmpty
                      ? state.errorMessage
                      : 'failed_to_create_operation'.tr(),
              isErrorMessage: true,
            );
          }
        },
        builder: (context, state) {
          return Skaffold(
            isAppBarNull: false,
            isBack: widget.isFromPartner != true ? false : true,
            title: 'add_operation'.tr(),
            actions:
                widget.isFromPartner != true
                    ? [
                      GestureDetector(
                        onTap: () => context.push(RouterPath.addPartnerScreen),
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(end: 12.sp),
                          child: Text(
                            'add_partner'.tr(),
                            style: Utils(context).normalText.copyWith(
                              color: Utils(context).secondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ]
                    : null,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OperationsFieldsWidget(
                    isFromPartner: widget.isFromPartner ?? false,
                    isReadOnly: false,
                    cubitType: CubitType.create,
                    createOperationCubit: _createOperationCubit,
                  ),
                  AddOperationsBtnWidget(
                    createOperationCubit: _createOperationCubit,
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
