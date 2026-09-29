import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/otp_verification_controller.dart';
import '../widgets/otp_passcode_card.dart';
import '../widgets/otp_troubleshoot_card.dart';
import '../widgets/otp_verification_footer.dart';
import '../widgets/otp_verification_hero_card.dart';
import '../widgets/otp_verification_top_bar.dart';
import '../widgets/otp_verify_button.dart';

class DesktopOtpVerificationView extends GetView<OtpVerificationController> {
  const DesktopOtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldDesktop,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Container(
            width: 480,
            decoration: BoxDecoration(
              color: AppColors.scaffoldLight,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.borderLight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 12),
                OtpVerificationTopBar(),
                SizedBox(height: 8),
                OtpVerificationHeroCard(),
                SizedBox(height: 18),
                OtpPasscodeCard(),
                SizedBox(height: 16),
                OtpVerifyButton(),
                SizedBox(height: 18),
                OtpTroubleshootCard(),
                SizedBox(height: 16),
                OtpVerificationFooter(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
