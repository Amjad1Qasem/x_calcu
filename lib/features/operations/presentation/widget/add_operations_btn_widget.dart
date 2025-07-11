import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:x_calcu/notification_service.dart'; // ← تأكد من وجود هذه

class AddOperationsBtnWidget extends StatelessWidget {
  const AddOperationsBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: 'add'.tr(),
      onTap: () async {
        final now = DateTime.now().add(
          const Duration(seconds: 5),
        ); // تأخير اختباري
        await NotificationService.scheduleNotification(
          id: 1111,
          title: '💡 عملية مضافة',
          body: 'تم إضافة عملية جديدة. هذا تنبيه تجريبي.',
          payload: 'test_payload',
          scheduledTime: now,
        );
      },
    );
  }
}
