import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_calcu/features/partners/cubit/partners/partner_cubit.dart';
import 'package:x_calcu/features/partners/presentation/widget/statistics/statistics_loaded_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/statistics/statistics_partner_loading_widget.dart';
import 'package:x_calcu/global/components/utils/error_widget_screen.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class StatisticsPartnerWidget extends StatefulWidget {
  const StatisticsPartnerWidget({super.key});

  @override
  State<StatisticsPartnerWidget> createState() =>
      _StatisticsPartnerWidgetState();
}

class _StatisticsPartnerWidgetState extends State<StatisticsPartnerWidget> {
  @override
  void initState() {
    getIt<PartnerCubit>().getStatistics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<PartnerCubit>();
    return BlocBuilder<PartnerCubit, PartnerState>(
      bloc: cubit,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const StatisticsPartnerLoadingWidget(),
          loaded: (data) => StatisticsLoadedWidget(apiStatistics: data),
          error:
              (message) => ErrorWidgetScreen(
                onRetry: () => cubit.getStatistics(),
                message: message,
              ),
          orElse: () => ErrorWidgetScreen(onRetry: () => cubit.getStatistics()),
        );
      },
    );
  }
}
