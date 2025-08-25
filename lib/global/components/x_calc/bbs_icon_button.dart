// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:x_calcu/global/design/themes/themes.dart';

// class BBSIconButton extends StatelessWidget {
//   final String text;
//   final IconData activeIcon;
//   final IconData inactiveIcon;
//   final VoidCallback onPressed;
//   final Color? fillColor;
//   final Color? textColor;
//   final Color? iconColor;
//   final EdgeInsetsGeometry? padding;
//   final EdgeInsetsGeometry? margin;
//   final double borderRadius;
//   final bool active;
//   final bool disabled;
//   final bool loading;
//   final double iconSize;
//   final TextStyle textStyle;

//   const BBSIconButton({
//     super.key,
//     required this.text,
//     required this.activeIcon,
//     required this.inactiveIcon,
//     required this.onPressed,
//     this.fillColor,
//     this.textColor,
//     this.iconColor,
//     this.padding,
//     this.margin,
//     this.borderRadius = 8.0,
//     this.active = false,
//     this.disabled = false,
//     this.loading = false,
//     this.textStyle = const TextStyle(fontWeight: FontWeight.w500),
//     this.iconSize = 18,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//       opacity: disabled ? 0.6 : 1,
//       child: Container(
//         margin:
//             margin ?? EdgeInsets.symmetric(horizontal: 2.0.sp, vertical: 5.sp),
//         decoration: BoxDecoration(
//           color: disabled ? Colors.grey[400] : fillColor ?? Colors.transparent,
//           borderRadius: BorderRadius.circular(borderRadius),
//           border: fillColor == null
//               ? Border.all(
//                   color: Colors.grey.withValues(alpha: 0.5),
//                   width: 1.5,
//                 )
//               : null,
//         ),
//         child: AnimatedPadding(
//           duration: const Duration(milliseconds: 0),
//           padding: padding ??
//               EdgeInsets.symmetric(
//                   horizontal: 1.0.sp, vertical: loading ? 0 : 6.sp),
//           child: GestureDetector(
//             onTap: onPressed,
//             child: loading
//                 ? const Center(
//                     child: LoadingDotWidget(),
//                   )
//                 : Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         active ? activeIcon : inactiveIcon,
//                         color: iconColor ??
//                             (fillColor == null ? Colors.black : Colors.white),
//                         size: iconSize,
//                       ),
//                       SizedBox(width: 2.0.sp),
//                       Text(
//                         text,
//                         style: textStyle,
//                       ),
//                     ],
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LoadingDotWidget extends StatelessWidget {
//   const LoadingDotWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return LoadingAnimationWidget.waveDots(
//       color: Utils(context).primary,
//       size: 27.sp,
//     );
//   }
// }
