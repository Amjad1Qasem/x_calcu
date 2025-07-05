import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/partners/data/models/statistic_partner_model.dart';
import 'package:x_calcu/global/components/x_calc/statistic_card_widget.dart';

class StatisticsLoadedWidget extends StatelessWidget {
  final List<StatisticPartnerModel> apiStatistics;

  const StatisticsLoadedWidget({super.key, required this.apiStatistics});

  @override
  Widget build(BuildContext context) {
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
          itemCount: apiStatistics.length - 1,
          itemBuilder: (context, index) {
            final stat = apiStatistics[index];
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
            title: apiStatistics.last.title,
            value: apiStatistics.last.value,
          ),
        ),
      ],
    );
  }
}
