import 'package:flutter/material.dart';
import 'package:x_calcu/features/companies/cubit/companies_cubit.dart';
import 'package:x_calcu/global/components/form_label_widget.dart';
import 'package:x_calcu/global/components/text_field_app.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class CompanyFormWidget extends StatelessWidget {
  const CompanyFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<CompaniesCubit>();

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FormLabelWidget(label: "partner_name"),
          TextFieldApp(
            hintText: '',
            controller: cubit.companyNameController,
            keyboardType: TextInputType.name,
          ),
          FormLabelWidget(label: "partner_number", required: false),
          TextFieldApp(
            hintText: '',
            controller: cubit.companyNumberController,
            keyboardType: TextInputType.number,
          ),
          FormLabelWidget(label: "partner_email", required: false),
          TextFieldApp(
            hintText: '',
            controller: cubit.companyEmailController,
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}
