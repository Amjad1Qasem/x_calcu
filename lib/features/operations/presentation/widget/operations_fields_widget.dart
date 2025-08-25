import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_calcu/features/operations/cubit/operations/operations_cubit.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/features/operations/presentation/widget/build_date_picker_field.dart';
import 'package:x_calcu/features/operations/presentation/widget/build_dynamic_field.dart';
import 'package:x_calcu/features/operations/presentation/widget/build_reminder_date_picker_field.dart';
import 'package:x_calcu/features/operations/presentation/widget/items_drop_down_menu.dart';
import 'package:x_calcu/features/operations/presentation/widget/percentage_calculation_widget%20.dart';
import 'package:x_calcu/global/components/form_label_widget.dart';
import 'package:x_calcu/global/components/text_field_app.dart';
import 'package:x_calcu/global/components/x_calc/toggle_widget.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import '../../../../../global/utils/di/dependency_injection.dart';

class OperationsFieldsWidget extends StatelessWidget {
  final bool isFromPartner;
  final bool isReadOnly;
  final OperationModel? model;

  const OperationsFieldsWidget({
    super.key,
    required this.isFromPartner,
    this.isReadOnly = false,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<OperationsCubit>();
    if (model != null) cubit.initializeWithModel(model!);

    return BlocBuilder<OperationsCubit, OperationsState>(
      bloc: cubit,
      builder: (context, state) {
        return Form(
          key: cubit.addOperationsKey,
          child: Column(
            children: [
              if (!isFromPartner)
                ItemsDropDownMenu(
                  label: 'partner_name'.tr(),
                  controller: cubit.operationTypeController,
                  onChanged: isReadOnly ? null : (model) {},
                ),

              FormLabelWidget(label: "customer_name"),
              TextFieldApp(
                hintText: '',
                controller: cubit.customerController,
                readOnly: isReadOnly,
                enable: !isReadOnly,
              ),

              FormLabelWidget(label: "operation_type"),
              CommonSizes.vSmallestSpace,
              IgnorePointer(
                ignoring: isReadOnly,
                child: ToggleWidget(
                  values: ["input".tr(), "output".tr()],
                  state: !cubit.isOutput,
                  onTap: cubit.toggleOperationType,
                ),
              ),
              CommonSizes.vSmallestSpace,

              FormLabelWidget(label: "invoice_number"),
              TextFieldApp(
                hintText: '',
                controller: cubit.invoiceNumberController,
                keyboardType: TextInputType.number,
                readOnly: isReadOnly,
                enable: !isReadOnly,
              ),

              FormLabelWidget(label: "invoice_value"),
              TextFieldApp(
                hintText: '',
                controller: cubit.invoiceValueController,
                keyboardType: TextInputType.number,
                readOnly: isReadOnly,
                enable: !isReadOnly,
              ),

              FormLabelWidget(label: "paid_amount"),
              buildPaymentField(
                context: context,
                paidAmountController: cubit.paidAmountController,
                paidDateController: cubit.paidDateController,
                isReadOnly: isReadOnly,
              ),

              FormLabelWidget(label: "remaining_invoice"),
              TextFieldApp(
                hintText: '',
                controller: cubit.remainingInvoiceController,
                keyboardType: TextInputType.number,
                readOnly: true,
                enable: false,
              ),

              FormLabelWidget(label: "percentage"),
              PercentageCalculationField(
                valueController: cubit.percentageAmountController,
                percentageController: cubit.percentageController,
                baseValue:
                    double.tryParse(cubit.invoiceValueController.text) ?? 50,
                isReadOnly: isReadOnly,
              ),

              FormLabelWidget(label: "total_due"),
              TextFieldApp(
                hintText: '',
                controller: cubit.totalDueController,
                readOnly: true,
                enable: false,
              ),

              FormLabelWidget(label: "received_amount"),
              buildReceivedField(
                context: context,
                receivedAmountController: cubit.receivedAmountController,
                receivedDateController: cubit.receivedDateController,
                isReadOnly: isReadOnly,
              ),

              FormLabelWidget(label: "remaining_amount"),
              TextFieldApp(
                hintText: '',
                controller: cubit.remainingAmountController,
                readOnly: true,
                enable: false,
              ),

              FormLabelWidget(label: "operation_date"),
              buildDatePickerField(
                context: context,
                controller: cubit.operationDateController,
                isReadOnly: isReadOnly,
              ),

              FormLabelWidget(label: "reminder_date"),
              buildReminderDatePickerField(
                customerController: cubit.customerController,
                context: context,
                reminderController: cubit.reminderDateController,
                isReadOnly: isReadOnly,
              ),
              FormLabelWidget(label: "notes"),
              TextFieldApp(
                hintText: '',
                controller: cubit.notesController,
                maxLines: 4,
                readOnly: isReadOnly,
                enable: !isReadOnly,
              ),
            ],
          ),
        );
      },
    );
  }
}
