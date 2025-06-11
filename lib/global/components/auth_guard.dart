
import 'package:flutter/material.dart';
import 'package:x_calcu/global/components/user_messages/popup_widget.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;

  const AuthGuard({
    super.key,
    required this.child,
  });

  void _showLoginPopup(BuildContext context) {
    loginRequiredDialog(context: context);
  }

  void _handleTap(BuildContext context) {
    final isLoggedIn = getIt<AppStateModel>().isAuthenticated;

    if (!isLoggedIn) {
      _showLoginPopup(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = getIt<AppStateModel>().isAuthenticated;

    return GestureDetector(
      onTap: () => _handleTap(context),
      child: AbsorbPointer(
        absorbing: !isLoggedIn,
        child: child,
      ),
    );
  }
}
