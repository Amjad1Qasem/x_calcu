import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/features/home/presentation/widget/operation_card.dart';
import 'package:x_calcu/features/partners/cubit/partners/partner_cubit.dart';
import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/features/partners/presentation/widget/filter_header_partners_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/partner_details/add_operation_for_partner_btn.dart';
import 'package:x_calcu/features/partners/presentation/widget/sort_and_oreder_operations_partners_widget.dart';
import 'package:x_calcu/features/partners/presentation/widget/statistics/statistics_partner_widget.dart';
import 'package:x_calcu/global/components/scaffold_page.dart';
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
  @override
  void initState() {
    getIt<PartnerCubit>().getStatistics();
    getIt<PartnerCubit>().getPartner(id: widget.partner.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Skaffold(
      isBack: true,
      isAppBarNull: false,
      actions: [_popUpMenue(context)],
      title: widget.partner.name,
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              getIt<PartnerCubit>().getPartner(id: widget.partner.id!);
              printSuccess('RefreshIndicator OperationsDetailsScreen');
            },
            child: CustomScrollView(
              slivers: [
                // Sticky Filter (Input/Output)
                SliverPersistentHeader(
                  pinned: true,
                  delegate: FilterHeaderPartnersWidget(),
                ),

                SliverToBoxAdapter(child: CommonSizes.vSmallestSpace),
                // Statistics
                SliverToBoxAdapter(child: StatisticsPartnerWidget()),
                SliverToBoxAdapter(child: CommonSizes.vSmallerSpace),
                // Btn
                SliverToBoxAdapter(child: AddOperationForPartnerBtn()),
                SliverToBoxAdapter(child: CommonSizes.vSmallerSpace),

                // Cards List
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => OperationCard(
                      onTap:
                          () => context.push(
                            RouterPath.showOperationsDetailsScreen,
                            extra: 1,
                          ),
                    ),
                    childCount: 10,
                  ),
                ),
                //  Space
                SliverToBoxAdapter(child: CommonSizes.vBiggerSpace),
              ],
            ),
          ),
          SortAndOrederPartnersWidget(),
        ],
      ),
    );
  }

  Widget _popUpMenue(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: PopupMenuButton(
      icon: Icon(Icons.menu, color: Utils(context).appBarIconsColor),
      iconColor: Utils(context).primary,
      color: Utils(context).darkCardColor,
      splashRadius: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      itemBuilder: (context) {
        // final user = getIt<AppStateModel>().userInfo;
        return [
          PopupMenuItem(
            padding: EdgeInsets.only(
              top: 12.h,
              bottom: 6.h,
              right: 12.w,
              left: 12.w,
            ),
            onTap: () {},
            //  context.push(
            //   RouterPath.viewAccountScreen,
            //   extra: {'userId': user!.id, 'isVisitor': true},
            // ),
            child: SizedBox(
              width: 130.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Icon(
                  //   Icons.delete_forever_outlined,
                  //   size: 22.sp,
                  //   color: Utils(context).red,
                  // ),
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
          ),
          PopupMenuItem(
            onTap: () => context.push(RouterPath.editOperationsScreen),
            padding: EdgeInsets.only(
              top: 12.h,
              bottom: 6.h,
              right: 12.w,
              left: 12.w,
            ),
            child: Row(
              children: [
                Icon(
                  Iconsax.edit_copy,
                  size: 20.sp,
                  color: Utils(context).primary,
                ),
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
          ),
          PopupMenuItem(
            onTap: () {
              // final userId = getIt<AppStateModel>().userInfo?.id ?? 0;
              // final username = getIt<AppStateModel>().userInfo?.name ?? '0';
              // _shareMyAccount(accountId: userId, accountName: username);
            },
            padding: EdgeInsets.only(
              top: 12.h,
              bottom: 6.h,
              right: 12.w,
              left: 12.w,
            ),
            child: Row(
              children: [
                Icon(
                  Iconsax.share_copy,
                  size: 20.sp,
                  color: Utils(context).primary,
                ),
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
          ),
        ];
      },
    ),
  );
}
