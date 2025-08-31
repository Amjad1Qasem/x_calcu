import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/home/cubit/home_cubit.dart';
import 'package:x_calcu/features/home/presentation/widget/app_bar_search_widget.dart';
import 'package:x_calcu/features/home/presentation/widget/home_search_widget.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class HomeSearchSection extends StatelessWidget {
  final bool isSearchExpanded;
  final VoidCallback onSearchToggle;
  final VoidCallback onSearchCollapse;

  const HomeSearchSection({
    super.key,
    required this.isSearchExpanded,
    required this.onSearchToggle,
    required this.onSearchCollapse,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Original search button (when search is collapsed)
        if (!isSearchExpanded)
          GestureDetector(
            onTap: onSearchToggle,
            child: const AppBarSearchWidget(),
          ),

        // Expandable search widget
        HomeSearchWidget(
          isExpanded: isSearchExpanded,
          onToggle: onSearchCollapse,
        ),

        // Search indicator
        if (getIt<HomeCubit>().isSearching)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            child: Row(
              children: [
                Icon(
                  Iconsax.search_normal_1_copy,
                  size: 16.sp,
                  color: Utils(context).primary,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Searching for "${getIt<HomeCubit>().searchQuery}"',
                  style: Utils(context).normalText.copyWith(
                    fontSize: 12.sp,
                    color: Utils(context).primary,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
