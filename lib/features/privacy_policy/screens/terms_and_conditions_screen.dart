import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  Widget _buildTermsSection(
    BuildContext context,
    String titleKey,
    String contentKey,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleKey.tr(),
            style: Utils(
              context,
            ).normalText.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          CommonSizes.vSmallestSpace,
          Text(contentKey.tr(), style: Utils(context).normalText),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Skaffold(
      isAppBarNull: false,
      isBack: true,
      title: "terms_and_conditions".tr(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("terms_intro".tr(), style: Utils(context).normalText),
            CommonSizes.vSmallSpace,
            Text("terms_acceptance".tr(), style: Utils(context).normalText),
            CommonSizes.vSmallSpace,
            _buildTermsSection(context, "terms_use", "terms_use_content"),
            _buildTermsSection(
              context,
              "terms_limitations",
              "terms_limitations_content",
            ),
            _buildTermsSection(
              context,
              "terms_accuracy",
              "terms_accuracy_content",
            ),
            _buildTermsSection(
              context,
              "terms_modifications",
              "terms_modifications_content",
            ),
            _buildTermsSection(
              context,
              "terms_governing_law",
              "terms_governing_law_content",
            ),
            CommonSizes.vBigSpace,
          ],
        ),
      ),
    );
  }
}
