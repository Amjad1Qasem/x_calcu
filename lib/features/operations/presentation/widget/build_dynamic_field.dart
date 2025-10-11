import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/operations/data/operation_request_model.dart';
import 'package:x_calcu/features/operations/presentation/widget/build_date_picker_field.dart';
import 'package:x_calcu/features/operations/presentation/widget/dynamic_payment_widget.dart';
import 'package:x_calcu/global/components/form_label_widget.dart';
import 'package:x_calcu/global/components/text_field_app.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

Widget buildPaymentField({
  required BuildContext context,
  required TextEditingController paidAmountController,
  required TextEditingController paidDateController,
  bool isReadOnly = false,
  String? errorText,
  String? errorDateText,
  VoidCallback? onPaidAmountChanged,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 2.sp),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 18.sp, horizontal: 14.sp),
      decoration: BoxDecoration(
        color: Utils(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(75),
            offset: Offset(0, 0),
            blurRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormLabelWidget(label: "value", required: false),
          TextFieldApp(
            controller: paidAmountController,
            hintText: '',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            readOnly: isReadOnly,
            enable: !isReadOnly,
            errorText: errorText,
            // No validation for paid amount field as it's optional
            onChanged: (value) {
              // Trigger auto-calculations when paid amount changes
              print('Paid amount changed to: $value');
              onPaidAmountChanged?.call();
            },
          ),
          CommonSizes.vSmallestSpace,
          FormLabelWidget(label: "date", required: false),
          buildDatePickerField(
            context: context,
            controller: paidDateController,
            isReadOnly: isReadOnly,
            errorDateText: errorDateText,
            errorText: errorText,
          ),
        ],
      ),
    ),
  );
}

Widget buildReceivedField({
  required BuildContext context,
  required TextEditingController receivedAmountController,
  required TextEditingController receivedDateController,
  bool isReadOnly = false,
  String? errorText,
  String? errorDateText,
  VoidCallback? onReceivedAmountChanged,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 1.sp),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 18.sp, horizontal: 14.sp),
      decoration: BoxDecoration(
        color: Utils(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            offset: Offset(0, 0),
            blurRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormLabelWidget(label: "value"),
          TextFieldApp(
            controller: receivedAmountController,
            hintText: '',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            readOnly: isReadOnly,
            enable: !isReadOnly,
            errorText: errorText,
            // No validation for received amount field as it's optional
            onChanged: (value) {
              // Trigger auto-calculations when received amount changes
              print('Received amount changed to: $value');
              onReceivedAmountChanged?.call();
            },
          ),
          CommonSizes.vSmallestSpace,
          FormLabelWidget(label: "date"),
          buildDatePickerField(
            context: context,
            controller: receivedDateController,
            isReadOnly: isReadOnly,
            errorText: errorText,
            errorDateText: errorDateText,
          ),
        ],
      ),
    ),
  );
}

// New dynamic payment field
Widget buildDynamicPaymentField({
  required BuildContext context,
  required List<DynamicPaymentItem> paidBills,
  required Function(List<DynamicPaymentItem>) onPaidBillsChanged,
  bool isReadOnly = false,
}) {
  return DynamicPaymentWidget(
    title: 'paid_amount'.tr(),
    items: paidBills,
    onItemsChanged: onPaidBillsChanged,
    isReadOnly: isReadOnly,
  );
}

// New dynamic received field
Widget buildDynamicReceivedField({
  required BuildContext context,
  required List<DynamicPaymentItem> receivedAmounts,
  required Function(List<DynamicPaymentItem>) onReceivedAmountsChanged,
  bool isReadOnly = false,
}) {
  return DynamicPaymentWidget(
    title: 'received_amount'.tr(),
    items: receivedAmounts,
    onItemsChanged: onReceivedAmountsChanged,
    isReadOnly: isReadOnly,
  );
}
