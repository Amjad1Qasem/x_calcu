import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/global/components/x_calc/statistic_card_widget.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/functions/launch_url.dart';

class PartnerInfoWidget extends StatelessWidget {
  const PartnerInfoWidget({super.key, required this.partnerDetails});

  final PartnerModel partnerDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Visibility(
            visible: partnerDetails.email != null,
            child: GestureDetector(
              onTap: () => LaunchUrl().launchEmail(partnerDetails.email),
              child: StatisticCardWidget(
                backgroundColor: Utils(context).white.withValues(alpha: 0.1),
                borderColor: Utils(context).primary.withValues(alpha: 0.2),
                fontColor: Utils(context).primary.withValues(alpha: 0.5),
                title: 'email'.tr(),
                value: partnerDetails.email ?? '',
              ),
            ),
          ),
          Visibility(
            visible: partnerDetails.phone != null,
            child: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: GestureDetector(
                onTap: () => LaunchUrl().launchPhone(partnerDetails.phone),
                child: StatisticCardWidget(
                  backgroundColor: Utils(context).white.withValues(alpha: 0.1),
                  borderColor: Utils(context).primary.withValues(alpha: 0.2),
                  fontColor: Utils(context).primary.withValues(alpha: 0.5),
                  title: 'phone'.tr(),
                  value: partnerDetails.phone ?? '',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
