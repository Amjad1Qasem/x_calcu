import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/operations/presentation/widget/build_date_picker_field.dart';
import 'package:x_calcu/global/components/form_label_widget.dart';
import 'package:x_calcu/global/components/text_field_app.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

Widget buildPaymentField({
  required BuildContext context,
  required TextEditingController paidAmountController,
  required TextEditingController paidDateController,
  bool isReadOnly = false,
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
          FormLabelWidget(label: "value", required: false),
          TextFieldApp(
            controller: paidAmountController,
            hintText: '',
            keyboardType: TextInputType.number,
            readOnly: isReadOnly,
            enable: !isReadOnly,
          ),
          CommonSizes.vSmallestSpace,
          FormLabelWidget(label: "date", required: false),
          buildDatePickerField(
            context: context,
            controller: paidDateController,
            isReadOnly: isReadOnly,
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
            keyboardType: TextInputType.number,
            readOnly: isReadOnly,
            enable: !isReadOnly,
          ),
          CommonSizes.vSmallestSpace,
          FormLabelWidget(label: "date"),
          buildDatePickerField(
            context: context,
            controller: receivedDateController,
            isReadOnly: isReadOnly,
          ),
        ],
      ),
    ),
  );
}
