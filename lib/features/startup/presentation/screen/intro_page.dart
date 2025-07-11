import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/startup/bloc/biometric_auth/biometric_auth_cubit.dart';
import 'package:x_calcu/features/startup/bloc/startup/startup_cubit.dart';
import 'package:x_calcu/features/startup/presentation/widgets/app_skeleton.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/components/utils/error_widget_screen.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/global/utils/helper/local_storage_helper.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _bloc = getIt<StartupCubit>();
  final _biometricCubit = getIt<BiometricAuthCubit>();

  @override
  void initState() {
    super.initState();
    _bloc.checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Skaffold(
      isBack: false,
      isAppBarNull: true,
      body: BlocListener<BiometricAuthCubit, BiometricAuthState>(
        bloc: _biometricCubit,
        listenWhen: (previous, current) => true,
        listener: (context, bioState) {
          bioState.maybeWhen(
            authenticated: () => context.go(RouterPath.mainLayout),
            failed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Authentication failed')),
              );
            },
            notSupported: () => context.go(RouterPath.mainLayout),
            error: (msg) {
              printError('Biometric error: $msg');
              context.go(RouterPath.mainLayout);
            },
            orElse: () {
              printError('Biometric error: in orElse state');
              context.go(RouterPath.mainLayout);
            },
          );
        },
        child: BlocConsumer<StartupCubit, StartupState>(
          bloc: _bloc,
          listener: (context, state) {
            state.maybeWhen(
              unauthenticated: () async => context.go(RouterPath.loginScreen),
              success: (_) async {
                printWarning('unauthenticated');
                final isBioEnabled =
                    await LocalStorageHelper.isBiometricEnabled();
                if (isBioEnabled) {
                  _biometricCubit.authenticateUser();
                } else {
                  context.go(RouterPath.mainLayout);
                }
              },

              onboardingRequired: () => context.go(RouterPath.onBoardingScreen),
              suspended:
                  (info) => context.go(
                    RouterPath.suspendedAccountScreen,
                    extra: info,
                  ),
              banned:
                  (info) =>
                      context.go(RouterPath.bannedAccountScreen, extra: info),
              orElse: () {},
            );
          },
          builder: (context, state) {
            printError(' state # state $state');

            return state.maybeWhen(
              error: () => _error(),
              onboardingRequired: () => _buildAnimationUI(),
              loading: () => _buildAnimationUI(),
              unauthenticated: () => const SizedBox.shrink(),
              success: (_) => const SizedBox.shrink(),
              orElse: () => _error(),
            );
          },
        ),
      ),
    );
  }

  Widget _error() {
    return ErrorWidgetScreen(
      message: 'something_wrong_happened'.tr(),
      onRetry: () => _bloc.checkAuthentication(),
    );
  }

  Widget _buildAnimationUI() {
    final bioState = getIt<BiometricAuthCubit>().state;
    return bioState.maybeWhen(
      loading: () => const Center(child: CircularProgressIndicator()),
      orElse: () => const AppSkeleton(),
    );
  }
}
