import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/startup/bloc/startup/startup_cubit.dart';
import 'package:x_calcu/features/startup/presentation/widgets/app_skeleton.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/components/utils/error_widget_screen.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _bloc = getIt<StartupCubit>();

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
      body: BlocConsumer<StartupCubit, StartupState>(
        bloc: _bloc,
        listener: (context, state) {
          state.maybeWhen(
            unauthenticated: () => context.go(RouterPath.loginScreen),
            success: (_) => context.go(RouterPath.mainLayout),
            onboardingRequired: () => context.go(RouterPath.onBoardingScreen),
            suspended:
                (info) =>
                    context.go(RouterPath.suspendedAccountScreen, extra: info),
            banned:
                (info) =>
                    context.go(RouterPath.bannedAccountScreen, extra: info),
            uncertain: (info) {},
            // context.go(RouterPath.phoneVerificationScreen, extra: true),
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
    );
  }

  Widget _error() {
    return ErrorWidgetScreen(
      message: 'something_wrong_happened'.tr(),
      onRetry: () => _bloc.checkAuthentication(),
    );
  }

  Widget _buildAnimationUI() {
    return const AppSkeleton();
  }
}
