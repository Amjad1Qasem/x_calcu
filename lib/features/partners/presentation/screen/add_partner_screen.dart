import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_calcu/features/partners/presentation/widget/partner_form_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/add_partner_btn_widget.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';

class AddPartnerScreen extends StatelessWidget {
  const AddPartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Skaffold(
      isAppBarNull: false,
      isBack: true,
      title: 'add_partner'.tr(),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [const PartnerFormWidget(), const AddPartnerBtnWidget()],
          ),
        ),
      ),
    );
  }
}
