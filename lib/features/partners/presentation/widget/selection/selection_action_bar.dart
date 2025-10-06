import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/partners/cubit/selection/selection_cubit.dart';
import 'package:x_calcu/features/partners/data/models/partner_details_model.dart';
import 'package:x_calcu/features/partners/services/pdf_service.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class SelectionActionBar extends StatelessWidget {
  final List<PartnerDetailsOperation> allOperations;
  final String partnerName;

  const SelectionActionBar({
    super.key,
    required this.allOperations,
    required this.partnerName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
      child: BlocBuilder<SelectionCubit, SelectionState>(
        builder: (context, state) {
          printSuccess('🔍 Selection state: $state');
          return state.when(
            initial: () => const SizedBox.shrink(),
            selectionMode: () => _buildSelectionModeBar(context),
            selectionActive:
                (selectedItems) =>
                    _buildActiveSelectionBar(context, selectedItems),
          );
        },
      ),
    );
  }

  Widget _buildSelectionModeBar(BuildContext context) {
    return Container(
      height: 60.h,
      color: Utils(context).background,
      child: Row(
        children: [
          // Select All Button
          Expanded(
            child: _buildActionButton(
              context: context,
              icon: Iconsax.tick_circle,
              label: 'select_all'.tr(),
              onTap: () {
                context.read<SelectionCubit>().selectAll(allOperations);
              },
              color: Utils(context).primary,
            ),
          ),
          SizedBox(width: 12.w),
          // Cancel Button
          Expanded(
            child: _buildActionButton(
              context: context,
              icon: Iconsax.close_circle,
              label: 'cancel'.tr(),
              onTap: () {
                context.read<SelectionCubit>().exitSelectionMode();
              },
              color: Utils(context).red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveSelectionBar(
    BuildContext context,
    List<PartnerDetailsOperation> selectedItems,
  ) {
    return Container(
      height: 60.h,
      width: double.infinity,
      color: Utils(context).background,
      child: Row(
        children: [
          // Clear Selection Button
          Expanded(
            child: _buildActionButton(
              context: context,
              icon: Iconsax.refresh,
              label: 'clear_selection'.tr(),
              onTap: () {
                context.read<SelectionCubit>().clearSelection();
              },
              color: Colors.orange,
            ),
          ),
          SizedBox(width: 8.w),
          // Share Button
          Expanded(
            child: _buildActionButton(
              context: context,
              icon: Iconsax.share,
              label: 'share'.tr(),
              onTap: () => _handleShare(context, selectedItems),
              color: Utils(context).primary,
            ),
          ),
          SizedBox(width: 8.w),
          // Cancel Button
          Expanded(
            child: _buildActionButton(
              context: context,
              icon: Iconsax.close_circle,
              label: 'cancel'.tr(),
              onTap: () {
                context.read<SelectionCubit>().exitSelectionMode();
              },
              color: Utils(context).red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18.sp, color: color),
            SizedBox(width: 6.w),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleShare(
    BuildContext context,
    List<PartnerDetailsOperation> selectedItems,
  ) async {
    try {
      printSuccess('📤 Sharing ${selectedItems.length} operations');

      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      // Generate and share PDF
      await PdfService.generateAndShareOperationsPdf(
        operations: selectedItems,
        partnerName: partnerName,
      );

      // Close loading dialog
      if (context.mounted) {
        Navigator.of(context).pop();

        // Exit selection mode
        context.read<SelectionCubit>().exitSelectionMode();

        // Show success message
        snackBar(
          context: context,
          title: 'pdf_generated_successfully'.tr(
            namedArgs: {'count': selectedItems.length.toString()},
          ),
          isErrorMessage: false,
        );
      }
    } catch (e) {
      printError('❌ Error sharing PDF: $e');

      // Close loading dialog
      if (context.mounted) {
        Navigator.of(context).pop();

        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('error_generating_pdf'.tr()),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
