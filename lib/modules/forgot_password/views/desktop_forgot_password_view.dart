import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/forgot_password_controller.dart';
import '../widgets/forgot_password_footer.dart';
import '../widgets/forgot_password_form_card.dart';
import '../widgets/forgot_password_hero_card.dart';
import '../widgets/forgot_password_step_bar.dart';
import '../widgets/forgot_password_top_bar.dart';
import '../widgets/warden_desk_help_card.dart';

class DesktopForgotPasswordView extends GetView<ForgotPasswordController> {
  const DesktopForgotPasswordView({super.key});

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
                ForgotPasswordTopBar(),
                SizedBox(height: 6),
                ForgotPasswordStepBar(currentStep: 1, totalSteps: 3),
                SizedBox(height: 14),
                ForgotPasswordHeroCard(),
                SizedBox(height: 16),
                ForgotPasswordFormCard(),
                SizedBox(height: 14),
                WardenDeskHelpCard(),
                SizedBox(height: 20),
                ForgotPasswordFooter(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
