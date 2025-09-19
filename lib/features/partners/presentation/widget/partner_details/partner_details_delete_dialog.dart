import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class PartnerDetailsDeleteDialog extends StatelessWidget {
  final PartnerModel partner;
  final VoidCallback onConfirmDelete;

  const PartnerDetailsDeleteDialog({
    super.key,
    required this.partner,
    required this.onConfirmDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'delete_partner'.tr(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Utils(context).primary,
        ),
      ),
      content: Text(
        'delete_partner_confirmation'.tr(
          namedArgs: {'name': partner.name ?? 'Unknown'},
        ),
        style: TextStyle(color: Utils(context).secondTextColor),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'cancel'.tr(),
            style: TextStyle(color: Utils(context).secondTextColor),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirmDelete();
          },
          child: Text(
            'delete'.tr(),
            style: TextStyle(
              color: Utils(context).red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  static void show(
    BuildContext context,
    PartnerModel partner,
    VoidCallback onConfirmDelete,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PartnerDetailsDeleteDialog(
          partner: partner,
          onConfirmDelete: onConfirmDelete,
        );
      },
    );
  }
}
