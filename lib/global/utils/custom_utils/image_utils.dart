import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// import 'package:fullscreen_image_viewer/fullscreen_image_viewer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:x_calcu/global/utils/helper/console_logger.dart';

class ImageUtils extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double scale;
  final double? radius;
  final double? errorSize;
  final BoxFit fit;
  final Widget? errorWidget;
  final Widget? placeholder;
  final Color? borderColor;
  final bool isCircular;
  final File? imageFile;
  final bool shimmerLoading;
  final bool clickToExpandView;

  const ImageUtils({
    super.key,
    required this.imageUrl,
    this.width,
    this.borderColor,
    this.radius,
    this.height,
    this.errorSize,
    this.scale = 1.0,
    this.fit = BoxFit.cover,
    this.errorWidget,
    this.placeholder,
    this.isCircular = false,
    this.imageFile,
    this.shimmerLoading = false,
    this.clickToExpandView = false,
  });

  bool get _isBase64Image => imageUrl.startsWith('data:image/');

  bool get _isAssetImage => imageUrl.startsWith('assets/');

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    try {
      if (_isBase64Image) {
        final String base64String = imageUrl.split(',')[1];
        final Uint8List imageBytes = base64Decode(base64String);

        imageWidget = Image.memory(
          imageBytes,
          width: width,
          height: height,
          fit: fit,
          scale: scale,
          errorBuilder: (context, error, stackTrace) {
            printError('Error loading base64 image: $error');
            return errorWidget ??
                _defaultErrorWidget(
                  width,
                  height,
                  radius,
                  borderColor,
                  errorSize,
                );
          },
        );
      } else if (_isAssetImage) {
        imageWidget = Image.asset(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            printError('Error loading asset image: $error');
            return errorWidget ??
                _defaultErrorWidget(
                  width,
                  height,
                  radius,
                  borderColor,
                  errorSize,
                );
          },
        );
      } else if (imageFile != null) {
        imageWidget = Image.file(
          imageFile!,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            printWarning('Error loading file image: $error');
            return errorWidget ??
                _defaultErrorWidget(
                  width,
                  height,
                  radius,
                  borderColor,
                  errorSize,
                );
          },
        );
      } else if (imageUrl.endsWith('.svg')) {
        try {
          imageWidget = SvgPicture.network(
            imageUrl,
            width: width,
            height: height,
            placeholderBuilder: (context) => const CircularProgressIndicator(),
            errorBuilder: (context, error, stackTrace) {
              printError('Error loading SVG image: $error\nFile: $imageUrl');
              return errorWidget ??
                  _defaultErrorWidget(
                    width,
                    height,
                    radius,
                    borderColor,
                    errorSize,
                  );
            },
          );
        } catch (e) {
          printError('Exception loading SVG: $e\nFile: $imageUrl');
          return errorWidget ??
              _defaultErrorWidget(
                width,
                height,
                radius,
                borderColor,
                errorSize,
              );
        }
      } else {
        imageWidget = RepaintBoundary(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: width,
            height: height,
            scale: scale,
            fit: fit,
            placeholder:
                (context, url) =>
                    placeholder ??
                    _defaultPlaceholder(width, height, radius, borderColor),
            errorWidget: (context, url, error) {
              if (error is! HttpException) {
                return SvgPicture.network(
                  width: width,
                  height: height,
                  url,
                  errorBuilder: (context, error, stackTrace) {
                    printError('Error loading network image: $error');
                    return errorWidget ??
                        _defaultErrorWidget(
                          width,
                          height,
                          radius,
                          borderColor,
                          errorSize,
                        );
                  },
                );
              }

              return errorWidget ??
                  _defaultErrorWidget(
                    width,
                    height,
                    radius,
                    borderColor,
                    errorSize,
                  );
            },
          ),
        );
      }
    } catch (e) {
      printError('Unexpected error loading image: $e');
      imageWidget =
          errorWidget ??
          _defaultErrorWidget(width, height, radius, borderColor, errorSize);
    }

    return clickToExpandView
        ? GestureDetector(
          onTap: () {
            // FullscreenImageViewer.open(
            //   closeWidget: Padding(
            //     padding: EdgeInsets.all(20.sp),
            //     child: Container(
            //       padding: EdgeInsets.all(5.sp),
            //       decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(30)),
            //       child: const Icon(
            //         Icons.cancel_outlined,
            //         color: Colors.red,
            //       ),
            //     ),
            //   ),
            //   context: context,
            //   child: ImageUtils(
            //     imageUrl: imageUrl,
            //     fit: BoxFit.cover,
            //     width: double.infinity,
            //     shimmerLoading: true,
            //   ),
            // );
          },
          child: _finalBuilder(imageWidget),
        )
        : _finalBuilder(imageWidget);
  }

  Widget _defaultPlaceholder(
    double? w,
    double? h,
    double? r,
    Color? borderColor,
  ) {
    return shimmerLoading
        ? Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
            ),
          ),
        )
        : Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.white),
            borderRadius: BorderRadius.circular(r ?? 180.0),
          ),
          width: w,
          height: h,
          child: const Center(child: CircularProgressIndicator()),
        );
  }

  Widget _defaultErrorWidget(
    double? w,
    double? h,
    double? r,
    Color? borderColor,
    double? size,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? Colors.white),
        borderRadius: BorderRadius.circular(r ?? 180.0),
      ),
      width: w,
      height: h,
      child: Center(
        child: Icon(
          Icons.broken_image,
          color: Colors.grey,
          size: size ?? 50.sp,
        ),
      ),
    );
  }

  Widget _finalBuilder(Widget imageWidget) {
    // AbsorbPointer
    if (isCircular) {
      return SizedBox(
        width: width,
        height: height,
        child: ClipOval(child: imageWidget),
      );
    } else {
      return imageWidget;
    }
  }
}
