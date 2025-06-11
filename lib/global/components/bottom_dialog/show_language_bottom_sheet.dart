
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/global/bloc/Localization_bloc/localization_bloc.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/enums/enums.dart';

void showLanguageBottomSheet(BuildContext context,
    {bool updateOnBoarding = false}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'choose_your_language'.tr(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16.0),
            BlocBuilder<LocalizationBloc, LocalizationState>(
              bloc: getIt<LocalizationBloc>(),
              builder: (context, state) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: Language.values.length,
                  itemBuilder: (context, index) {
                    final appState = getIt<AppStateModel>();
                    final currentLang = appState.locale.languageCode;
                    return ListTile(
                      onTap: () {
                        if (currentLang == 'ar') {
                          getIt<LocalizationBloc>().add(SetEnglish(context));
                        } else {
                          getIt<LocalizationBloc>().add(SetArabic(context));
                        }
                        Future.delayed(const Duration(milliseconds: 300));
                        if (updateOnBoarding) {
                          // getIt<StartupCubit>().getOnBoardingData();
                          context.pushReplacement('/');
                          // getIt<StartupCubit>().checkOnBoardingStatus();
                        } else {
                          Future.delayed(const Duration(milliseconds: 300))
                              .then((value) => Navigator.of(context).pop());
                        }
                      },
                      leading: Image.asset(
                        Language.values[index].image.assetName,
                        width: 30,
                        fit: BoxFit.contain,
                      ),
                      title: Text(Language.values[index].text),
                      trailing: Language.values[index].value.languageCode ==
                              currentLang
                          ? const Icon(
                              Icons.check_circle_rounded,
                              color: Colors.green,
                            )
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: Language.values[index].value.languageCode ==
                                currentLang
                            ? const BorderSide(color: Colors.green, width: 1.5)
                            : BorderSide(color: Colors.grey[300]!),
                      ),
                      tileColor: Language.values[index].value.languageCode ==
                              currentLang
                          ? Colors.green.withValues(alpha: 0.08)
                          : null,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16.0);
                  },
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
