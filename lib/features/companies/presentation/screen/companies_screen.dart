import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_calcu/features/companies/presentation/widget/company_form_widget.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Skaffold(
      isAppBarNull: false,
      isBack: true,
      title: 'add_partner'.tr(),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [CompanyFormWidget(), AppButton(label: 'add'.tr())],
          ),
        ),
      ),
    );
  }
}
