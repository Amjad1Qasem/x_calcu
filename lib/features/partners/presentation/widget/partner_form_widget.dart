import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_calcu/features/partners/cubit/add_partner/add_partner_cubit.dart';
import 'package:x_calcu/global/components/form_label_widget.dart';
import 'package:x_calcu/global/components/text_field_app.dart';
import 'package:x_calcu/global/components/validation_error_display.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/validation/input_validators.dart';
import 'package:x_calcu/global/utils/functions/validator.dart';

class PartnerFormWidget extends StatelessWidget {
  const PartnerFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<AddPartnerCubit>();

    return BlocBuilder<AddPartnerCubit, AddPartnerState>(
      bloc: cubit,
      builder: (context, state) {
        return Form(
          key: cubit.addPartnerFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Show validation errors summary if there are any
              if (cubit.validationErrors.isNotEmpty)
                ValidationErrorDisplay(
                  validationErrors: cubit.validationErrors,
                ),

              FormLabelWidget(label: "partner_name"),
              TextFieldApp(
                hintText: 'enter_partner_name'.tr(),
                controller: cubit.companyNameController,
                keyboardType: TextInputType.name,
                errorText: cubit.getFieldError('name'),
                validation:
                    (value) => InputValidators.validateRequired(
                      value,
                      fieldName: 'partner_name'.tr(),
                    ),
              ),

              FormLabelWidget(label: "partner_number", required: false),
              TextFieldApp(
                hintText: 'enter_partner_phone'.tr(),
                controller: cubit.companyNumberController,
                keyboardType: TextInputType.phone,
                errorText: cubit.getFieldError('phone'),
                validation: (value) {
                  if (value != null && value.trim().isNotEmpty) {
                    return Validation().validatePhoneNumber(
                      value: value.trim(),
                    );
                  }
                  return null;
                },
              ),

              FormLabelWidget(label: "partner_email", required: false),
              TextFieldApp(
                hintText: 'enter_partner_email'.tr(),
                controller: cubit.companyEmailController,
                keyboardType: TextInputType.emailAddress,
                errorText: cubit.getFieldError('email'),
                validation: (value) {
                  if (value != null && value.trim().isNotEmpty) {
                    return Validation().validateEmail(value.trim());
                  }
                  return null;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
