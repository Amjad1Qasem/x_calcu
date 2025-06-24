import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/color_app.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

enum OperationTypeEnum { inputOperation, outputOperation }

class OperationType extends StatelessWidget {
  const OperationType({super.key, required this.type});
  final OperationTypeEnum type;

  @override
  Widget build(BuildContext context) {
    // Determine colors and text based on the operation type
    final bool isInput = type == OperationTypeEnum.inputOperation;
    final Color backgroundColor =
        isInput ? ColorManager.greenTransparent : ColorManager.redTransparent;
    final Color borderColor =
        isInput ? ColorManager.greenlight : ColorManager.redLight;
    final Color textColor =
        isInput ? ColorManager.greenDark : ColorManager.redDark;
    final String operationText =
        isInput ? 'Input operation' : 'Output operation';

    // Define the shadow for the text
    final List<Shadow> textShadow = [
      Shadow(
        offset: Offset(0, 2),
        blurRadius: 4.0,
        color: Colors.black.withValues(alpha: 0.25),
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Text(
        operationText,
        style: Utils(context).normalText.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
          shadows: textShadow, 
        ),
      ),
    );
  }
}
