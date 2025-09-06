import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/operations/cubit/operations/operations_cubit.dart';
import 'package:x_calcu/features/operations/presentation/widget/view.dart';
import 'package:x_calcu/global/components/loaders/loading_widget.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/components/utils/empty_list_widget.dart';
import 'package:x_calcu/global/components/utils/error_widget_screen.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class ShowOperationsDetailsScreen extends StatefulWidget {
  const ShowOperationsDetailsScreen({super.key, required this.operationId});
  final int operationId;

  @override
  State<ShowOperationsDetailsScreen> createState() =>
      _ShowOperationsDetailsScreenState();
}

class _ShowOperationsDetailsScreenState
    extends State<ShowOperationsDetailsScreen> {
  late OperationsCubit _operationsCubit;

  @override
  void initState() {
    super.initState();
    _operationsCubit = getIt<OperationsCubit>();
    _operationsCubit.getOperationDetails(operationId: widget.operationId);
  }

  @override
  Widget build(BuildContext context) {
    return Skaffold(
      isAppBarNull: false,
      isBack: true,
      title: 'operation_details'.tr(),
      actions: [_EditBtn(operationsCubit: _operationsCubit)],
      body: BlocBuilder<OperationsCubit, OperationsState>(
        bloc: _operationsCubit,
        builder: (context, state) {
          // Loading state
          if (state.isLoading == true) {
            return const LoadingWidget();
          }

          // Error state
          if (state.isError == true) {
            return ErrorWidgetScreen(
              message: 'error_loading_operation'.tr(),
              subMessage: 'we_faces_some_issues'.tr(),
              onRetry: () {
                _operationsCubit.getOperationDetails(
                  operationId: widget.operationId,
                );
              },
            );
          }

          // Success state with data
          if (state.operation != null) {
            return _buildSuccessState(state);
          }

          // Empty state (no data)
          return EmptyListWidget(message: 'no_operation_found'.tr());
        },
      ),
    );
  }

  Widget _buildSuccessState(OperationsState state) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ViewWidget(
            isFromPartner: false,
            isReadOnly: true,
            model: state.operation,
          ),
        ],
      ),
    );
  }
}

class _EditBtn extends StatelessWidget {
  const _EditBtn({super.key, required OperationsCubit operationsCubit})
    : _operationsCubit = operationsCubit;

  final OperationsCubit _operationsCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationsCubit, OperationsState>(
      bloc: _operationsCubit,
      builder: (context, state) {
        // Only show edit button if we have data and not in loading state
        if (state.isLoading == true || state.operation == null) {
          return const SizedBox.shrink();
        }

        return GestureDetector(
          onTap: () {
            // Pass the operation data to edit screen
            context.push(
              RouterPath.editOperationsScreen,
              extra: state.operation,
            );
          },
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 12.sp),
            child: Text(
              'edit'.tr(),
              style: Utils(context).normalText.copyWith(
                color: Utils(context).secondary,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ),
        );
      },
    );
  }
}
