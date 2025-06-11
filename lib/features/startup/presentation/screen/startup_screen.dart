// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:x_calcu/features/layout/main_layout.dart';
// import 'package:x_calcu/features/startup/bloc/startup/startup_cubit.dart';
// import 'package:x_calcu/features/startup/presentation/screen/banned_account_screen.dart';
// import 'package:x_calcu/features/startup/presentation/screen/on_boarding_screen.dart';
// import 'package:x_calcu/features/startup/presentation/screen/suspended_account_screen.dart';
// import 'package:x_calcu/global/components/utils/error_widget_screen.dart';
// import 'package:x_calcu/global/utils/di/dependency_injection.dart';

// class StartupScreen extends StatefulWidget {
//   const StartupScreen({super.key});

//   @override
//   StartupScreenState createState() => StartupScreenState();
// }

// class StartupScreenState extends State<StartupScreen> {
//   final _bloc = getIt<StartupCubit>();

//   @override
//   void initState() {
//     // _bloc.checkOnBoardingStatus();
//     _bloc.checkAuthentication();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<StartupCubit, StartupState>(
//       bloc: _bloc,
//       listener: (context, state) async {
//         debugPrint('state is ${state.toString()}');
//         state.maybeWhen(
//           unauthenticated: () {
//             context.pushReplacementNamed('login');
//           },
//           orElse: () {},
//         );
//       },
//       builder: (context, state) {
//         return state.maybeWhen(
//           // initial: () => const Text('s'),
//           loading: () => const Text('ss'),
//           onboardingRequired: (data) => OnBoardingScreen(details: data),
//           unauthenticated: () => const SizedBox.shrink(),
//           success: (s) => const MainLayout(),
//           suspended: (info) => SuspendedAccountPage(accountInfo: info),
//           banned: (info) => BannedAccountPage(accountInfo: info),
//           error: () => _error(),
//           orElse: () => _error(),
//         );
//       },
//     );
//   }

//   Widget _error() {
//     return ErrorWidgetScreen(
//       message: 'something went Wrong please try again',
//       onRetry: () => _bloc.checkAuthentication(),
//     );
//   }
// }
