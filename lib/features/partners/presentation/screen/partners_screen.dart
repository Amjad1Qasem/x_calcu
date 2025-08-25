import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/partners/cubit/partners/partner_cubit.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/features/partners/presentation/widget/filter_header_partners_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/partners_app_bar.dart';
import 'package:x_calcu/features/partners/presentation/widget/partners_card.dart';
import 'package:x_calcu/features/partners/presentation/widget/sort_and_oreder_operations_partners_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/statistics/statistics_partner_widget.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class PartnersScreen extends StatelessWidget {
  const PartnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Skaffold(
      isAppBarNull: true,
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              getIt<PartnerCubit>().getStatistics();
              printSuccess('RefreshIndicator PartnersScreen');
            },
            child: CustomScrollView(
              slivers: [
                // AppBar
                partnersAppBar(context),
                // Sticky Filter (Input/Output)
                SliverPersistentHeader(
                  pinned: true,
                  delegate: FilterHeaderPartnersWidget(),
                ),

                //  Space
                // SliverToBoxAdapter(child: CommonSizes.vSmallestSpace5v),
                // Statistics
                SliverToBoxAdapter(child: StatisticsPartnerWidget()),
                //  Space
                SliverToBoxAdapter(child: CommonSizes.vSmallestSpace),
                // Cards List
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => PartnersCard(
                      onTap:
                          () => context.push(
                            RouterPath.partnerDetailsScreen,
                            extra: PartnerModel(id: 1, name: 'Partnert 1'),
                          ),
                    ),
                    childCount: 10,
                  ),
                ),
                //  Space
                SliverToBoxAdapter(child: CommonSizes.vBiggerSpace),
              ],
            ),
          ),
          SortAndOrederPartnersWidget(),
        ],
      ),
    );
  }
}
