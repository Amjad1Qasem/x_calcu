import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_calcu/global/bloc/theme_bloc/theme_bloc.dart';
import 'package:x_calcu/global/design/color_app.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class SectionComponentsWidget extends StatelessWidget {
  const SectionComponentsWidget({
    super.key,
    required this.items,
    required this.lenght,
    this.sectionColor,
  });

  final List<SectionItemWidget> items;
  final int lenght;
  final Color? sectionColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7.h),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: sectionColor ?? Utils(context).backgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 0),
              color: Utils(context).shadowColor,
            ),
          ],
        ),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: lenght,
          separatorBuilder:
              (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Divider(
                  thickness: 0.8,
                  color: Utils(context).shadowColor,
                ),
              ),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return items[index];
          },
        ),
      ),
    );
  }
}

class SectionItemWidget extends StatelessWidget {
  final String title;
  final String? trailing;
  Color? titleColor;
  Color? trailingColor;
  Color? iconColor;
  bool isSvg;
  bool ispng;
  bool isDarkSelected;
  bool isGlobalSection;
  bool isDarkThemeButton;
  bool isCvManagement;
  final IconData? iconPath;
  final String? imagePath;

  // final IconData? icon;
  Function()? onTap;

  SectionItemWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.trailing = '',
    this.titleColor,
    this.trailingColor,
    this.iconPath,
    this.iconColor,
    this.imagePath,
    this.isDarkSelected = false,
    this.isDarkThemeButton = false,
    this.isGlobalSection = false,
    this.isSvg = false,
    this.ispng = false,
    this.isCvManagement = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: !isDarkThemeButton ? onTap : () {},
      minTileHeight: 38.h,
      leading:
          isSvg
              ? SvgPicture.asset(
                imagePath!,
                width: 24,
                height: 24,
                placeholderBuilder:
                    (context) => const CircularProgressIndicator(),
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 24,
                  );
                },
              )
              : ispng
              ? Image.asset(imagePath!, scale: 3, color: iconColor)
              : Icon(iconPath, color: iconColor),
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? Utils(context).primaryGray,
          fontSize: 14.sp,
        ),
      ),
      trailing: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              // visible: (isGlobalSection && !isDarkThemeButton),
              visible: (isGlobalSection),
              child: Text(
                trailing ?? '',
                style:
                    isCvManagement
                        ? Utils(context).smallLable.copyWith(
                          color: trailingColor ?? Utils(context).red,
                        )
                        : Utils(
                          context,
                        ).smallLable.copyWith(color: trailingColor),
              ),
            ),
            CommonSizes.hTheSmallestSpace,
            Visibility(
              visible: (!isCvManagement && isGlobalSection),
              child: Icon(
                color: Utils(context).secondTextColor,
                Icons.arrow_forward_ios_rounded,
                size: 18.sp,
              ),
            ),
            // This Switcher for Theme
            Visibility(
              visible: isDarkThemeButton,
              child: const ThemeSwitcherWidget(
                // onTap:onTap! ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeSwitcherWidget extends StatelessWidget {
  const ThemeSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<ThemeBloc>();
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: bloc,
      buildWhen: (previous, current) => current is ThemeFetched,
      builder: (context, state) {
        final bool darkMode = state.themeMode == ThemeMode.dark;
        return GestureDetector(
          onTap: () {
            bloc.add(
              darkMode
                  ? const ThemeEvent.setLight()
                  : const ThemeEvent.setDark(),
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                alignment: Alignment.center,
                duration: const Duration(milliseconds: 1),
                height: 20.h,
                width: 36.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360.r),
                  color:
                      darkMode
                          ? ColorManager.secondaryColor
                          : const Color(0xffe2e8f0),
                ),
              ),
              AnimatedPositioned(
                curve: Curves.easeIn,
                left: darkMode ? 15.0.sp : 0.0.sp,
                right: darkMode ? 0.0.sp : 15.0.sp,
                duration: const Duration(milliseconds: 1),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Container(
                    width: 16.w,
                    height: 16.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Center(
                      child: Icon(
                        darkMode ? Icons.check : Icons.close,
                        size: 14.sp,
                        color:
                            darkMode
                                ? ColorManager.secondaryBlue
                                : const Color(0xff94a3b8),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
