import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class VerifiedBadgeWidget extends StatelessWidget {
  const VerifiedBadgeWidget({super.key, this.isVerified, this.iconSize});

  final bool? isVerified;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVerified ?? false,
      child: Icon(
        Iconsax.verify,
        color: Theme.of(context).primaryColor,
        size: iconSize ?? 17.sp,
      ).animate(onComplete: (cont) => cont.repeat()).shimmer(
            duration: const Duration(milliseconds: 800),
            delay: const Duration(seconds: 3),
            color: Colors.white,
          ),
    );
  }
}
