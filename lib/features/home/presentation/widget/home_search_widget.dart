import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/home/cubit/home_cubit.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class HomeSearchWidget extends StatefulWidget {
  final bool isExpanded;
  final VoidCallback onToggle;

  const HomeSearchWidget({
    super.key,
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  State<HomeSearchWidget> createState() => _HomeSearchWidgetState();
}

class _HomeSearchWidgetState extends State<HomeSearchWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    if (widget.isExpanded) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(HomeSearchWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _animationController.forward();
        _searchFocusNode.requestFocus();
      } else {
        _animationController.reverse();
        _searchFocusNode.unfocus();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _performSearch() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      getIt<HomeCubit>().searchOperations(query);
    }
  }

  void _clearSearch() {
    _searchController.clear();
    getIt<HomeCubit>().clearSearch();
  }

  void _onSearchChanged(String value) {
    print('🔍 Search text changed: "$value"');

    if (value.isEmpty) {
      _clearSearch();
    } else {
      // Add debouncing for better performance
      Future.delayed(const Duration(milliseconds: 300), () {
        if (_searchController.text == value) {
          print('🔍 Triggering search for: "$value"');
          _performSearch();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: getIt<HomeCubit>(),
      builder: (context, state) {
        // Clear search text when search is cleared
        if (state is SearchCleared && _searchController.text.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _searchController.clear();
          });
        }

        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return SizeTransition(
              sizeFactor: _animation,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Utils(context).primaryContainer,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: TextField(
                          controller: _searchController,
                          focusNode: _searchFocusNode,
                          onSubmitted: (_) => _performSearch(),
                          onChanged: _onSearchChanged,
                          style: Utils(
                            context,
                          ).normalText.copyWith(fontSize: 16.sp),
                          decoration: InputDecoration(
                            hintText: 'search_processes'.tr(),
                            hintStyle: Utils(context).normalText.copyWith(
                              fontSize: 16.sp,
                              color: Utils(context).secondTextColor,
                            ),
                            prefixIcon: Icon(
                              Iconsax.search_normal_1_copy,
                              color: Utils(context).primTextColor,
                              size: 20.sp,
                            ),
                            suffixIcon:
                                _searchController.text.isNotEmpty
                                    ? IconButton(
                                      icon: Icon(
                                        Iconsax.close_circle,
                                        color: Utils(context).primTextColor,
                                        size: 20.sp,
                                      ),
                                      onPressed: _clearSearch,
                                    )
                                    : state is Searching
                                    ? SizedBox(
                                      width: 20.sp,
                                      height: 20.sp,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Utils(context).primary,
                                            ),
                                      ),
                                    )
                                    : null,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 15.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // if (widget.isExpanded) ...[
                    //   CommonSizes.hSmallestSpace,
                    //   GestureDetector(
                    //     onTap: widget.onToggle,
                    //     child: Container(
                    //       padding: EdgeInsets.all(12.sp),
                    //       decoration: BoxDecoration(
                    //         color: Utils(context).primaryContainer,
                    //         borderRadius: BorderRadius.circular(14.r),
                    //       ),
                    //       child: Icon(
                    //         Iconsax.close_circle,
                    //         color: Utils(context).primTextColor,
                    //         size: 20.sp,
                    //       ),
                    //     ),
                    //   ),
                    // ],
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
