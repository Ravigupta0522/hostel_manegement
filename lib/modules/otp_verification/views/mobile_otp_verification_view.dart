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

class MobileOtpVerificationView extends GetView<OtpVerificationController> {
  const MobileOtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldLight,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top bar
              OtpVerificationTopBar(),
              SizedBox(height: 8),

              // Hero card with 2FA email illustration, title & masked email
              OtpVerificationHeroCard(),
              SizedBox(height: 18),

              // Passcode card with 6-digit boxes & resend timer
              OtpPasscodeCard(),
              SizedBox(height: 16),

              // Verify & Proceed CTA button
              OtpVerifyButton(),
              SizedBox(height: 18),

              // Troubleshooting / Did not receive email assistance card
              OtpTroubleshootCard(),
              SizedBox(height: 16),

              // Single Sign-On session security footer
              OtpVerificationFooter(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
