import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/features/operations/presentation/widget/operations_fields_widget.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class ShowOperationsDetailsScreen extends StatefulWidget {
  const ShowOperationsDetailsScreen({super.key});
  // final PartnerModel partner;

  @override
  State<ShowOperationsDetailsScreen> createState() =>
      _ShowOperationsDetailsScreenState();
}

class _ShowOperationsDetailsScreenState
    extends State<ShowOperationsDetailsScreen> {
  @override
  void initState() {
    // getIt<PartnerCubit>().getPartner(id: widget.partner.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Skaffold(
      isAppBarNull: false,
      isBack: true,
      title: 'operation_details'.tr(),
      actions: [
        GestureDetector(
          onTap: () {
            context.push(RouterPath.addOperationsScreen, extra: false);
          },
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 12.sp),
            child: Text(
              'edit'.tr(),
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
              isReadOnly: true,
              // model: operationData,
              model: OperationModel(),
            ),
          ],
        ),
      ),
    );
  }
}
