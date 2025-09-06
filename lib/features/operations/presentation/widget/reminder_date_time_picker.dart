import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/operations/cubit/create_operation/create_operation_cubit.dart';
import 'package:x_calcu/features/operations/cubit/edit_operation/edit_operation_cubit.dart';
import 'package:x_calcu/features/operations/data/cubit_type.dart';
import 'package:x_calcu/global/components/text_field_app.dart';
import 'package:x_calcu/global/components/user_messages/popup_widget.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

Widget buildReminderDateTimePicker({
  required BuildContext context,
  required dynamic cubit,
  required CubitType cubitType,
  bool isReadOnly = false,
  String? errorDateText,
}) {
  return GestureDetector(
    onTap:
        isReadOnly
            ? null
            : () async {
              try {
                final DateTime now = DateTime.now();

                // 1. اختيار التاريخ
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: now,
                  firstDate: now,
                  lastDate: DateTime(2100),
                );

                if (pickedDate == null) return;

                // 2. اختيار الوقت
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: const TimeOfDay(hour: 9, minute: 0),
                );

                if (pickedTime == null) return;

                // 3. الدمج
                final DateTime combined = DateTime(
                  pickedDate.year,
                  pickedDate.month,
                  pickedDate.day,
                  pickedTime.hour,
                  pickedTime.minute,
                );

                // Validate that the selected time is in the future
                if (combined.isBefore(now)) {
                  printError('⛔ ${'error_past_time'.tr()}');
                  await openDialog(
                    context: context,
                    title: 'alert_title'.tr(),
                    message: 'error_past_time'.tr(),
                    icon: Icons.warning,
                    iconColor: Utils(context).red,
                    iconBackgroundColor: Utils(
                      context,
                    ).red.withValues(alpha: 0.1),
                    confirmText: "confirm".tr(),
                    onConfirm: () async => context.pop(),
                  );
                  return;
                }

                // Validate that reminder date is after or equal to invoice date
                final invoiceDateText =
                    cubit?.operationDateController?.text?.trim();
                if (invoiceDateText != null && invoiceDateText.isNotEmpty) {
                  try {
                    // Parse invoice date (format: YYYY/MM/DD)
                    final invoiceDateParts = invoiceDateText.split('/');
                    if (invoiceDateParts.length == 3) {
                      final invoiceDate = DateTime(
                        int.parse(invoiceDateParts[0]),
                        int.parse(invoiceDateParts[1]),
                        int.parse(invoiceDateParts[2]),
                      );

                      // Check if reminder date is before invoice date
                      final reminderDateOnly = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                      );
                      final invoiceDateOnly = DateTime(
                        invoiceDate.year,
                        invoiceDate.month,
                        invoiceDate.day,
                      );

                      if (reminderDateOnly.isBefore(invoiceDateOnly)) {
                        await openDialog(
                          context: context,
                          title: 'alert_title'.tr(),
                          message: 'reminder_date_before_invoice'.tr(),
                          icon: Icons.warning,
                          iconColor: Utils(context).red,
                          iconBackgroundColor: Utils(
                            context,
                          ).red.withValues(alpha: 0.1),
                          confirmText: "confirm".tr(),
                          onConfirm: () async => context.pop(),
                        );
                        return;
                      }
                    }
                  } catch (e) {
                    printError('Error validating dates: $e');
                  }
                }

                // 4. تحديث التاريخ في الكيوبت المناسب
                if (cubitType == CubitType.create) {
                  final createCubit = cubit as CreateOperationCubit;
                  createCubit.setReminderDateTime(combined);
                } else if (cubitType == CubitType.edit) {
                  final editCubit = cubit as EditOperationCubit;
                  editCubit.setReminderDateTime(combined);
                }

                printSuccess('✅ تم تحديد تاريخ التذكير: $combined');
              } catch (e) {
                printError('⚠️ خطأ في اختيار التاريخ/الوقت: $e');
                snackBar(
                  context: context,
                  title: 'error_reminder_setup'.tr(),
                  isErrorMessage: true,
                );
              }
            },
    child: AbsorbPointer(
      absorbing: true,
      child: TextFieldApp(
        hintText: "select_date_and_time".tr(),
        controller: cubit?.reminderDateController,
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
