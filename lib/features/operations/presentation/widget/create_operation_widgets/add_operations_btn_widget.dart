import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_calcu/features/operations/cubit/create_operation/create_operation_cubit.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/navigation/navigation_helper.dart';

class AddOperationsBtnWidget extends StatelessWidget {
  const AddOperationsBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final createOperationCubit = getIt<CreateOperationCubit>();

    return BlocConsumer<CreateOperationCubit, CreateOperationState>(
      bloc: createOperationCubit,
      listenWhen: _shouldListen,
      buildWhen: _shouldBuild,
      listener:
          (context, state) =>
              _handleStateChanges(context, state, createOperationCubit),
      builder:
          (context, state) =>
              _buildButtons(context, state, createOperationCubit),
    );
  }

  /// Determines when to listen to state changes
  bool _shouldListen(
    CreateOperationState previous,
    CreateOperationState current,
  ) {
    return previous.isLoading != current.isLoading ||
        previous.isSuccess != current.isSuccess ||
        previous.isError != current.isError;
  }

  /// Determines when to rebuild the widget
  bool _shouldBuild(
    CreateOperationState previous,
    CreateOperationState current,
  ) {
    return previous.isLoading != current.isLoading ||
        previous.isSuccess != current.isSuccess ||
        previous.isError != current.isError;
  }

  /// Handles state changes and navigation
  void _handleStateChanges(
    BuildContext context,
    CreateOperationState state,
    CreateOperationCubit cubit,
  ) {
    if (state.isSuccess) {
      _handleSuccess(context, cubit);
    } else if (state.isError) {
      _handleError(context, state, cubit);
    }
  }

  /// Handles successful operation creation
  void _handleSuccess(BuildContext context, CreateOperationCubit cubit) {
    snackBar(
      context: context,
      title: 'operation_created_successfully'.tr(),
      isErrorMessage: false,
    );

    cubit.resetState();
    _navigateToHome(context);
  }

  /// Handles operation creation errors
  void _handleError(
    BuildContext context,
    CreateOperationState state,
    CreateOperationCubit cubit,
  ) {
    final errorMessage = _getErrorMessage(state, cubit);
    snackBar(context: context, title: errorMessage, isErrorMessage: true);
  }

  /// Gets the appropriate error message
  String _getErrorMessage(
    CreateOperationState state,
    CreateOperationCubit cubit,
  ) {
    if (cubit.validationErrors.isNotEmpty) {
      final firstError = cubit.validationErrors.values.first;
      if (firstError is List && firstError.isNotEmpty) {
        return firstError.first.toString();
      }
    }

    if (state.errorMessage.isNotEmpty) {
      return state.errorMessage;
    }

    return 'failed_to_create_operation'.tr();
  }

  /// Navigates to home screen
  void _navigateToHome(BuildContext context) {
    NavigationHelper.goToHome(context);
  }

  /// Builds the button widgets
  Widget _buildButtons(
    BuildContext context,
    CreateOperationState state,
    CreateOperationCubit cubit,
  ) {
    return Column(
      children: [
        _buildTestDataButton(context, state, cubit),
        const SizedBox(height: 12),
        _buildAddButton(context, state, cubit),
      ],
    );
  }

  /// Builds the test data button
  Widget _buildTestDataButton(
    BuildContext context,
    CreateOperationState state,
    CreateOperationCubit cubit,
  ) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: state.isLoading ? null : () => _fillTestData(context, cubit),
        icon: const Icon(Icons.science, size: 18),
        label: Text('fill_test_data'.tr()),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.orange,
          side: const BorderSide(color: Colors.orange),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  /// Builds the main add button
  Widget _buildAddButton(
    BuildContext context,
    CreateOperationState state,
    CreateOperationCubit cubit,
  ) {
    return AppButton(
      label: state.isLoading ? 'creating_operation'.tr() : 'add'.tr(),
      loading: state.isLoading,
      disable: state.isLoading,
      onTap: state.isLoading ? null : () => _handleAddOperation(context, cubit),
    );
  }

  /// Fills test data and shows success message
  void _fillTestData(BuildContext context, CreateOperationCubit cubit) {
    cubit.fillTestData();
    snackBar(
      context: context,
      title: 'test_data_filled'.tr(),
      isErrorMessage: false,
    );
  }

  /// Handles add operation button tap
  void _handleAddOperation(BuildContext context, CreateOperationCubit cubit) {
    if (_isFormValid(cubit)) {
      cubit.clearValidationErrors();
      cubit.createOperation();
    } else {
      _showValidationError(context);
    }
  }

  /// Checks if the form is valid
  bool _isFormValid(CreateOperationCubit cubit) {
    return cubit.createOperationKey.currentState?.validate() ?? false;
  }

  /// Shows validation error message
  void _showValidationError(BuildContext context) {
    snackBar(
      context: context,
      title: 'please_fill_all_required_fields'.tr(),
      isErrorMessage: true,
    );
  }
}
