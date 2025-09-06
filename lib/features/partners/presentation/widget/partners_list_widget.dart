import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/features/partners/presentation/widget/partners_card.dart';
import 'package:x_calcu/global/components/utils/error_widget_screen.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class PartnersListWidget extends StatelessWidget {
  final PagingController<int, PartnerModel> pagingController;

  const PartnersListWidget({super.key, required this.pagingController});

  @override
  Widget build(BuildContext context) {
    return PagedSliverList<int, PartnerModel>(
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<PartnerModel>(
        itemBuilder: (context, partner, index) {
          return PartnersCard(
            partner: partner,
            onTap:
                () => context.push(
                  RouterPath.partnerDetailsScreen,
                  extra: partner,
                ),
          );
        },
        firstPageErrorIndicatorBuilder:
            (context) => ErrorWidgetScreen(
              onRetry: () => pagingController.refresh(),
              message:
                  pagingController.error?.toString() ??
                  'failed_to_load_partners'.tr(),
            ),
        newPageErrorIndicatorBuilder:
            (context) => ErrorWidgetScreen(
              onRetry: () => pagingController.retryLastFailedRequest(),
              message: 'failed_to_load_more_partners'.tr(),
            ),
        firstPageProgressIndicatorBuilder:
            (context) => const Center(child: CircularProgressIndicator()),
        newPageProgressIndicatorBuilder:
            (context) => Padding(
              padding: EdgeInsets.all(8.0),
              child: const Center(child: CircularProgressIndicator()),
            ),
        noItemsFoundIndicatorBuilder:
            (context) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people_outline, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'no_partners_found'.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'no_partners_found_message'.tr(),
                    style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
