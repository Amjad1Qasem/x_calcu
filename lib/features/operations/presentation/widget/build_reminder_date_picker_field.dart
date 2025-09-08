import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/components/text_field_app.dart';
import 'package:x_calcu/global/components/user_messages/popup_widget.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/functions/format_time.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/notification_service.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

Widget buildReminderDatePickerField({
  required BuildContext context,
  required TextEditingController reminderController,
  required TextEditingController customerController,
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

                // 1. اختيار التاريخ (محدود بسنة واحدة من الآن)
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: now,
                  firstDate: now,
                  lastDate: DateTime(now.year + 1, now.month, now.day),
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

                if (combined.isBefore(now)) {
                  printError('⛔ ${'error_past_time'.tr()}');
                  await openDialog(
                    context: context,
                    title: 'alert_title'.tr(),
                    message: 'error_past_time'.tr(),
                    icon: Icons.exit_to_app,
                    iconColor: Utils(context).red,
                    iconBackgroundColor: Utils(
                      context,
                    ).red.withValues(alpha: 0.1),
                    confirmText: "confirm".tr(),
                    onConfirm: () async => context.pop(),
                  );
                  return;
                }

                // 4. تحديث النص في الحقل
                final formattedDate = FormatTime.formatDateFromDateTime(
                  pickedDate,
                );
                reminderController.text =
                    "$formattedDate - ${pickedTime.format(context)}";

                // 5. اسم العميل
                final String clientName =
                    customerController.text.trim().isEmpty
                        ? 'unknown_client'.tr()
                        : customerController.text.trim();

                // 6. إعداد المنطقة الزمنية
                tz.initializeTimeZones();
                final tz.TZDateTime tzScheduled = tz.TZDateTime.from(
                  combined,
                  tz.local,
                );

                // 7. رقم مميز للإشعار
                final int notificationId = DateTime.now().millisecondsSinceEpoch
                    .remainder(100000);

                // 8. جدولة الإشعار
                await NotificationService.scheduleNotification(
                  id: notificationId,
                  title: 'notification_title'.tr(),
                  body: tr('notification_body', args: [clientName]),
                  payload: 'go_to_notifications',
                  scheduledTime: tzScheduled,
                );

                printSuccess('✅ إشعار مجدول عند: $tzScheduled');
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
        hintText: "",
        controller: reminderController,
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
