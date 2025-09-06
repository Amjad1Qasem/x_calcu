
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/home/cubit/home_cubit.dart';
import 'package:x_calcu/global/components/bottom_dialog/show_advanced_filter_bottom_sheet.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class SortAndOrederOperationsWidget extends StatelessWidget {
  const SortAndOrederOperationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: getIt<HomeCubit>(),
      buildWhen: (_, __) => true,
      builder: (context, state) {
        final cubit = getIt<HomeCubit>();

        // Calculate the bottom position dynamically
        final bottomPadding = MediaQuery.of(context).padding.bottom;
        final bottomNavBarHeight = kBottomNavigationBarHeight;

        // For positioning relative to screen edge
        final additionalSpacing = 20.sp;

        return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            margin: EdgeInsets.only(
              bottom: bottomPadding + bottomNavBarHeight + additionalSpacing,
            ),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.sp,
                  vertical: 6.sp,
                ),
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
                    GestureDetector(
                      onTap: () {
                        // Toggle between asc and desc based on current value
                        final newOrderBy =
                            cubit.orderBy == 'asc' ? 'desc' : 'asc';
                        cubit.setOrderBy(newOrderBy);
                      },
                      child: Icon(Iconsax.sort_copy, size: 21.sp),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.sp),
                      width: 1,
                      color: Colors.grey[800],
                      height: 20.sp,
                    ),
                    GestureDetector(
                      onTap: () {
                        final currentFilter = FilterData(
                          orderBy: cubit.orderBy,
                          startDate: cubit.startDate,
                          endDate: cubit.endDate,
                        );

                        showAdvancedFilterBottomSheet(context, currentFilter, (
                          filterData,
                        ) {
                          cubit.setOrderBy(filterData.orderBy);
                          cubit.setDateRange(
                            filterData.startDate,
                            filterData.endDate,
                          );
                        });
                      },
                      child: Icon(Iconsax.calendar_1_copy, size: 21.sp),
                    ),
             
             
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
