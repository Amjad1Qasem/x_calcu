import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class AddOperationForPartnerBtn extends StatelessWidget {
  const AddOperationForPartnerBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: () => context.push(RouterPath.addOperationsScreen, extra: true),
      label: 'add_operation'.tr(),
      padding: EdgeInsets.zero,
    );
  }
}
