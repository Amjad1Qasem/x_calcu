import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_calcu/features/privacy_policy/data/privacy_policy_model.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  Widget _buildPolicySection(BuildContext context, PrivacyPolicyModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.key ?? '',
            style: Utils(
              context,
            ).normalText.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          CommonSizes.vSmallestSpace,
          ...?model.values?.map(
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
            RichText(
              text: TextSpan(
                style: Utils(context).normalText,
                children: [
                  const TextSpan(text: 'نحن في '),
                  TextSpan(
                    text: 'X Calcul',
                    style: Utils(
                      context,
                    ).normalText.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        ' نحترم خصوصية مستخدمينا ونسعى لضمان حماية جميع البيانات الشخصية التي يتم جمعها ومعالجتها. تشرح هذه السياسة كيف نقوم بجمع واستخدام ومشاركة البيانات عند استخدامك لمنصتنا.',
                  ),
                ],
              ),
            ),
            CommonSizes.vSmallSpace,
            ...policyData.map((e) => _buildPolicySection(context, e)),
            CommonSizes.vBigSpace,
          ],
        ),
      ),
    );
  }
}
