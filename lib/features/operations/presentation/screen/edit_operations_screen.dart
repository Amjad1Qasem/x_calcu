import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/features/operations/presentation/widget/operations_fields_widget.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class EditOperationsScreen extends StatelessWidget {
  EditOperationsScreen({super.key, this.isFromPartner});
  bool? isFromPartner = false;

  @override
  Widget build(BuildContext context) {
    return Skaffold(
      isAppBarNull: false,
      isBack: true,
      title: 'edit_operation'.tr(),
      actions: [
        GestureDetector(
          onTap: () => context.push(RouterPath.addPartnerScreen),
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 12.sp),
            child: Text(
              'save'.tr(),
              style: Utils(context).normalText.copyWith(
                color: Utils(context).secondary,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ],
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OperationsFieldsWidget(
              isFromPartner: true,
              isReadOnly: false,
              model: OperationModel(),
              // model: operationData,
            ),
            CommonSizes.vLargerSpace,
          ],
        ),
      ),
    );
  }
}
