
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
// import 'package:x_calcu/global/components/dialogs/bbs_alert.dart';
// import 'package:x_calcu/global/core/app_state.dart';
// import 'package:x_calcu/global/design/common_sizes.dart';
// import 'package:x_calcu/global/design/themes/themes.dart';
// import 'package:x_calcu/global/utils/custom_utils/image_utils.dart';
// import 'package:x_calcu/global/utils/di/dependency_injection.dart';
// import 'package:x_calcu/global/utils/router/router_path.dart';

// void showNotificationDialog(
//     BuildContext context, NotificationsModel notification) {
//   showModalBottomSheet(
//     context: context,
//     useSafeArea: true,
//     isScrollControlled: true,
//     useRootNavigator: true,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//     ),
//     builder: (context) {
//       final cubit = getIt<NotificationsBloc>();

//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CommonSizes.vSmallestSpace,
//             ImageUtils(
//               imageUrl: notification.type != NotificationType.systemMessage
//                   ? notification.image ?? Assets.App_Logo
//                   : Assets.App_Logo,
//               width: 70.sp,
//               height: 70.sp,
//               isCircular: true,
//               shimmerLoading: true,
//             ),
//             CommonSizes.vSmallestSpace,

//             Text(
//               notification.body ?? 'no body',
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 16),
//             ),
//             CommonSizes.vSmallestSpace,
//             Divider(color: Colors.grey[300]),
//             _buildActionButton(
//               context: context,
//               icon: Iconsax.export_3_copy,
//               label: 'view_details'.tr(),
//               onTap: () {
//                 Navigator.pop(context);
//                 if (notification.type == NotificationType.pointsAdded) {
//                   context.push(RouterPath.paymentScreen);
//                 } else {
//                   context.push(RouterPath.viewAdvertisementPage,
//                       extra: int.tryParse(
//                           // notification.payload?['ads_id'].toString() ??
//                           '87') ?? 87);
//                 }
//                 debugPrint('open screen');
//               },
//             ),
//             _buildActionButton(
//               context: context,
//               icon: Iconsax.flag_copy,
//               label: 'mark_notification_as_read'.tr(),
//               onTap: () {
//                 Navigator.pop(context);
//                 cubit.markSingleNotificationAsRead(id: notification.id!);
//                 // getIt<AppStateModel>().markAsSeenNotification();

//                 debugPrint('Marked as read');
//               },
//             ),
//             _buildActionButton(
//               context: context,
//               icon: Iconsax.direct_notification_copy,
//               label: 'mark_notifications_all_as_read'.tr(),
//               onTap: () {
//                 getIt<AppStateModel>().markAsSeenNotification();
//                 Navigator.pop(context);
//                 debugPrint('Marked all as read');
//               },
//             ),
//             _buildActionButton(
//               context: context,
//               icon: Iconsax.trash_copy,
//               label: 'delete_notification'.tr(),
//               onTap: () {
//                 Navigator.pop(context);

//                 showAnimatedDialogAfterPop(
//                   context: context,
//                   dialog: BBSAlertDialog(
//                     title: 'delete_notification'.tr(),
//                     message: 'delete_notification_confirm'.tr(),
//                     icon: Iconsax.trash_copy,
//                     iconColor: Colors.red,
//                     iconBackgroundColor: Colors.red[50],
//                     onConfirm: () {
//                       cubit.deleteNotificationAsRead(id: notification.id!);
//                     },
//                     onCancel: () {},
//                   ),
//                 );

//                 debugPrint('Deleted');
//               },
//             ),
//             // _buildActionButton(
//             //   context: context,
//             //   icon: Iconsax.close_circle_copy,
//             //   label: 'close'.tr(),
//             //   onTap: () {
//             //     Navigator.pop(context);
//             //   },
//             // ),
//             // const SizedBox(height: 12),
//           ],
//         ),
//       );
//     },
//   );
// }

// Widget _buildActionButton({
//   required BuildContext context,
//   required IconData icon,
//   required String label,
//   required VoidCallback onTap,
// }) {
//   return ListTile(
//     dense: true,
//     visualDensity: const VisualDensity(vertical: 0),
//     leading: Icon(icon),
//     title: Text(
//       label,
//       style: Utils(context).normalText,
//     ),
//     onTap: onTap,
//     contentPadding: EdgeInsets.zero,
//   );
// }
