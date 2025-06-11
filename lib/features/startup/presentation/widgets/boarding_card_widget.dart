
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/design/themes/themes.dart';
import 'package:x_calcu/global/utils/custom_utils/image_utils.dart';

class BoardingCardWidget extends StatelessWidget {
  const BoardingCardWidget({
    super.key,
    required this.title,
    required this.image,
    required this.body,
    this.isGetData,
  });

  final String title;
  final String image;
  final String body;
  final bool? isGetData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.sp,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
            height: 300.h,
            child: Center(
              child: ImageUtils(
                imageUrl: image,
                isCircular: false,
              ),
            ),
          ),
          CommonSizes.vBiggestSpace,
          Center(
            child: Text(title,
                textAlign: TextAlign.center,
                style: Utils(context)
                    .blackBigText),
          ),
          CommonSizes.vSmallestSpace,
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Text(body,
                    textAlign: TextAlign.center,
                    style: Utils(context)
                        .normalText
                        .copyWith(height: 1.4)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
