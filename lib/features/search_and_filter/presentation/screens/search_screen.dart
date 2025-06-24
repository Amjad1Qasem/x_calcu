import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/design/themes/themes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.sp),
      child: Scaffold(
        backgroundColor: Utils(context).backgroundColor,
        appBar: AppBar(
          titleSpacing: 0.0,
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Theme.of(context).primaryColor,
            ),
          ),
          // title: _appbarSearch(context),
          backgroundColor: Utils(context).backgroundColor,
          surfaceTintColor: Utils(context).backgroundColor,
        ),
        body: Placeholder(),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 20.sp),
        //   child: const FilterPageContent(),
        // ),
      ),
    );
  }

  // Widget _appbarSearch(BuildContext context) {
  //   bool isArLocale = Localizations.localeOf(context).languageCode == 'ar';

  //   final searchCubit = getIt<SearchItemCubit>();
  //   return BlocBuilder<SearchItemCubit, SearchItemState>(
  //     bloc: searchCubit,
  //     builder: (context, state) {
  //       return Container(
  //         margin: EdgeInsets.only(
  //           top: 5.sp,
  //           left: isArLocale ? 30.sp : 0.0,
  //           right: isArLocale ? 0.0 : 30.sp,
  //         ),
  //         padding: EdgeInsets.only(left: 3.sp),
  //         color: Utils(context).darkCardColor,
  //         child: TextField(
  //           controller: searchCubit.searchController,
  //           onSubmitted: (String query) {
  //             getIt<SearchItemCubit>().fetchMockData(query: query);
  //           },
  //           style: Utils(context).normalText.copyWith(fontSize: 15.sp),
  //           decoration: InputDecoration(
  //             hintText: 'search_in_bbs'.tr(),
  //             hintStyle: Utils(context).hintText.copyWith(color: Colors.grey),
  //             fillColor: Utils(context).darkCardColor,
  //             isDense: true,
  //             filled: true,
  //             contentPadding: EdgeInsets.symmetric(
  //               vertical: 2.sp,
  //               horizontal: 10.sp,
  //             ),
  //             prefixIcon: Icon(
  //               Iconsax.search_normal_1_copy,
  //               color: Theme.of(context).primaryColor,
  //             ),
  //             suffixIcon: IconButton(
  //               icon: const Icon(Icons.clear),
  //               onPressed: () {
  //                 searchCubit.searchController.clear();
  //                 searchCubit.loadSearchHistory();
  //               },
  //             ),
  //             enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(5.r),
  //               borderSide: BorderSide(
  //                 color: Utils(context).disableGrey,
  //                 width: 1.w,
  //               ),
  //             ),
  //             focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(5.r),
  //               borderSide: BorderSide(
  //                 color: Theme.of(context).primaryColor,
  //                 width: 1.5.w,
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
