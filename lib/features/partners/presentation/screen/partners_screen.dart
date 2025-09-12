import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_calcu/features/partners/cubit/partners/partner_cubit.dart';
import 'package:x_calcu/features/partners/presentation/controller/partners_screen_controller.dart';
import 'package:x_calcu/features/partners/presentation/widget/filter_header_partners_screen_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/partners_app_bar.dart';
import 'package:x_calcu/features/partners/presentation/widget/partners_list_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/statistics/statistics_loaded_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/statistics/statistics_partner_loading_widget.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class PartnersScreen extends StatefulWidget {
  const PartnersScreen({super.key});

  @override
  State<PartnersScreen> createState() => _PartnersScreenState();
}

class _PartnersScreenState extends State<PartnersScreen> {
  late final PartnersScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PartnersScreenController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PartnerCubit, PartnerState>(
      bloc: getIt<PartnerCubit>(),
      listener: (context, state) {
        _controller.handleStateChange(state);

        // Refresh statistics when loading starts (filter change)
        if (state is PartnersLoading) {
          getIt<PartnerCubit>().getStatistics();
        }
      },
      builder: (context, state) {
        printSuccess('state: $state');
        return Skaffold(
          isAppBarNull: true,
          body: RefreshIndicator(
            onRefresh: _controller.handleRefresh,
            child: CustomScrollView(
              slivers: [
                // AppBar
                partnersAppBar(context),
                // Sticky Filter (Input/Output)
                SliverPersistentHeader(
                  pinned: true,
                  delegate: FilterHeaderPartnersScreenWidget(),
                ),

                //  Space
                // SliverToBoxAdapter(child: CommonSizes.vSmallestSpace5v),

                // Statistics
                SliverToBoxAdapter(child: StatisticsBlocBuilderWidget()),
                //  Space
                SliverToBoxAdapter(child: CommonSizes.vSmallestSpace),
                // Partners List with Pagination
                PartnersListWidget(
                  pagingController: _controller.pagingController,
                ),
                //  Space
                SliverToBoxAdapter(child: CommonSizes.vBiggerSpace),
              ],
            ),
          ),
        );
      },
    );
  }
}

class StatisticsBlocBuilderWidget extends StatelessWidget {
  const StatisticsBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnerCubit, PartnerState>(
      bloc: getIt<PartnerCubit>(),
      buildWhen:
          (cur, prev) =>
              cur is Loaded ||
              cur is Loading ||
              cur is Error ||
              cur is PartnersLoading,
      builder: (context, state) {
        printSuccess('StatisticsBlocBuilderWidget state : $state');
        return state.maybeWhen(
          loading: () => const StatisticsPartnerLoadingWidget(),
          loaded: (data) => StatisticsLoadedWidget(apiStatistics: data),
          error: (message) => Center(child: Text(message)),
          partnersloading: () => const StatisticsPartnerLoadingWidget(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
