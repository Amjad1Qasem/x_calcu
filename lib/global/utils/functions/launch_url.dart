
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show launchUrl, LaunchMode;
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class LaunchUrl {
 
  Future<void> launchEmail(String? email) async {
    
    final isAuthenticated = getIt<AppStateModel>().isAuthenticated;
    if (email == null || email.isEmpty || !isAuthenticated) return;
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (!await launchUrl(emailUri)) {
      debugPrint('Could not launch email client');
    }
  }

  Future<void> launchPhone(String? phoneNumber) async {
    final isAuthenticated = getIt<AppStateModel>().isAuthenticated;
    if (phoneNumber == null || phoneNumber.isEmpty || !isAuthenticated) return;
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (!await launchUrl(phoneUri)) {
      debugPrint('Could not launch phone dialer');
    }
  }

}
