import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  // Check for Base64 image (starts with "data:image/")
  bool get _isBase64Image => imageUrl.startsWith('data:image/');

  // Check for asset image (starts with "assets/")
  bool get _isAssetImage => imageUrl.startsWith('assets/');

  // Check if image is an SVG file (ends with .svg)
  bool get _isSvgImage => imageUrl.toLowerCase().endsWith('.svg');

  // SVG asset (in local assets folder)
  bool get _isSvgAsset => _isAssetImage && _isSvgImage;

  // SVG from network
  bool get _isSvgNetwork => !_isAssetImage && _isSvgImage;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    try {
      if (_isBase64Image) {
        // Handle base64 images
        final base64String = imageUrl.split(',')[1];
        final imageBytes = base64Decode(base64String);

        imageWidget = Image.memory(
          imageBytes,
          width: width,
          height: height,
          fit: fit,
          scale: scale,
          errorBuilder: _buildError,
        );
      } else if (_isSvgAsset) {
        // Handle SVG asset image
        imageWidget = SvgPicture.asset(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
          placeholderBuilder:
              (_) => const Center(child: CircularProgressIndicator()),
        );
      } else if (_isAssetImage) {
        // Handle normal asset image (png, jpg)
        imageWidget = Image.asset(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: _buildError,
        );
      } else if (imageFile != null) {
        // Handle local file image
        imageWidget = Image.file(
          imageFile!,
          width: width,
          height: height,
          fit: fit,
          scale: scale,
          errorBuilder: _buildError,
        );
      } else if (_isSvgNetwork) {
        // Handle SVG from network
        imageWidget = SvgPicture.network(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
          placeholderBuilder:
              (_) => const Center(child: CircularProgressIndicator()),
          errorBuilder: _buildError,
        );
      } else {
        // Handle network image (jpg, png)
        imageWidget = RepaintBoundary(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: width,
            height: height,
            scale: scale,
            fit: fit,
            placeholder:
                (_, __) =>
                    placeholder ??
                    _defaultPlaceholder(width, height, radius, borderColor),
            errorWidget: (context, url, error) {
              printError('Network image error: $error');
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
      // Catch any unexpected errors
      printError('Unexpected error loading image: $e');
      imageWidget =
          errorWidget ??
          _defaultErrorWidget(width, height, radius, borderColor, errorSize);
    }

    // Optionally wrap with gesture to expand
    return clickToExpandView
        ? GestureDetector(
          onTap: () {
            // TODO: Add fullscreen viewer logic here
          },
          child: _wrapWithShape(imageWidget),
        )
        : _wrapWithShape(imageWidget);
  }

  /// Wrap image with shape (circular or normal)
  Widget _wrapWithShape(Widget child) {
    if (isCircular) {
      return SizedBox(
        width: width,
        height: height,
        child: ClipOval(child: child),
      );
    } else {
      return child;
    }
  }

  /// Default shimmer or loading placeholder
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
          child: Container(
            width: w,
            height: h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(r ?? 20.0),
              color: Colors.grey,
            ),
          ),
        )
        : Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.white),
            borderRadius: BorderRadius.circular(r ?? 20.0),
          ),
          child: const Center(child: CircularProgressIndicator()),
        );
  }

  /// Default error widget (e.g., broken image icon)
  Widget _defaultErrorWidget(
    double? w,
    double? h,
    double? r,
    Color? borderColor,
    double? size,
  ) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? Colors.white),
        borderRadius: BorderRadius.circular(r ?? 20.0),
      ),
      child: Center(
        child: Icon(
          Icons.broken_image,
          color: Colors.grey,
          size: size ?? 50.sp,
        ),
      ),
    );
  }

  /// Error builder used by all image types
  Widget _buildError(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    printError('Image load error: $error');
    return errorWidget ??
        _defaultErrorWidget(width, height, radius, borderColor, errorSize);
  }
}
