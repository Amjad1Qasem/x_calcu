import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/partners/cubit/partner_details/partner_details_cubit.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/features/partners/presentation/widget/statistics/statistics_loaded_widget.dart';
import 'package:x_calcu/global/components/utils/error_widget_screen.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class PartnerDetailsStatisticsSection extends StatelessWidget {
  final PartnerDetailsState state;
  final PartnerModel partner;
  final PartnerDetailsCubit cubit;

  const PartnerDetailsStatisticsSection({
    super.key,
    required this.state,
    required this.partner,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
      child: state.when(
        initial: () => const SizedBox.shrink(),
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: (data, operations) {
          printError('data.data: ${data.statistic}');
          printError(' operations: ${operations.length}');

          // Check if statistics data is available and not null
          if (data.statistic != null) {
            return StatisticsLoadedWidget(partnerStatistics: data.statistic);
          } else {
            // Show empty state or placeholder when statistics are null
            return const Center(
              child: Text(
                'No statistics available',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }
        },
        error:
            (message) => ErrorWidgetScreen(
              isIcon: false,
              onRetry: () => cubit.getPartnerDetails(partnerId: partner.id!),
              message: message,
            ),
      ),
    );
  }
}
