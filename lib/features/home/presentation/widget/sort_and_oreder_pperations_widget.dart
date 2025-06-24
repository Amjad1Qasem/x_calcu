// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
// import 'package:x_calcu/features/home/cubit/home_cubit.dart';
// import 'package:x_calcu/global/components/bottom_dialog/show_filter_bottom_sheet.dart';
// import 'package:x_calcu/global/design/themes/themes.dart';
// import 'package:x_calcu/global/utils/di/dependency_injection.dart';

// class SortAndOrederOperationsWidget extends StatelessWidget {
//   const SortAndOrederOperationsWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<String> sortOptions = [
//       // 'price_low_to_high',
//       // 'price_high_to_low',
//       'name_a_to_z',
//       'name_z_to_a',
//     ];
//     return BlocBuilder<HomeCubit, HomeState>(
//       bloc: getIt<HomeCubit>(),
//       buildWhen: (_, __) => true,
//       builder: (context, state) {
//         String selectedSortOption = sortOptions.first;
//         // getIt<HomeCubit>().sortBy != ''
//         //     ? getIt<HomeCubit>().sortBy
//         //     : sortOptions.first;
//         return Positioned(
//           bottom: 20.sp,
//           // --- Changes here for centering ---
//           // left: 60,
//           // right: 60,
//           // Visibility:
//           // getIt<HomeCubit>().jobsPagingController.items?.isNotEmpty ??
//           //         false,
//           // bottom: 20.sp,
//           // left: MediaQuery.of(context).size.width * 0.34,
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 6.sp),
//             decoration: BoxDecoration(
//               color: Utils(context).darkCardColor,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black87.withValues(alpha: 0.3),
//                   spreadRadius: 2,
//                   blurRadius: 1,
//                   offset: const Offset(1, 1),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Iconsax.gps_copy, size: 21.sp),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 10.sp),
//                   width: 1,
//                   color: Colors.grey[800],
//                   height: 20.sp,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     showFilterBottomSheet(
//                       height: 200,
//                       context,
//                       sortOptions,
//                       selectedSortOption,
//                       (value) {
//                         debugPrint('sort by $value');
//                         // getIt<HomeCubit>().setSortBy(value);
//                       },
//                     );
//                   },
//                   child: Icon(Iconsax.sort_copy, size: 21.sp),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/home/cubit/home_cubit.dart';
import 'package:x_calcu/global/components/bottom_dialog/show_filter_bottom_sheet.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class SortAndOrederOperationsWidget extends StatelessWidget {
  const SortAndOrederOperationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> sortOptions = ['name_a_to_z', 'name_z_to_a'];
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: getIt<HomeCubit>(),
      buildWhen: (_, __) => true,
      builder: (context, state) {
        String selectedSortOption = sortOptions.first;
        return Positioned(
          bottom: 20.sp,
          left: 0, // Set left to 0
          right: 0, // Set right to 0, which makes the child fill the width
          child: Center(
            // Wrap the Container with Center to truly center it horizontally
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 6.sp),
              decoration: BoxDecoration(
                color: Utils(context).darkCardColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87.withValues(alpha: 0.3),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Iconsax.gps_copy, size: 21.sp),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.sp),
                    width: 1,
                    color: Colors.grey[800],
                    height: 20.sp,
                  ),
                  GestureDetector(
                    onTap: () {
                      showFilterBottomSheet(
                        height: 200,
                        context,
                        sortOptions,
                        selectedSortOption,
                        (value) {
                          debugPrint('sort by $value');
                          // getIt<HomeCubit>().setSortBy(value);
                        },
                      );
                    },
                    child: Icon(Iconsax.sort_copy, size: 21.sp),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
