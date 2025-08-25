import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/login/cubit/auth_cubit.dart';
import 'package:x_calcu/global/components/text_field_app.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/functions/validator.dart';
class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.onFieldChanged,
  });
  final GlobalKey<FormState> formKey;

  final VoidCallback onFieldChanged;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final bloc = getIt<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFieldApp(
            hintText: "email".tr(),
            controller: bloc.emailCont,
            focusNode: bloc.emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(bloc.passwordFocusNode);
            },
            validation: (v) => Validation().validateName(v!, 3),
            errorText: bloc.validationErrors["email"]?[0],
            autofillHints: const [AutofillHints.email],
            onChanged: (_) => widget.onFieldChanged(),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            bloc: bloc,
            buildWhen:
                (previous, current) => current is PasswordVisibilityToggled,
            builder: (context, state) {
              return TextFieldApp(
                hintText: "password".tr(),
                suffixIcon: GestureDetector(
                  onTap: () => bloc.togglePassword(),
                  child: Icon(
                    bloc.isVisible ? Iconsax.eye_slash_copy : Iconsax.eye_copy,
                    size: 24.sp,
                    color:
                        bloc.isVisible
                            ? Utils(context).disableGrey
                            : Utils(context).lightGray,
                  ),
                ),
                focusNode: bloc.passwordFocusNode,
                obscureText: bloc.isVisible,
                keyboardType:
                    bloc.isVisible
                        ? TextInputType.text
                        : TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                controller: bloc.passwordCont,
                validation: (v) => Validation().validateOnlyEmptiness(v!),
                isPassword: bloc.isVisible,
                errorText: bloc.validationErrors["password"]?[0],
                autofillHints: const [AutofillHints.password],
                onChanged: (_) => widget.onFieldChanged(),
              );
            },
          ),
        ],
      ),
    );
  }
}
