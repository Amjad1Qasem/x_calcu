import 'package:flutter/material.dart';

// class SettingScreen extends StatelessWidget {
//   const SettingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/setting/cubit/setting_cubit.dart';
import 'package:x_calcu/features/setting/presentation/widget/profile_user_widgets/profile_user_widget.dart';
import 'package:x_calcu/global/components/loaders/loading_widget.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    try {
      getIt<SettingCubit>().checkIfUserLogin();
      super.initState();
    } catch (e) {
      debugPrint('Error in initState: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      bloc: getIt<SettingCubit>(),
      buildWhen:
          (previous, current) =>
              current is UserIslogin || current is UserIsVisator,
      builder: (context, state) {
        return state.maybeWhen(
          getUserDataLoading: () => const LoadingWidget(),
          userIslogin: () => const ProfileUserWidget(),
          userIsVisator: () => const ProfileUserWidget(),
          // userIsVisator: () => const ProfileVisitorWidget(),
          orElse:
              () => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        try {
                          getIt<SettingCubit>().checkIfUserLogin();
                        } catch (e) {
                          debugPrint('Error in onPressed: $e');
                        }
                      },
                      icon: Icon(
                        Icons.replay,
                        size: 45.sp,
                        color: Utils(context).primary,
                      ),
                    ),
                    Text(
                      "something_went_wrong".tr(),
                      style: Utils(context).blueHeadlineText,
                    ),
                  ],
                ),
              ),
        );
      },
    );
  }
}
