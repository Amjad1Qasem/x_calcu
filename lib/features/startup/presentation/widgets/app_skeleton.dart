import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/color_app.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/color_app.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/color_app.dart';

class AppSkeleton extends StatefulWidget {
  const AppSkeleton({super.key});

  @override
  State<AppSkeleton> createState() => _AppSkeletonState();
}

class _AppSkeletonState extends State<AppSkeleton> {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setSystemUIOverlayStyle(
    // SystemUiOverlayStyle(statusBarColor: ColorManager.primaryColor),
    // );

    // Future.delayed(const Duration(seconds: 5), () {
    // Add your navigation or transition logic here
    // Navigator.pushReplacement(...);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Skaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: isLight ? Colors.white : Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                  isLight
                      ? 'assets/images/boarding_logo.png'
                      : 'assets/images/boarding_logo.png',
                  width: screenWidth / 1.8,
                  fit: BoxFit.contain,
                )
                .animate()
                .fadeIn(duration: const Duration(milliseconds: 800))
                .slideY(begin: -0.3, end: 0),
            const SizedBox(height: 40),
            const Text(
              'Welcome to XCalcu',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ).animate().fadeIn(
              duration: const Duration(milliseconds: 700),
              delay: const Duration(milliseconds: 300),
            ),
            const SizedBox(height: 50),
            CircularProgressIndicator(
              strokeWidth: 2.5,
              color: ColorManager.primaryColor,
            ).animate().fadeIn(
              delay: const Duration(milliseconds: 1000),
              duration: const Duration(milliseconds: 600),
            ),
          ],
        ),
      ),
    );
  }
}

// class AppSkeleton extends StatelessWidget {
//   const AppSkeleton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final islight = Theme.of(context).brightness == Brightness.light;

//     return Skaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Transform.translate(
//               offset: const Offset(0, 46),
//               child: Image.asset(
//                 islight
//                     ? 'assets/images/boarding_logo.png'
//                     : 'assets/images/app_logo_dark.png',
//                 width: screenWidth / 1.40,
//                 fit: BoxFit.contain,
//               ).animate().fadeIn(duration: const Duration(milliseconds: 800)),
//             ),
//             Transform.translate(
//               offset: const Offset(0, 100),
//               child: const CircularProgressIndicator(
//                 strokeWidth: 2.5,
//               ).animate().fadeIn(
//                 delay: const Duration(milliseconds: 1000),
//                 duration: const Duration(milliseconds: 500),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AppSkeleton extends StatefulWidget {
//   const AppSkeleton({super.key});

//   @override
//   State<AppSkeleton> createState() => _AppSkeletonState();
// }

// class _AppSkeletonState extends State<AppSkeleton> {
//   @override
//   void initState() {
//     SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle(statusBarColor: ColorManager.primaryColor),
//     );

//     // Future.delayed(const Duration(milliseconds: 2700), () async {
//     //   if (await Vibration.hasVibrator()) {
//     //     Vibration.vibrate(preset: VibrationPreset.pulseWave);
//     //   }
//     // });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Center(
//         // color: Colors.amber,
//         child: Image.asset(
//           'assets/images/boarding_logo.png',
//           scale: 3.5,
//           // width: size.width / 2,
//           // height: size.width / 2,
//         ),
//       ).animate().fadeIn(
//         // delay: const Duration(milliseconds: 2000),
//         duration: const Duration(seconds: 1),
//       ),
//       // Center(
//       //   child: Column(
//       //     mainAxisSize: MainAxisSize.min,
//       //     mainAxisAlignment: MainAxisAlignment.end,
//       //     children: [
//       //       Center(
//       //         // color: Colors.amber,
//       //         child: Image.asset(
//       //           'assets/images/boarding_logo.png',
//       //           // width: size.width / 2,
//       //           // height: size.width / 2,
//       //         ),
//       //       ).animate().fadeIn(
//       //           // delay: const Duration(milliseconds: 2000),
//       //           duration: const Duration(seconds: 1)),
//       //       CommonSizes.vLargeSpace,
//       //       const Center(
//       //         child: CircularProgressIndicator(strokeCap: StrokeCap.round),
//       //       ).animate().fadeIn(
//       //           delay: const Duration(milliseconds: 2000),
//       //           duration: const Duration(seconds: 1)),
//       //     ],
//       //   ),
//       // ),
//     );

//     // return Scaffold(
//     //   body: Stack(
//     //     children: [
//     //       Column(
//     //         children: [
//     //           Container(
//     //             color: Utils(context).primary,
//     //             width: double.infinity,
//     //             height: size.height / 2,
//     //           ).animate().slideY(
//     //             begin: -1,
//     //             end: 0,
//     //             duration: const Duration(milliseconds: 1000),
//     //             curve: Curves.easeInOut,
//     //           ),
//     //           Expanded(
//     //             child: Container(
//     //               color: Utils(context).primary,
//     //               width: double.infinity,
//     //             ).animate().slideY(
//     //               begin: 1,
//     //               end: 0,
//     //               duration: const Duration(milliseconds: 1000),
//     //               curve: Curves.easeInOut,
//     //             ),
//     //           ),
//     //         ],
//     //       ),
//     //       Center(
//     //         child: Container(
//     //           width: 50,
//     //           height: 50,
//     //           decoration: BoxDecoration(
//     //             color: ColorManager.darkBlue,
//     //             borderRadius: BorderRadius.circular(50),
//     //           ),
//     //         ).animate().scale(
//     //           delay: const Duration(milliseconds: 1100),
//     //           duration: const Duration(milliseconds: 700),
//     //           begin: const Offset(0, 0),
//     //           end: const Offset(50, 50),
//     //         ),
//     //       ),
//     //       Center(
//     //         child: Container(
//     //           width: 170.sp,
//     //           height: 170.sp,
//     //           decoration: BoxDecoration(
//     //             color: ColorManager.primaryColor,
//     //             borderRadius: BorderRadius.circular(100),
//     //           ),
//     //         ).animate().fadeIn(
//     //           delay: const Duration(milliseconds: 1900),
//     //           duration: const Duration(milliseconds: 700),
//     //           begin: 0,
//     //         ),
//     //       ),
//     //       Transform.translate(
//     //         offset: Offset(-5.sp, 0),
//     //         child: Center(
//     //           child: Directionality(
//     //             textDirection: TextDirection.ltr,
//     //             child: Row(
//     //               mainAxisAlignment: MainAxisAlignment.center,
//     //               crossAxisAlignment: CrossAxisAlignment.center,
//     //               children: [
//     //                 Transform.translate(
//     //                       offset: Offset(5.sp, 0),
//     //                       child: Transform.rotate(
//     //                         angle: -3.14 / 2,
//     //                         child: Text(
//     //                           'XSECURE',
//     //                           style: TextStyle(
//     //                             color: Colors.orange,
//     //                             fontSize: 40.sp,
//     //                             fontWeight: FontWeight.w700,
//     //                           ),
//     //                         ),
//     //                       ),
//     //                     )
//     //                     .animate()
//     //                     .fadeIn(delay: const Duration(milliseconds: 1200))
//     //                     .then()
//     //                     .rotate(
//     //                       duration: const Duration(milliseconds: 700),
//     //                       curve: Curves.easeInOut,
//     //                       begin: 0.25,
//     //                       end: 0,
//     //                     )
//     //                     .then()
//     //                     .slideX(begin: 1, end: 0),
//     //                 Column(
//     //                   mainAxisSize: MainAxisSize.min,
//     //                   crossAxisAlignment: CrossAxisAlignment.center,
//     //                   children: [
//     //                     Transform.translate(
//     //                       offset: Offset(-10.sp, 5),
//     //                       child: Text(
//     //                         'GMBH',
//     //                         style: TextStyle(
//     //                           color: Colors.white,
//     //                           fontSize: 35.sp,
//     //                           fontWeight: FontWeight.w700,
//     //                         ),
//     //                       ),
//     //                     ),
//     //                     Transform.translate(
//     //                       offset: Offset(-10.sp, -5),
//     //                       child: Text(
//     //                         'FAST AND SAVE',
//     //                         style: TextStyle(
//     //                           color: Colors.white,
//     //                           fontSize: 35.sp,
//     //                           fontWeight: FontWeight.w700,
//     //                         ),
//     //                       ),
//     //                     ),
//     //                   ],
//     //                 ).animate().fadeIn(
//     //                   delay: const Duration(milliseconds: 1900),
//     //                 ),
//     //               ],
//     //             ),
//     //           ),
//     //         ),
//     //       ),
//     //       Positioned(
//     //         bottom: 100.sp,
//     //         left: 5,
//     //         right: 5,
//     //         child: const Center(
//     //           child: CircularProgressIndicator(
//     //             color: Colors.white,
//     //             strokeCap: StrokeCap.round,
//     //           ),
//     //         ),
//     //       ).animate().fadeIn(
//     //         delay: const Duration(milliseconds: 4000),
//     //         duration: const Duration(seconds: 1),
//     //       ),
//     //     ],
//     //   ),
//     // );
//   }
// }
// // */
