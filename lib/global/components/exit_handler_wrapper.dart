import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/global/components/user_messages/popup_widget.dart';

class CustomTabScreenWrapper extends StatelessWidget {
  final Widget child;

  const CustomTabScreenWrapper({super.key, required this.child});

  Future<bool> _showExitConfirmDialog(BuildContext context) async {
    final completer = Completer<bool>();
    openDialog(
      context: context,
      title: "exit_app".tr(),
      textBtn1: "no".tr(),
      textBtn2: "yes".tr(),
      onPressedBtn1: () async {
        await Navigator.of(context, rootNavigator: true).maybePop();
        completer.complete(false);
      },
      onPressedBtn2: () async {
        context.pop();
        // await Navigator.of(context, rootNavigator: true).maybePop();
        completer.complete(true);
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
