import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class SkipText extends StatelessWidget {
  const SkipText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(RouterPath.mainLayout),
      child: Text(
        'skip'.tr(),
        style: Utils(
          context,
        ).clickbleText.copyWith(decoration: TextDecoration.underline),
      ),
    );
  }
}
