import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class AddOperationForPartnerBtn extends StatelessWidget {
  const AddOperationForPartnerBtn({super.key, required this.partner});
  final PartnerModel partner;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
      onTap:
          () => context.push(
            RouterPath.addOperationsScreen,
            extra: {'isFromPartner': true, 'partner': partner},
          ),
      label: 'add_operation'.tr(),
      // padding: EdgeInsets.zero,
    );
  }
}
