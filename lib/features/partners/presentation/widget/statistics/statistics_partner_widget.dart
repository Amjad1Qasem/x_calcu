import 'package:flutter/material.dart';
import 'package:x_calcu/features/partners/data/models/partner_details_model.dart';
import 'package:x_calcu/features/partners/presentation/widget/statistics/statistics_loaded_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/statistics/statistics_partner_loading_widget.dart';
import 'package:x_calcu/global/components/utils/error_widget_screen.dart';

class StatisticsPartnerWidget extends StatelessWidget {
  const StatisticsPartnerWidget({super.key, required this.statistics});

  final PartnerDetailsStatistic statistics;

  @override
  Widget build(BuildContext context) {
    return StatisticsLoadedWidget(partnerStatistics: statistics);
  }
}
