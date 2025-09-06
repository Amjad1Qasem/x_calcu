import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class ValidationErrorDisplay extends StatelessWidget {
  final Map<String, dynamic> validationErrors;
  final EdgeInsetsGeometry? padding;

  const ValidationErrorDisplay({
    super.key,
    required this.validationErrors,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    if (validationErrors.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: padding ?? EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: Utils(context).red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: Utils(context).red.withValues(alpha: 0.3),
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.error_outline, color: Utils(context).red, size: 20.sp),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'Please correct the following errors:',
                  style: Utils(context).normalText.copyWith(
                    color: Utils(context).red,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          ...validationErrors.entries.map((entry) {
            final fieldName = _getFieldDisplayName(entry.key);
            final errors = entry.value;

            if (errors is List && errors.isNotEmpty) {
              return Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 6.h, right: 8.w),
                      width: 4.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: Utils(context).red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '$fieldName: ${errors.first}',
                        style: Utils(context).normalText.copyWith(
                          color: Utils(context).red,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }

  String _getFieldDisplayName(String fieldKey) {
    switch (fieldKey) {
      case 'customer_name':
        return 'Customer Name';
      case 'invoice_number':
        return 'Invoice Number';
      case 'invoice_value':
        return 'Invoice Value';
      case 'alert_date':
        return 'Reminder Date';
      case 'invoice_date':
        return 'Invoice Date';
      case 'percentage_of_bill':
        return 'Percentage';
      case 'partner_id':
        return 'Partner';
      default:
        return fieldKey.replaceAll('_', ' ').toUpperCase();
    }
  }
}
