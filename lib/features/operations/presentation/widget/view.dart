import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/features/operations/data/cubit_type.dart';
import 'package:x_calcu/features/operations/presentation/widget/build_date_picker_field.dart';
import 'package:x_calcu/features/operations/presentation/widget/build_dynamic_field.dart';
import 'package:x_calcu/features/operations/presentation/widget/build_reminder_date_picker_field.dart';
import 'package:x_calcu/features/operations/presentation/widget/items_drop_down_menu.dart';
import 'package:x_calcu/features/operations/presentation/widget/percentage_calculation_widget%20.dart';
import 'package:x_calcu/global/components/form_label_widget.dart';
import 'package:x_calcu/global/components/text_field_app.dart';
import 'package:x_calcu/global/components/x_calc/toggle_widget.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class ViewWidget extends StatelessWidget {
  final bool isFromPartner;
  final bool isReadOnly;
  final OperationModel? model;

  const ViewWidget({
    super.key,
    required this.isFromPartner,
    this.isReadOnly = false,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    printSuccess(' """"""""""""""$model');

    // Create controllers with model data
    final partnerController = TextEditingController(
      text: model?.partnerName ?? '',
    );
    final customerController = TextEditingController(
      text: model?.clientName ?? '',
    );
    final invoiceNumberController = TextEditingController(
      text: model?.invoiceNumber ?? '',
    );
    final invoiceValueController = TextEditingController(
      text: model?.invoiceValue?.toString() ?? '',
    );
    final totalPaidValueController = TextEditingController(
      text: model?.paidInvoice?.totalPaidValue?.toString() ?? '',
    );
    final remainingInvoiceController = TextEditingController(
      text: model?.remainingInvoice?.toString() ?? '',
    );
    final totalDueController = TextEditingController(
      text: model?.totalDue?.toString() ?? '',
    );
    final totalReceivedValueController = TextEditingController(
      text: model?.receivedAmount?.totalReceivedValue?.toString() ?? '',
    );
    final remainingAmountController = TextEditingController(
      text: model?.remainingAmount?.toString() ?? '',
    );
    final operationDateController = TextEditingController(
      text: model?.operationDate ?? '',
    );
    final reminderDateController = TextEditingController(
      text: model?.reminderDate ?? '',
    );
    final notesController = TextEditingController(text: model?.notes ?? '');

    // Paid amount controllers
    final paidAmountController = TextEditingController(
      text: model?.paidInvoice?.totalPaidValue?.toString() ?? '',
    );
    final paidDateController = TextEditingController(
      text: model?.paidInvoice?.paidDetails?.firstOrNull?.invoiceDate ?? '',
    );

    // Received amount controllers
    final receivedAmountController = TextEditingController(
      text: model?.receivedAmount?.totalReceivedValue?.toString() ?? '',
    );
    final receivedDateController = TextEditingController(
      text:
          model?.receivedAmount?.receivedDetails?.firstOrNull?.invoiceDate ??
          '',
    );

    // Percentage controllers
    final percentageController = TextEditingController(
      text: model?.percentageDetails?.percentage ?? '',
    );
    final percentageAmountController = TextEditingController(
      text: model?.percentageDetails?.percentageValue?.toString() ?? '',
    );

    return Column(
      children: [
        if (!isFromPartner)
          ItemsDropDownMenu(
            label: 'partner_name'.tr(),
            controller: partnerController,
            onChanged: isReadOnly ? null : (model) {},
            readOnly: isReadOnly,
            cubitType: CubitType.view,
          ),

        FormLabelWidget(label: "customer_name"),
        TextFieldApp(
          hintText: '',
          controller: customerController,
          readOnly: isReadOnly,
          enable: !isReadOnly,
        ),

        FormLabelWidget(label: "operation_type"),
        CommonSizes.vSmallestSpace,
        IgnorePointer(
          ignoring: isReadOnly,
          child: ToggleWidget(
            values: ["input".tr(), "output".tr()],
            state: model?.operationType?.toLowerCase() == "output",
            onTap: () {},
          ),
        ),
        CommonSizes.vSmallestSpace,

        FormLabelWidget(label: "invoice_number"),
        TextFieldApp(
          hintText: '',
          controller: invoiceNumberController,
          keyboardType: TextInputType.number,
          readOnly: isReadOnly,
          enable: !isReadOnly,
        ),

        FormLabelWidget(label: "invoice_value"),
        TextFieldApp(
          hintText: '',
          controller: invoiceValueController,
          keyboardType: TextInputType.number,
          readOnly: isReadOnly,
          enable: !isReadOnly,
        ),

        // Total Paid Value (قيمة السداد الكلية)
        FormLabelWidget(label: "total_paid_value"),
        TextFieldApp(
          hintText: '',
          controller: totalPaidValueController,
          readOnly: isReadOnly,
          enable: !isReadOnly,
        ),
        FormLabelWidget(label: "paid_amount"),
        buildPaymentField(
          context: context,
          paidAmountController: paidAmountController,
          paidDateController: paidDateController,
          isReadOnly: isReadOnly,
        ),

        FormLabelWidget(label: "remaining_invoice"),
        TextFieldApp(
          hintText: '',
          controller: remainingInvoiceController,
          keyboardType: TextInputType.number,
          readOnly: isReadOnly,
          enable: !isReadOnly,
        ),

        FormLabelWidget(label: "percentage"),
        PercentageCalculationField(
          valueController: percentageAmountController,
          percentageController: percentageController,
          baseValue: model?.invoiceValue?.toDouble() ?? 50,
          isReadOnly: isReadOnly,
        ),

        FormLabelWidget(label: "total_due"),
        TextFieldApp(
          hintText: '',
          controller: totalDueController,
          readOnly: isReadOnly,
          enable: !isReadOnly,
        ),
        // Total Received Value (قيمة المقبوضات الكلية)
        FormLabelWidget(label: "total_received_value"),
        TextFieldApp(
          hintText: '',
          controller: totalReceivedValueController,
          readOnly: isReadOnly,
          enable: !isReadOnly,
        ),
        FormLabelWidget(label: "received_amount"),
        buildReceivedField(
          context: context,
          receivedAmountController: receivedAmountController,
          receivedDateController: receivedDateController,
          isReadOnly: isReadOnly,
        ),

        FormLabelWidget(label: "remaining_amount"),
        TextFieldApp(
          hintText: '',
          controller: remainingAmountController,
          readOnly: isReadOnly,
          enable: !isReadOnly,
        ),

        FormLabelWidget(label: "operation_date"),
        buildDatePickerField(
          context: context,
          controller: operationDateController,
          isReadOnly: isReadOnly,
        ),

        FormLabelWidget(label: "reminder_date"),
        buildReminderDatePickerField(
          customerController: customerController,
          context: context,
          reminderController: reminderDateController,
          isReadOnly: isReadOnly,
        ),
        FormLabelWidget(label: "notes"),
        TextFieldApp(
          hintText: '',
          controller: notesController,
          maxLines: 6,
          readOnly: isReadOnly,
          enable: !isReadOnly,
        ),
      ],
    );
  }
}
