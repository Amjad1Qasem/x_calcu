import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:x_calcu/features/startup/bloc/startup/startup_cubit.dart';
import 'package:x_calcu/features/startup/data/boarding_model.dart';
import 'package:x_calcu/global/components/app_button.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/custom_utils/image_utils.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/router/router_path.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _imageController;
  late final PageController _textController;
  int currentIndex = 0;

  @override
  void initState() {
    // Create separate controllers for images and text
    _imageController = PageController();
    _textController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    debugPrint('on change $index');
    setState(() {
      currentIndex = index;

      // Synchronize the other PageView without triggering its own scroll
      if (_imageController.page?.round() != index) {
        _imageController.jumpToPage(index);
      }
      if (_textController.page?.round() != index) {
        _textController.jumpToPage(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80.w,
        /*
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
          child: GestureDetector(
            onTap: () {
              showLanguageBottomSheet(context, updateOnBoarding: true);
            },
            child: CircleAvatar(
              backgroundColor: Utils(context).primary,
              child: Icon(Icons.translate, color: Colors.white, size: 14.sp),
            ),
          ),
        ),
       */
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 14.sp),
            child: TextButton(
              onPressed: () {},
              //  context.push(RouterPath.mainLayoutPage),
              child: Text(
                'skip'.tr(),
                style: Utils(
                  context,
                ).clickbleText.copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: PageView.builder(
              controller: _imageController,
              itemCount: boardingData.length,
              onPageChanged: _onPageChanged,
              itemBuilder:
                  (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: ImageUtils(
                      imageUrl: boardingData[index].image ?? '',
                      fit: BoxFit.contain,
                      // scale: 4,
                    ),
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.sp),
            child: SmoothPageIndicator(
              effect: const ExpandingDotsEffect(
                dotHeight: 6.0,
                activeDotColor: Color(0xfffdc500),
                dotColor: Color(0xffd4d4d4),
              ),
              controller: _imageController,
              // Use image controller for indicator
              count: boardingData.length,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _textController,
                    itemCount: boardingData.length,
                    onPageChanged: _onPageChanged,
                    physics: const NeverScrollableScrollPhysics(),
                    // Prevent manual scrolling
                    itemBuilder:
                        (_, index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                boardingData[index].title?.tr() ?? '',
                                textAlign: TextAlign.center,
                                style: Utils(context).blackBigText,
                              ),
                              CommonSizes.vSmallestSpace,
                              Text(
                                boardingData[index].description?.tr() ?? '',
                                textAlign: TextAlign.center,
                                style: Utils(
                                  context,
                                ).normalText.copyWith(height: 1.4),
                              ),
                            ],
                          ),
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.sp,
                    vertical: 20.sp,
                  ),
                  child: _nextButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _nextButton() {
    bool isLastPage = currentIndex + 1 == boardingData.length;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
      child: AppButton(
        onTap: () {
          if (isLastPage) {
            getIt<StartupCubit>().completeOnBoarding();
            context.push(RouterPath.loginScreen);
          } else {
            // Programmatically move both page controllers
            _imageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            _textController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        label: isLastPage ? 'login'.tr() : 'next'.tr(),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
