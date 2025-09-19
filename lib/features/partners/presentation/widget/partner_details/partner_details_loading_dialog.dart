import 'package:flutter/material.dart';

class PartnerDetailsLoadingDialog extends StatelessWidget {
  const PartnerDetailsLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const PartnerDetailsLoadingDialog(),
    );
  }

  static void hide(BuildContext context) {
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}
