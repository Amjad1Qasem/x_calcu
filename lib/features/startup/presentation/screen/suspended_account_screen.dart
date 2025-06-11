
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:x_calcu/global/data/auth_model.dart';
import 'package:x_calcu/global/design/common_sizes.dart';
import 'package:x_calcu/global/utils/custom_utils/image_utils.dart';
import 'package:x_calcu/global/utils/functions/log_out_function.dart';

class SuspendedAccountScreen extends StatelessWidget {
  const SuspendedAccountScreen({super.key, required this.accountInfo});

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
            _buildHeader(),
            CommonSizes.vHugeSpace,
            _buildWarningSection(),
            const SizedBox(height: 20),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C54),
            borderRadius: BorderRadius.circular(20),
          ),
          child: _buildUserInfo(),
        ),
        Positioned(
          bottom: -80,
          child: ImageUtils(
            imageUrl: accountInfo.userImage ?? '',
            height: 150.sp,
            width: 150.sp,
            isCircular: true,
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
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
          ),
          SizedBox(height: 30.sp)
        ],
      ),
    );
  }

  Widget _buildWarningSection() {
    return Column(
      children: [
        Icon(Iconsax.warning_2, color: Colors.orange, size: 70),
        const SizedBox(height: 10),
        const Text(
          "Account Suspended",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Your account has been suspended due to policy violations. Please review our policies.",
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
            "Learn More",
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
          onPressed: () async {
            logOutFunction(context);
            // getIt<StartupCubit>().logout();
            // Restart.restartApp(
            //   notificationTitle: 'Restarting App',
            //   notificationBody: 'Please tap here to open the app again.',
            // );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text('log_out'.tr()),
        ),
      ],
    );
  }
}
