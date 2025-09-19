import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/components/text_field_app.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/global/utils/validation/input_validators.dart';

class PercentageCalculationField extends StatefulWidget {
  final TextEditingController valueController; // لعرض القيمة المحسوبة
  final TextEditingController percentageController; // لإدخال النسبة
  final double baseValue; // المبلغ الأساسي يلي نحسب منه
  final bool isReadOnly;
  final String? errorText;
  final VoidCallback? onPercentageChanged; // Callback for auto-calculations
  const PercentageCalculationField({
    super.key,
    required this.valueController,
    required this.percentageController,
    required this.baseValue,
    required this.isReadOnly,
    this.errorText,
    this.onPercentageChanged,
  });

  @override
  State<PercentageCalculationField> createState() =>
      _PercentageCalculationFieldState();
}

class _PercentageCalculationFieldState
    extends State<PercentageCalculationField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // حقل إدخال النسبة
        SizedBox(
          width: 100.w,
          child: GestureDetector(
            child: TextFieldApp(
              errorText: widget.errorText,
              controller: widget.percentageController,
              readOnly: widget.isReadOnly,

              hintText: '%',
              style: Utils(context).normalText.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              validation:
                  widget.isReadOnly
                      ? null
                      : (value) => InputValidators.validateRequired(
                        value,
                        fieldName: 'percentage'.tr(),
                      ),
              onChanged: (value) {
                final percent = double.tryParse(value) ?? 0;
                // Use paid amount as base value instead of invoice value
                final calculated = (widget.baseValue * percent) / 100;
                printSuccess('calculated $calculated');
                widget.valueController.text = calculated.toStringAsFixed(2);
                setState(() {});
                printSuccess(
                  'valueController.text ${widget.valueController.text}',
                );

                // Trigger auto-calculations when percentage changes
                widget.onPercentageChanged?.call();
              },
            ),
          ),
        ),
        SizedBox(width: 12.w),

        // الحقل المحسوب (المبلغ)
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 14.sp),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              widget.valueController.text.isEmpty
                  ? '0'
                  : widget.valueController.text,
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
            ),
          ),
        ),
      ],
    );
  }
}
