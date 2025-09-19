import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/data/saved_account_model.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class AccountSelectionBottomSheet extends StatelessWidget {
  final List<SavedAccountModel> accounts;
  final Function(SavedAccountModel) onAccountSelected;
  final Function(SavedAccountModel) onDeleteAccount;

  const AccountSelectionBottomSheet({
    super.key,
    required this.accounts,
    required this.onAccountSelected,
    required this.onDeleteAccount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        color: Utils(context).background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Utils(context).secondTextColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 20.h),

          // Title
          Text(
            'select_account'.tr(),
            style: Utils(context).blackBigText.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),

          // Accounts list
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: accounts.length,
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                final account = accounts[index];
                return _buildAccountCard(context, account);
              },
            ),
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildAccountCard(BuildContext context, SavedAccountModel account) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Utils(context).primaryContainer,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color:
              account.isLastUsed
                  ? Utils(context).primary
                  : Utils(context).primary.withOpacity(0.2),
          width: account.isLastUsed ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Utils(context).primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Iconsax.user,
              color: Utils(context).primary,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),

          // Account info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        account.displayName,
                        style: Utils(context).normalText.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (account.isLastUsed)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Utils(context).primary,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          'last_used'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  account.username,
                  style: Utils(context).secondText.copyWith(fontSize: 14.sp),
                ),
                SizedBox(height: 2.h),
                Text(
                  '${'saved_on'.tr()} ${_formatDate(account.savedAt)}',
                  style: Utils(context).secondText.copyWith(fontSize: 12.sp),
                ),
              ],
            ),
          ),

          // Action buttons
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Select button
              GestureDetector(
                onTap: () => onAccountSelected(account),
                child: Container(
                  padding: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                    color: Utils(context).primary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Iconsax.login_1,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
              SizedBox(width: 8.w),

              // Delete button
              GestureDetector(
                onTap: () => _showDeleteConfirmation(context, account),
                child: Container(
                  padding: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(Iconsax.trash, color: Colors.red, size: 20.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    SavedAccountModel account,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('delete_account'.tr()),
            content: Text('delete_account_confirmation'.tr()),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('cancel'.tr()),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onDeleteAccount(account);
                },
                child: Text('delete'.tr(), style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
