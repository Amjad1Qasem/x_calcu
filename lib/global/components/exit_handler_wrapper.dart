import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/global/components/user_messages/popup_widget.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/navigation/navigation_helper.dart';

class CustomTabScreenWrapper extends StatelessWidget {
  final Widget child;

  const CustomTabScreenWrapper({super.key, required this.child});

  Future<bool> _showExitConfirmDialog(BuildContext context) async {
    final completer = Completer<bool>();
    await openDialog(
      context: context,
      title: "exit_app".tr(),
      message: 'هل تريد الخروج من التطبيق؟',
      icon: Icons.exit_to_app,
      iconColor: Utils(context).primary,
      iconBackgroundColor: Utils(context).primary.withValues(alpha: 0.1),
      confirmText: "yes".tr(),
      cancelText: "no".tr(),
      onConfirm: () async {
        context.pop();
        completer.complete(true);
      },
      onCancel: () async {
        NavigationHelper.safePop(context);
        completer.complete(false);
      },
    );

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final nav = Navigator.of(context);
        if (nav.canPop()) {
          return true;
        } else {
          final shouldExit = await _showExitConfirmDialog(context);
          if (shouldExit) {
            SystemNavigator.pop();
          }
          return false;
        }
      },
      child: child,
    );
  }
}
