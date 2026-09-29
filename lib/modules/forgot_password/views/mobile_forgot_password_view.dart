import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/forgot_password_controller.dart';
import '../widgets/forgot_password_footer.dart';
import '../widgets/forgot_password_form_card.dart';
import '../widgets/forgot_password_hero_card.dart';
import '../widgets/forgot_password_step_bar.dart';
import '../widgets/forgot_password_top_bar.dart';
import '../widgets/warden_desk_help_card.dart';

class MobileForgotPasswordView extends GetView<ForgotPasswordController> {
  const MobileForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top bar
              ForgotPasswordTopBar(),
              SizedBox(height: 6),

              // Step indicator: STEP 1 OF 3
              ForgotPasswordStepBar(currentStep: 1, totalSteps: 3),
              SizedBox(height: 14),

              // Hero card with reset illustration
              ForgotPasswordHeroCard(),
              SizedBox(height: 16),

              // Form card with credential input & send button
              ForgotPasswordFormCard(),
              SizedBox(height: 14),

              // Warden Desk assistance card
              WardenDeskHelpCard(),
              SizedBox(height: 20),

              // Footer with Back to Login & Campus Identity Provider badge
              ForgotPasswordFooter(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
