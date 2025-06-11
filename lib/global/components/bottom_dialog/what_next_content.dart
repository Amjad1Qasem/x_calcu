
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class WhatNextContentDialog extends StatelessWidget {
  WhatNextContentDialog({super.key});

  List<String> whatNextSteps = [
    'step1'.tr(),
    'step2'.tr(),
    'step3'.tr(),
    'step4'.tr(),
    'step5'.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MediaQuery.of(context).viewInsets,
      width: double.maxFinite,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      child: Material(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'whatsNext'.tr(),
                  style: TextStyle(
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800),
                ),
                //CommonSizes.vSmallSpace,
                ListView.separated(
                  shrinkWrap: true,
                  // Ensures it doesn't take infinite height
                  physics: const NeverScrollableScrollPhysics(),
                  // Prevents scrolling inside a parent scroll
                  itemCount: whatNextSteps.length,
                  separatorBuilder: (context, index) =>
                      CommonSizes.vSmallestSpace,
                  itemBuilder: (context, index) {
                    var message = whatNextSteps[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(7.sp),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Utils(context).primary,
                          ),
                          child: Text(
                            "${index + 1}",
                            style: Utils(context)
                                .primaryText
                                .copyWith(color: Colors.white, fontSize: 16.sp),
                          ),
                        ),
                        CommonSizes.hSmallestSpace,
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Text(
                              message,
                              maxLines: 2,
                              style: Utils(context)
                                  .primaryText
                                  .copyWith(fontSize: 16.sp),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                CommonSizes.vBigSpace,
                AppButton(
                  padding: EdgeInsets.zero,
                  label: 'ok'.tr(),
                  onTap: () => context.pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
