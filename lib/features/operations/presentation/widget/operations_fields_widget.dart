import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_calcu/features/operations/cubit/edit_operation/edit_operation_cubit.dart';
import 'package:x_calcu/features/operations/cubit/create_operation/create_operation_cubit.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/features/operations/data/cubit_type.dart';
import 'package:x_calcu/features/operations/presentation/widget/build_date_picker_field.dart';
import 'package:x_calcu/features/operations/presentation/widget/build_dynamic_field.dart';
import 'package:x_calcu/features/operations/presentation/widget/reminder_date_time_picker.dart';
import 'package:x_calcu/features/operations/presentation/widget/items_drop_down_menu.dart';
import 'package:x_calcu/features/operations/presentation/widget/percentage_calculation_widget%20.dart';
import 'package:x_calcu/global/components/form_label_widget.dart';
import 'package:x_calcu/global/components/text_field_app.dart';
import 'package:x_calcu/global/components/x_calc/toggle_widget.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/utils/validation/input_validators.dart';
import 'package:x_calcu/global/components/validation_error_display.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import '../../../../../global/utils/di/dependency_injection.dart';

class OperationsFieldsWidget extends StatelessWidget {
  final bool isFromPartner;
  final bool isReadOnly;
  final OperationModel? model;
  final CubitType cubitType;
  final CreateOperationCubit? createOperationCubit;

  const OperationsFieldsWidget({
    super.key,
    required this.isFromPartner,
    this.isReadOnly = false,
    this.model,
    this.cubitType = CubitType.create, // Only supports create and edit modes
    this.createOperationCubit,
  });

  @override
  Widget build(BuildContext context) {
    // Get the appropriate cubit based on the type
    final cubit = _getCubit();

    // Only initialize if we have a model and the cubit doesn't have operation data
    if (model != null && cubitType == CubitType.edit) {
      final editCubit = cubit as EditOperationCubit;
      if (editCubit.state.operation == null) {
        editCubit.initializeWithModel(model!);
      }
    }

    return _buildForm(context, cubit);
  }

  dynamic _getCubit() {
    switch (cubitType) {
      case CubitType.edit:
        return getIt<EditOperationCubit>();
      case CubitType.create:
        return createOperationCubit ?? getIt<CreateOperationCubit>();
      default:
        throw ArgumentError(
          'OperationsFieldsWidget only supports edit and create modes',
        );
    }
  }

  Widget _buildForm(BuildContext context, dynamic cubit) {
    switch (cubitType) {
      case CubitType.edit:
        return _buildEditForm(context, cubit as EditOperationCubit);
      case CubitType.create:
        return _buildCreateForm(context, cubit as CreateOperationCubit);
      default:
        throw ArgumentError(
          'OperationsFieldsWidget only supports edit and create modes',
        );
    }
  }

  Widget _buildEditForm(BuildContext context, EditOperationCubit cubit) {
    return BlocBuilder<EditOperationCubit, EditOperationState>(
      bloc: cubit,
      builder: (context, state) {
        return Form(
          key: cubit.editOperationKey,
          child: _buildFields(context, cubit),
        );
      },
    );
  }

  Widget _buildCreateForm(BuildContext context, CreateOperationCubit cubit) {
    return BlocBuilder<CreateOperationCubit, CreateOperationState>(
      bloc: cubit,
      builder: (context, state) {
        return Form(
          key: cubit.createOperationKey,
          child: _buildFields(context, cubit),
        );
      },
    );
  }

  Widget _buildFields(BuildContext context, dynamic cubit) {
    return Column(
      children: [
        // Show validation errors summary if there are any
        if (cubit?.validationErrors?.isNotEmpty == true)
          ValidationErrorDisplay(validationErrors: cubit.validationErrors),

        // Show partner dropdown only when not from partner
        if (!isFromPartner)
          ItemsDropDownMenu(
            label: 'partner_name'.tr(),
            controller: cubit?.partnerNameController,
            onChanged: isReadOnly ? null : (model) {},
            readOnly: isReadOnly,
            cubitType: cubitType,
            operationsCubit: cubit,
          ),

        // Show partner name as read-only field when from partner
        if (isFromPartner) _buildPartnerNameField(context, cubit),

        FormLabelWidget(label: "customer_name"),
        TextFieldApp(
          hintText: '',
          controller: cubit?.customerController,
          readOnly: isReadOnly,
          enable: !isReadOnly,
          errorText: cubit?.getFieldError('customer_name'),
          validation:
              isReadOnly
                  ? null
                  : (value) => InputValidators.validateRequired(
                    value,
                    fieldName: 'customer_name'.tr(),
                  ),
        ),

        FormLabelWidget(label: "operation_type"),
        CommonSizes.vSmallestSpace,
        IgnorePointer(
          ignoring: isReadOnly,
          child: ToggleWidget(
            values: ["input".tr(), "output".tr()],
            state: cubit != null ? !cubit.isOutput : false,
            onTap: cubit?.toggleOperationType,
          ),
        ),
        CommonSizes.vSmallestSpace,

        FormLabelWidget(label: "invoice_number"),
        TextFieldApp(
          hintText: '',
          controller: cubit?.invoiceNumberController,
          keyboardType: TextInputType.text,
          readOnly: isReadOnly,
          enable: !isReadOnly,
          errorText: cubit?.getFieldError('invoice_number'),
          validation:
              isReadOnly
                  ? null
                  : (value) => InputValidators.validateRequired(
                    value,
                    fieldName: 'invoice_number'.tr(),
                  ),
        ),

        FormLabelWidget(label: "invoice_value"),
        TextFieldApp(
          hintText: '',
          controller: cubit?.invoiceValueController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          readOnly: isReadOnly,
          enable: !isReadOnly,
          errorText: cubit?.getFieldError('invoice_value'),
          validation:
              isReadOnly
                  ? null
                  : (value) =>
                      InputValidators.validateNumeric(value, isRequired: true),
          onChanged: (value) {
            // Trigger auto-calculations when invoice value changes
            if (cubit != null) {
              printSuccess('Invoice value changed to: $value');
              cubit.triggerAllCalculations();
            }
          },
        ),

        // FormLabelWidget(label: "paid_amount"),
        buildDynamicPaymentField(
          context: context,
          paidBills: cubit?.paidBills ?? [],
          onPaidBillsChanged: (newPaidBills) {
            if (cubit != null) {
              cubit.updatePaidBills(newPaidBills);
            }
          },
          isReadOnly: isReadOnly,
        ),

        FormLabelWidget(label: "remaining_invoice"),
        TextFieldApp(
          hintText: '',
          controller: cubit?.remainingInvoiceController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          readOnly: true, // Make it read-only for auto-calculation
          enable: false,
          errorText: cubit?.getFieldError('remaining_invoice'),
        ),

        FormLabelWidget(label: "percentage"),
        PercentageCalculationField(
          valueController: cubit?.percentageAmountController,
          percentageController: cubit?.percentageController,
          baseValue:
              double.tryParse(cubit?.paidAmountController.text ?? '0') ?? 0,
          isReadOnly: isReadOnly,
          errorText: cubit?.getFieldError('percentage_of_bill'),
          onPercentageChanged: () {
            // Trigger auto-calculations when percentage changes
            if (cubit != null) {
              printSuccess('Percentage changed, triggering calculations...');
              cubit.triggerAllCalculations();
            }
          },
        ),

        FormLabelWidget(label: "total_due"),
        TextFieldApp(
          hintText: '',
          controller: cubit?.totalDueController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          readOnly: true, // Make it read-only for auto-calculation
          enable: false,
          errorText: cubit?.getFieldError('total_due'),
        ),
        // FormLabelWidget(label: "received_amount"),
        buildDynamicReceivedField(
          context: context,
          receivedAmounts: cubit?.receivedAmounts ?? [],
          onReceivedAmountsChanged: (newReceivedAmounts) {
            if (cubit != null) {
              cubit.updateReceivedAmounts(newReceivedAmounts);
            }
          },
          isReadOnly: isReadOnly,
        ),

        FormLabelWidget(label: "remaining_amount"),
        TextFieldApp(
          hintText: '',
          controller: cubit?.remainingAmountController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          readOnly: true, // Make it read-only for auto-calculation
          enable: false,
          errorText: cubit?.getFieldError('remaining_amount'),
        ),

        FormLabelWidget(label: "operation_date"),
        buildDatePickerField(
          context: context,
          controller: cubit?.operationDateController,
          isReadOnly: isReadOnly,
          errorDateText: cubit?.getFieldError('invoice_date'),
          validation:
              isReadOnly
                  ? null
                  : (value) => InputValidators.validateRequired(
                    value,
                    fieldName: 'operation_date'.tr(),
                  ),
        ),

        FormLabelWidget(label: "reminder_date", required: false),
        buildReminderDateTimePicker(
          context: context,
          cubit: cubit,
          cubitType: cubitType,
          isReadOnly: isReadOnly,
          errorDateText: cubit?.getFieldError('alert_date'),
        ),
        FormLabelWidget(label: "notes", required: false),
        TextFieldApp(
          hintText: '',
          controller: cubit?.notesController,
          maxLines: 6,
          readOnly: isReadOnly,
          enable: !isReadOnly,
          errorText: cubit?.getFieldError('comments'),
          // No validation for notes field as it's optional
        ),
      ],
    );
  }

  /// Builds a read-only partner name field when isFromPartner is true
  Widget _buildPartnerNameField(BuildContext context, dynamic cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormLabelWidget(label: 'partner_name'.tr()),
        CommonSizes.vSmallestSpace,
        TextFieldApp(
          hintText: '',
          controller: cubit?.partnerNameController,
          readOnly: true,
          enable: false,
          errorText: cubit?.getFieldError('partner_name'),
        ),
      ],
    );
  }
}
