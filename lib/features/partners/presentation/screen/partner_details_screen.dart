import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/features/partners/cubit/partner_details/partner_details_cubit.dart';
import 'package:x_calcu/features/partners/cubit/partners/partner_cubit.dart';
import 'package:x_calcu/features/partners/cubit/delete_partner/delete_partner_cubit.dart';
import 'package:x_calcu/features/partners/cubit/edit_partner/edit_partner_cubit.dart';
import 'package:x_calcu/features/partners/cubit/statistics/statistics_cubit.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/features/partners/presentation/widget/filter_header_partners_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/partner_details/add_operation_for_partner_btn.dart';
import 'package:x_calcu/features/partners/presentation/widget/partner_details/partner_details_delete_dialog.dart';
import 'package:x_calcu/features/partners/presentation/widget/partner_details/partner_details_loading_dialog.dart';
import 'package:x_calcu/features/partners/presentation/widget/partner_details/partner_details_operations_list.dart';
import 'package:x_calcu/features/partners/presentation/widget/partner_details/partner_details_popup_menu.dart';
import 'package:x_calcu/features/partners/presentation/widget/partner_details/partner_details_shimmer_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/partner_details/partner_details_statistics_section.dart';
import 'package:x_calcu/features/partners/presentation/widget/partner_details/partner_info_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/selection/selection_action_bar.dart';
import 'package:x_calcu/features/partners/cubit/selection/selection_cubit.dart';
import 'package:x_calcu/features/partners/presentation/widget/sort_and_oreder_operations_partners_widget.dart';
import 'package:x_calcu/global/components/user_messages/snack_bar.dart';
import 'package:x_calcu/global/components/utils/error_widget_screen.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class PartnerDetailsScreen extends StatefulWidget {
  const PartnerDetailsScreen({super.key, required this.partner});
  final PartnerModel partner;

  @override
  State<PartnerDetailsScreen> createState() => _PartnerDetailsScreenState();
}

class _PartnerDetailsScreenState extends State<PartnerDetailsScreen> {
  late PartnerDetailsCubit _partnerDetailsCubit;
  PartnerModel? _currentPartner;

  @override
  void initState() {
    super.initState();
    _partnerDetailsCubit = getIt<PartnerDetailsCubit>();
    _currentPartner = widget.partner;
    _partnerDetailsCubit.getPartnerDetails(partnerId: widget.partner.id!);
  }

  @override
  void dispose() {
    // SelectionCubit will be created fresh each time, so no need to reset
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectionCubit>(
      create: (context) => getIt<SelectionCubit>(),
      child: BlocListener<EditPartnerCubit, EditPartnerState>(
        bloc: getIt<EditPartnerCubit>(),
        listener: _handleEditPartnerState,
        child: BlocListener<DeletePartnerCubit, DeletePartnerState>(
          bloc: getIt<DeletePartnerCubit>(),
          listener: _handleDeletePartnerState,
          child: Scaffold(
            backgroundColor: Utils(context).backgroundColor,
            body: BlocBuilder<PartnerDetailsCubit, PartnerDetailsState>(
              bloc: _partnerDetailsCubit,
              builder:
                  (context, state) => Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      RefreshIndicator(
                        onRefresh: _handleRefresh,
                        child: CustomScrollView(
                          slivers: [
                            // Custom AppBar
                            SliverAppBar(
                              pinned: true,
                              centerTitle: true,
                              leading: IconButton(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: Utils(context).appBarIconsColor,
                                  size: 18.sp,
                                ),
                              ),
                              actions: [
                                // Selection button
                                BlocBuilder<SelectionCubit, SelectionState>(
                                  builder: (context, state) {
                                    final isSelectionMode = state.maybeWhen(
                                      selectionMode: () => true,
                                      selectionActive: (_) => true,
                                      orElse: () => false,
                                    );

                                    return GestureDetector(
                                      onTap:
                                          () =>
                                              context
                                                  .read<SelectionCubit>()
                                                  .toggleSelectionMode(),
                                      child: Text(
                                        isSelectionMode
                                            ? 'cancel'.tr()
                                            : 'select'.tr(),
                                        style: Utils(
                                          context,
                                        ).normalText.copyWith(
                                          color:
                                              Utils(context).appBarIconsColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                // Popup menu (only when not in selection mode)
                                BlocBuilder<SelectionCubit, SelectionState>(
                                  builder: (context, state) {
                                    final isSelectionMode = state.maybeWhen(
                                      selectionMode: () => true,
                                      selectionActive: (_) => true,
                                      orElse: () => false,
                                    );

                                    if (isSelectionMode) {
                                      return SizedBox(width: 20.w);
                                    }

                                    return PartnerDetailsPopupMenu(
                                      partner:
                                          _currentPartner ?? widget.partner,
                                      onDeletePressed:
                                          () => _showDeleteConfirmationDialog(
                                            context,
                                          ),
                                    );
                                  },
                                ),
                              ],
                              title: Text(
                                _currentPartner?.name ?? 'Unknown Partner',
                                style: Utils(
                                  context,
                                ).blueHeadlineText.copyWith(fontSize: 16.sp),
                              ),
                              backgroundColor: Utils(context).background,
                              surfaceTintColor: Utils(context).background,
                              elevation: 0,
                            ),
                            // Filter Header
                            SliverPersistentHeader(
                              pinned: true,
                              delegate: FilterHeaderPartnersWidget(),
                            ),
                            // Selection Action Bar
                            BlocBuilder<
                              PartnerDetailsCubit,
                              PartnerDetailsState
                            >(
                              bloc: _partnerDetailsCubit,
                              builder: (context, state) {
                                return state.when(
                                  initial:
                                      () => const SliverToBoxAdapter(
                                        child: SizedBox.shrink(),
                                      ),
                                  loading:
                                      () => const SliverToBoxAdapter(
                                        child: SizedBox.shrink(),
                                      ),
                                  loaded:
                                      (data, operations) => SliverToBoxAdapter(
                                        child: SelectionActionBar(
                                          allOperations: operations,
                                          partnerName:
                                              _currentPartner?.name ??
                                              'Unknown Partner',
                                        ),
                                      ),
                                  error:
                                      (_) => const SliverToBoxAdapter(
                                        child: SizedBox.shrink(),
                                      ),
                                );
                              },
                            ),
                            // SliverToBoxAdapter(child: CommonSizes.vSmallestSpace),
                            // Content based on state
                            ...state.when(
                              initial:
                                  () => [
                                    // Statistics Section with Shimmer
                                    SliverToBoxAdapter(
                                      child:
                                          const PartnerDetailsShimmerWidget(),
                                    ),
                                    SliverToBoxAdapter(
                                      child: CommonSizes.vSmallerSpace,
                                    ),
                                    SliverToBoxAdapter(
                                      child: AddOperationForPartnerBtn(
                                        partner: widget.partner,
                                      ),
                                    ),
                                    SliverToBoxAdapter(
                                      child: CommonSizes.vSmallerSpace,
                                    ),
                                    // Operations List with Shimmer
                                    SliverToBoxAdapter(
                                      child:
                                          const PartnerDetailsShimmerWidget(),
                                    ),
                                  ],
                              loading:
                                  () => [
                                    // Statistics Section with Shimmer
                                    SliverToBoxAdapter(
                                      child:
                                          const PartnerDetailsShimmerWidget(),
                                    ),
                                    SliverToBoxAdapter(
                                      child: CommonSizes.vSmallerSpace,
                                    ),
                                    SliverToBoxAdapter(
                                      child: AddOperationForPartnerBtn(
                                        partner: widget.partner,
                                      ),
                                    ),
                                    SliverToBoxAdapter(
                                      child: CommonSizes.vSmallerSpace,
                                    ),
                                    // Operations List with Shimmer
                                    SliverToBoxAdapter(
                                      child:
                                          const PartnerDetailsShimmerWidget(),
                                    ),
                                  ],
                              loaded:
                                  (data, operations) => [
                                    // Statistics Section
                                    SliverToBoxAdapter(
                                      child: Column(
                                        children: [
                                          PartnerDetailsStatisticsSection(
                                            state: state,
                                            partner: widget.partner,
                                            cubit: _partnerDetailsCubit,
                                          ),
                                          CommonSizes.vSmallerSpace,
                                          PartnerInfoWidget(
                                            partnerDetails:
                                                _currentPartner ??
                                                widget.partner,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SliverToBoxAdapter(
                                      child: CommonSizes.vSmallerSpace,
                                    ),
                                    SliverToBoxAdapter(
                                      child: AddOperationForPartnerBtn(
                                        partner: widget.partner,
                                      ),
                                    ),
                                    SliverToBoxAdapter(
                                      child: CommonSizes.vSmallerSpace,
                                    ),
                                    // Operations List
                                    PartnerDetailsOperationsList(
                                      state: state,
                                      cubit: _partnerDetailsCubit,
                                      partnerId: widget.partner.id!,
                                    ),
                                  ],
                              error:
                                  (message) => [
                                    // Single Error Widget for the entire screen
                                    SliverFillRemaining(
                                      child: ErrorWidgetScreen(
                                        isIcon: true,
                                        onRetry:
                                            () => _partnerDetailsCubit
                                                .getPartnerDetails(
                                                  partnerId: widget.partner.id!,
                                                ),
                                        message: message,
                                      ),
                                    ),
                                  ],
                            ),
                            SliverToBoxAdapter(child: CommonSizes.vBiggerSpace),
                          ],
                        ),
                      ),
                      SortAndOrederPartnersWidget(),
                    ],
                  ),
            ),
          ),
        ),
      ),
    );
  }

  // Handle edit partner state changes
  void _handleEditPartnerState(BuildContext context, EditPartnerState state) {
    if (state.isSuccess && state.data != null) {
      setState(() {
        _currentPartner = state.data;
      });
    }
  }

  // Handle delete partner state changes
  void _handleDeletePartnerState(
    BuildContext context,
    DeletePartnerState state,
  ) {
    state.when(
      initial: () {},
      loading: () {},
      success: () {
        getIt<PartnerCubit>().removePartnerFromList(widget.partner.id!);
        // Navigate back and show success message
        if (context.mounted) {
          context.pop();
          snackBar(
            context: context,
            title: 'partner_deleted_successfully'.tr(),
            isErrorMessage: false,
          );
        }
      },
      error: (message) {
        if (context.mounted) {
          snackBar(context: context, title: message, isErrorMessage: true);
        }
      },
    );
  }

  // Handle refresh
  Future<void> _handleRefresh() async {
    _partnerDetailsCubit.refreshPartnerDetails(partnerId: widget.partner.id!);
    printSuccess('RefreshIndicator PartnerDetailsScreen');
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    PartnerDetailsDeleteDialog.show(context, widget.partner, _deletePartner);
  }

  // Delete partner with loading indicator
  void _deletePartner() async {
    final deletePartnerCubit = getIt<DeletePartnerCubit>();

    // Show loading dialog
    PartnerDetailsLoadingDialog.show(context);

    // Delete partner
    await deletePartnerCubit.deletePartner(id: widget.partner.id!);
    await getIt<StatisticsCubit>().getStatistics();

    // Close loading dialog
    PartnerDetailsLoadingDialog.hide(context);
  }
}
