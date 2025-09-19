import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_calcu/features/privacy_policy/data/privacy_policy_model.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  Widget _buildPolicySection(BuildContext context, PrivacyPolicyModel model) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final title = isArabic ? model.key : model.keyEn;
    final values = isArabic ? model.values : model.valuesEn;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: Utils(
              context,
            ).normalText.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          CommonSizes.vSmallestSpace,
          ...?values?.map(
            (val) => Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(val, style: Utils(context).normalText),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final policyData = getFakePolicyData();
    return Skaffold(
      isAppBarNull: false,
      isBack: true,
      title: "privacy_policy".tr(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("privacy_policy_intro".tr(), style: Utils(context).normalText),
            CommonSizes.vSmallSpace,
            ...policyData.map((e) => _buildPolicySection(context, e)),
            CommonSizes.vBigSpace,
          ],
        ),
      ),
    );
  }
}
