import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/partners/data/models/statistic_partner_model.dart';
import 'package:x_calcu/features/partners/data/models/partner_details_model.dart';
import 'package:x_calcu/global/components/x_calc/statistic_card_widget.dart';

class StatisticsLoadedWidget extends StatelessWidget {
  final List<StatisticPartnerModel>? apiStatistics;
  final PartnerDetailsStatistic? partnerStatistics;

  const StatisticsLoadedWidget({
    super.key,
    this.apiStatistics,
    this.partnerStatistics,
  });

  @override
  Widget build(BuildContext context) {
    if (partnerStatistics != null) {
      return _buildPartnerStatistics(context);
    } else if (apiStatistics != null) {
      return _buildApiStatistics(context);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildPartnerStatistics(BuildContext context) {
    final stats = partnerStatistics!;
    final statisticsList = [
      {
        'title': 'مجاميع قيم الفواتير',
        'value': stats.totalInvoiceValues.toStringAsFixed(0),
      },
      {
        'title': 'مجاميع سداد الفواتير',
        'value': stats.totalInvoicePayments.toStringAsFixed(0),
      },
      {
        'title': 'باقي الفواتير',
        'value': stats.remainingInvoices.toStringAsFixed(0),
      },
      {'title': 'المبلغ المستحقة', 'value': stats.dueAmount.toStringAsFixed(0)},
      {
        'title': 'المبلغ المقبوضة',
        'value': stats.receivedAmount.toStringAsFixed(0),
      },
      {
        'title': 'المبلغ المتبقية',
        'value': stats.remainingAmount.toStringAsFixed(0),
      },
      {'title': 'الارباح', 'value': stats.profits.toStringAsFixed(0)},
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 11.sp,
            crossAxisSpacing: 12.sp,
            childAspectRatio: 9 / 3.5,
            crossAxisCount: 2,
          ),
          shrinkWrap: true,
          itemCount: statisticsList.length - 1,
          itemBuilder: (context, index) {
            final stat = statisticsList[index];
            final color = colorConfigs[index % colorConfigs.length];

            return StatisticCardWidget(
              backgroundColor: color.backgroundColor,
              borderColor: color.borderColor,
              fontColor: color.fontColor,
              title: stat['title']!,
              value: stat['value']!,
            );
          },
        ),

        Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: StatisticCardWidget(
            backgroundColor: colorConfigs.last.backgroundColor,
            borderColor: colorConfigs.last.borderColor,
            fontColor: colorConfigs.last.fontColor,
            title: statisticsList.last['title']!,
            value: statisticsList.last['value']!,
          ),
        ),
      ],
    );
  }

  Widget _buildApiStatistics(BuildContext context) {
    final stats = apiStatistics!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 11.sp,
            crossAxisSpacing: 12.sp,
            childAspectRatio: 9 / 3.5,
            crossAxisCount: 2,
          ),
          shrinkWrap: true,
          itemCount: stats.length - 1,
          itemBuilder: (context, index) {
            final stat = stats[index];
            final color = colorConfigs[index % colorConfigs.length];

            return StatisticCardWidget(
              backgroundColor: color.backgroundColor,
              borderColor: color.borderColor,
              fontColor: color.fontColor,
              title: stat.title,
              value: stat.value,
            );
          },
        ),

        Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: StatisticCardWidget(
            backgroundColor: colorConfigs.last.backgroundColor,
            borderColor: colorConfigs.last.borderColor,
            fontColor: colorConfigs.last.fontColor,
            title: stats.last.title,
            value: stats.last.value,
          ),
        ),
      ],
    );
  }
}
