// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/operations/data/cubit_type.dart';
import 'package:x_calcu/features/operations/presentation/widget/add_operations_btn_widget.dart';
import 'package:x_calcu/features/operations/presentation/widget/operations_fields_widget.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class AddOperationsScreen extends StatelessWidget {
  AddOperationsScreen({super.key, this.isFromPartner});
  bool? isFromPartner = false;

  @override
  Widget build(BuildContext context) {
    return Skaffold(
      isAppBarNull: false,
      isBack: isFromPartner != true ? false : true,
      title: 'add_operation'.tr(),
      actions:
          isFromPartner != true
              ? [
                GestureDetector(
                  onTap: () => context.push(RouterPath.addPartnerScreen),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: 12.sp),
                    child: Text(
                      'add_partner'.tr(),
                      style: Utils(context).normalText.copyWith(
                        color: Utils(context).secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ]
              : null,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OperationsFieldsWidget(
              isFromPartner: false,
              isReadOnly: false,
              cubitType: CubitType.create,
            ),
            AddOperationsBtnWidget(),
            CommonSizes.vLargerSpace,
          ],
        ),
      ),
    );
  }
}
