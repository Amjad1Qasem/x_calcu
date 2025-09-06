import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/components/text_field_app.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

Widget buildDatePickerField({
  required BuildContext context,
  required TextEditingController controller,
  bool isReadOnly = false,
  String? errorText,
  String? errorDateText,
}) {
  return GestureDetector(
    onTap:
        isReadOnly
            ? null
            : () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1920, 1),
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                controller.text =
                    "${picked.year}/${picked.month}/${picked.day}";
              }
            },
    child: AbsorbPointer(
      absorbing: true,
      child: TextFieldApp(
        hintText: "",
        controller: controller,
        readOnly: true,
        enable: false,
        errorText: errorDateText,
        prefixIcon: Icon(
          Iconsax.calendar_1_copy,
          color: Utils(context).secondTextColor,
        ),
      ),
    ),
  );
}
