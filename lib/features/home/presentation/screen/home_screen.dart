import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/features/home/cubit/home_cubit.dart';
import 'package:x_calcu/features/home/presentation/controller/home_screen_controller.dart';
import 'package:x_calcu/features/home/presentation/widget/filter_header_home_widget.dart';
import 'package:x_calcu/features/home/presentation/widget/home_app_bar.dart';
import 'package:x_calcu/features/home/presentation/widget/home_operations_list.dart';
import 'package:x_calcu/features/home/presentation/widget/home_search_section.dart';
import 'package:x_calcu/features/home/presentation/widget/sort_and_oreder_pperations_widget.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeScreenController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
    BlocConsumer<HomeCubit, HomeState>(
      bloc: getIt<HomeCubit>(),
      listener: (context, state) {
        _controller.handleStateChange(state);
      },
      builder: (context, state) {
        return Skaffold(
          isAppBarNull: true,
          body: Stack(
            children: [
              RefreshIndicator(
                onRefresh: _controller.handleRefresh,
                child: CustomScrollView(
                  slivers: [
                    // AppBar
                    homeAppBar(context),

                    // Search Section
                    SliverToBoxAdapter(
                      child: HomeSearchSection(
                        isSearchExpanded: _controller.isSearchExpanded,
                        onSearchToggle: () {
                          setState(() {
                            _controller.toggleSearchExpanded();
                          });
                        },
                        onSearchCollapse: () {
                          setState(() {
                            _controller.collapseSearch();
                          });
                        },
                      ),
                    ),

                    // Sticky Filter (Input/Output)
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: FilterHeaderHomeWidget(),
                    ),

                    // Empty Space
                    SliverToBoxAdapter(child: CommonSizes.vSmallestSpace5v),

                    // Operations List with Pagination
                    HomeOperationsList(
                      pagingController: _controller.pagingController,
                    ),

                    // Empty Space - Add extra space to avoid overlap with floating widget
                    SliverToBoxAdapter(child: SizedBox(height: 100)),
                  ],
                ),
              ),
              SortAndOrederOperationsWidget(),
            ],
          ),
        );
      },
    );

  }
}
