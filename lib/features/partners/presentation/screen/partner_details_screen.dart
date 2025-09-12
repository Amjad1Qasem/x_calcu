import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/home/presentation/widget/operation_card.dart';
import 'package:x_calcu/features/partners/cubit/partner_details/partner_details_cubit.dart';
import 'package:x_calcu/features/partners/cubit/partners/partner_cubit.dart';
import 'package:x_calcu/features/partners/cubit/delete_partner/delete_partner_cubit.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/features/partners/presentation/widget/filter_header_partners_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/partner_details/add_operation_for_partner_btn.dart';
import 'package:x_calcu/features/partners/presentation/widget/sort_and_oreder_operations_partners_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/statistics/statistics_partner_widget.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
import 'package:x_calcu/global/components/utils/error_widget_screen.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/constant/app_images.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class PartnerDetailsScreen extends StatefulWidget {
  const PartnerDetailsScreen({super.key, required this.partner});
  final PartnerModel partner;

  @override
  State<PartnerDetailsScreen> createState() => _PartnerDetailsScreenState();
}

class _PartnerDetailsScreenState extends State<PartnerDetailsScreen> {
  late PartnerDetailsCubit _partnerDetailsCubit;

  @override
  void initState() {
    super.initState();
    _partnerDetailsCubit = getIt<PartnerDetailsCubit>();
    _partnerDetailsCubit.getPartnerDetails(partnerId: widget.partner.id!);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _partnerDetailsCubit),
        BlocProvider.value(value: getIt<DeletePartnerCubit>()),
      ],
      child: BlocListener<DeletePartnerCubit, DeletePartnerState>(
        listener: _handleDeletePartnerState,
        child: Skaffold(
          isBack: true,
          isAppBarNull: false,
          actions: [_buildPopupMenu()],
          title: widget.partner.name,
          body: BlocBuilder<PartnerDetailsCubit, PartnerDetailsState>(
            bloc: _partnerDetailsCubit,
            builder: (context, state) => _buildBody(state),
          ),
        ),
      ),
    );
  }

  // Handle delete partner state changes
  void _handleDeletePartnerState(
    BuildContext context,
    DeletePartnerState state,
  ) {
    state.when(
      initial: () {},
      loading: () {},
      success: () => _onDeleteSuccess(context),
      error: (message) => _onDeleteError(context, message),
    );
  }

  // Handle successful deletion
  void _onDeleteSuccess(BuildContext context) {
    // Remove partner from local list
    getIt<PartnerCubit>().removePartnerFromList(widget.partner.id!);

    // Navigate back and show success message
    if (context.mounted) {
      context.pop();
      _showSnackBar(context, 'partner_deleted_successfully'.tr(), Colors.green);
    }
  }

  // Handle deletion error
  void _onDeleteError(BuildContext context, String message) {
    if (context.mounted) {
      _showSnackBar(context, message, Colors.red);
    }
  }

  // Show snack bar message
  void _showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  // Build main body
  Widget _buildBody(PartnerDetailsState state) {
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: _handleRefresh,
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: FilterHeaderPartnersWidget(),
              ),
              SliverToBoxAdapter(child: CommonSizes.vSmallestSpace),
              SliverToBoxAdapter(child: _buildStatisticsSection(state)),
              SliverToBoxAdapter(child: CommonSizes.vSmallerSpace),
              SliverToBoxAdapter(child: AddOperationForPartnerBtn()),
              SliverToBoxAdapter(child: CommonSizes.vSmallerSpace),
              _buildOperationsList(state),
              SliverToBoxAdapter(child: CommonSizes.vBiggerSpace),
            ],
          ),
        ),
        SortAndOrederPartnersWidget(),
      ],
    );
  }

  // Handle refresh
  Future<void> _handleRefresh() async {
    _partnerDetailsCubit.refreshPartnerDetails(partnerId: widget.partner.id!);
    printSuccess('RefreshIndicator PartnerDetailsScreen');
  }

  Widget _buildStatisticsSection(PartnerDetailsState state) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded:
          (data, operations) =>
              StatisticsPartnerWidget(statistics: data.statistic!),
      error:
          (message) => ErrorWidgetScreen(
            isIcon: false,
            onRetry:
                () => _partnerDetailsCubit.getPartnerDetails(
                  partnerId: widget.partner.id!,
                ),
            message: message,
          ),
    );
  }

  Widget _buildOperationsList(PartnerDetailsState state) {
    return state.when(
      initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
      loading:
          () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
      loaded: (data, operations) {
        if (operations.data.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                'no_operations_found'.tr(),
                style: TextStyle(
                  color: Utils(context).secondTextColor,
                  fontSize: 16.sp,
                ),
              ),
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            // Check if we need to load more operations
            // Only load more if we have pagination links and haven't reached max
            if (index == operations.data.length - 1 &&
                operations.links != null &&
                !_partnerDetailsCubit.hasReachedMax) {
              _partnerDetailsCubit.loadMoreOperations();
            }

            final operation = operations.data[index];
            return OperationCard(
              partnerOperation: operation,
              onTap:
                  () => context.push(
                    RouterPath.showOperationsDetailsScreen,
                    extra: operation.id,
                  ),
            );
          }, childCount: operations.data.length),
        );
      },
      error:
          (message) => SliverToBoxAdapter(
            child: ErrorWidgetScreen(
              isIcon: false,
              onRetry:
                  () => _partnerDetailsCubit.getPartnerDetails(
                    partnerId: widget.partner.id!,
                  ),
              message: message,
            ),
          ),
    );
  }

  // Build popup menu
  Widget _buildPopupMenu() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: PopupMenuButton(
        icon: Icon(Icons.menu, color: Utils(context).appBarIconsColor),
        iconColor: Utils(context).primary,
        color: Utils(context).darkCardColor,
        splashRadius: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        itemBuilder:
            (context) => [
              _buildDeleteMenuItem(context),
              _buildEditMenuItem(context),
              _buildShareMenuItem(context),
            ],
      ),
    );
  }

  // Build delete menu item
  PopupMenuItem _buildDeleteMenuItem(BuildContext context) {
    return PopupMenuItem(
      padding: EdgeInsets.only(top: 12.h, bottom: 6.h, right: 12.w, left: 12.w),
      onTap: () => _showDeleteConfirmationDialog(context),
      child: SizedBox(
        width: 130.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppImages.trashIcon,
              height: 22.h,
              colorFilter: ColorFilter.mode(
                Utils(context).red,
                BlendMode.srcIn,
              ),
            ),
            CommonSizes.hSmallestSpace,
            Expanded(
              child: Text(
                "delete".tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Utils(context).secondTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build edit menu item
  PopupMenuItem _buildEditMenuItem(BuildContext context) {
    return PopupMenuItem(
      onTap: () => context.push(RouterPath.editOperationsScreen),
      padding: EdgeInsets.only(top: 12.h, bottom: 6.h, right: 12.w, left: 12.w),
      child: Row(
        children: [
          Icon(Iconsax.edit_copy, size: 20.sp, color: Utils(context).primary),
          CommonSizes.hSmallestSpace,
          Text(
            'edit'.tr(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Utils(context).secondTextColor,
            ),
          ),
        ],
      ),
    );
  }

  // Build share menu item
  PopupMenuItem _buildShareMenuItem(BuildContext context) {
    return PopupMenuItem(
      onTap: () {
        // TODO: Implement share functionality
      },
      padding: EdgeInsets.only(top: 12.h, bottom: 6.h, right: 12.w, left: 12.w),
      child: Row(
        children: [
          Icon(Iconsax.share_copy, size: 20.sp, color: Utils(context).primary),
          CommonSizes.hSmallestSpace,
          Text(
            'share'.tr(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Utils(context).secondTextColor,
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'delete_partner'.tr(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Utils(context).primary,
            ),
          ),
          content: Text(
            'delete_partner_confirmation'.tr(
              namedArgs: {'name': widget.partner.name ?? 'Unknown'},
            ),
            style: TextStyle(color: Utils(context).secondTextColor),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'cancel'.tr(),
                style: TextStyle(color: Utils(context).secondTextColor),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deletePartner();
              },
              child: Text(
                'delete'.tr(),
                style: TextStyle(
                  color: Utils(context).red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Delete partner with loading indicator
  void _deletePartner() async {
    final deletePartnerCubit = getIt<DeletePartnerCubit>();

    // Show loading dialog
    _showLoadingDialog();

    // Delete partner
    await deletePartnerCubit.deletePartner(id: widget.partner.id!);

    // Close loading dialog
    _hideLoadingDialog();
  }

  // Show loading dialog
  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
  }

  // Hide loading dialog
  void _hideLoadingDialog() {
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}
