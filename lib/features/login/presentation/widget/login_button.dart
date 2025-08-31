import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/login/cubit/auth_cubit.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.isFormValid,
  });

  final GlobalKey<FormState> formKey;
  final bool isFormValid;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    final cubit = getIt<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is Error) {
          snackBar(
            context: context,
            title: state.message,
            isErrorMessage: true,
          );
        } else if (state is Suspended) {
          context.pushReplacement(
            RouterPath.suspendedAccountScreen,
            extra: (state).accountDetails,
          );

          snackBar(
            context: context,
            title: "account_suspended".tr(),
            isErrorMessage: true,
          );
        }
        if (state is Banned) {
          context.pushReplacement(
            RouterPath.bannedAccountScreen,
            extra: (state).accountDetails,
          );

          snackBar(
            context: context,
            title: "account_banned".tr(),
            isErrorMessage: true,
          );
        }
        if (state is Success) {
          context.go(RouterPath.mainLayout);
          snackBar(
            context: context,
            title: 'you_have_successfully_logged_in'.tr(),
          );
        }
      },
      builder: (context, state) {
        return Visibility(
          visible: state is Loading,
          replacement: AppButton(
            disable: !widget.isFormValid,
            onTap: () {
              if (widget.isFormValid) {
                cubit.submitLogin();
              }
            },
            // loading: state is Loading,
            label: 'login'.tr(),
            padding: EdgeInsets.zero,
          ),
          child: AppButton(
                onTap: () {},
                label: "${"login_loading".tr()}...",
                padding: EdgeInsets.zero,
              )
              .animate(onComplete: (cont) => cont.repeat(reverse: true))
              .fade(duration: const Duration(seconds: 1)),
        );
      },
    );
  }
}
