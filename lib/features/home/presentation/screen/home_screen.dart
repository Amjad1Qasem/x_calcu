import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/home/presentation/widget/app_bar_search_widget.dart';
import 'package:x_calcu/features/home/presentation/widget/filter_header_home_widget.dart';
import 'package:x_calcu/features/home/presentation/widget/home_app_bar.dart';
import 'package:x_calcu/features/home/presentation/widget/operation_card.dart';
import 'package:x_calcu/features/home/presentation/widget/sort_and_oreder_pperations_widget.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Skaffold(
      isAppBarNull: true,
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              printSuccess('RefreshIndicator');
            },
            child: CustomScrollView(
              slivers: [
                // AppBar
                homeAppBar(context),
                // Search Box
                SliverToBoxAdapter(child: AppBarSearchWidget()),
                // Sticky Filter (Input/Output)
                SliverPersistentHeader(
                  pinned: true,
                  delegate: FilterHeaderHomeWidget(),
                ),
                // Empty Space
                SliverToBoxAdapter(child: CommonSizes.vSmallestSpace5v),
                // Cards List
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => OperationCard(
                      onTap:
                          () => context.push(
                            RouterPath.showOperationsDetailsScreen,
                          ),
                    ),
                    childCount: 10,
                  ),
                ),
                // Empty Space
                SliverToBoxAdapter(child: CommonSizes.vBiggerSpace),
              ],
            ),
          ),
          SortAndOrederOperationsWidget(),
        ],
      ),
    );
  }
}
