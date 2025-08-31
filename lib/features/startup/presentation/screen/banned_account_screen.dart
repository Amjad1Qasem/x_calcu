
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/data/auth_model.dart';
import 'package:x_calcu/global/utils/custom_utils/image_utils.dart';
import 'package:x_calcu/global/utils/functions/log_out_function.dart';

class BannedAccountScreen extends StatelessWidget {
  const BannedAccountScreen({super.key, required this.accountInfo});

  final AuthModel accountInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A4E69),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // _buildHeader(),
            const SizedBox(height: 30),
            _buildUserInfo(),
            const SizedBox(height: 40),
            _buildBannedSection(),
            const SizedBox(height: 20),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  // Widget _buildHeader() {
  //   return ImageUtils(
  //     imageUrl: accountInfo.userImage ?? '',
  //     height: 150.sp,
  //     width: 150.sp,
  //     isCircular: true,
  //   );
  // }

  Widget _buildUserInfo() {
    return Column(
      children: [
        Text(
          accountInfo.name ?? 'No Name',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "@${accountInfo.username ?? 'No Username'}",
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildBannedSection() {
    return Column(
      children: [
        const Icon(Iconsax.close_circle, color: Colors.red, size: 70),
        const SizedBox(height: 10),
        const Text(
          "Account Banned",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Your account has been permanently banned due to serious violations. You can appeal the decision.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[400], fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            "Appeal Ban",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text("Contact Support"),
        ),
        ElevatedButton(
          onPressed: () {
            logOutFunction(context);
            
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text('log_out'.tr()),
        ),
      ],
    );
  }
}
