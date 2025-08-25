// Sticky Filter Header
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/home/cubit/home_cubit.dart';
import 'package:x_calcu/global/components/x_calc/animated_toggle_button.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class FilterHeaderHomeWidget extends SliverPersistentHeaderDelegate {
  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    final cubit = getIt<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
        return Container(
          color: Utils(context).background,
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0.h),
          child: Center(
            child: AnimatedToggleButton(
              values: ["input".tr(), "output".tr()],
              state: cubit.isInput,
              onTap: () => cubit.operationFilter(),
              //  cubit.toggleHideCompanyName(),
            ),
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
