import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/reset_password_controller.dart';
import '../widgets/set_new_password_chip.dart';
import '../widgets/set_new_password_footer.dart';
import '../widgets/set_new_password_form.dart';
import '../widgets/set_new_password_header.dart';
import '../widgets/set_new_password_hero_badge.dart';
import '../widgets/set_new_password_top_bar.dart';

class MobileResetPasswordView extends GetView<ResetPasswordController> {
  const MobileResetPasswordView({super.key});

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
              // Top Bar with back arrow, HostelFlow branding, and profile icon
              SetNewPasswordTopBar(),
              SizedBox(height: 12),

              // Hero Circular Badge with Shield & Key
              SetNewPasswordHeroBadge(),
              SizedBox(height: 14),

              // Account Security Chip
              SetNewPasswordChip(),
              SizedBox(height: 14),

              // Title & Subtitle Header
              SetNewPasswordHeader(),
              SizedBox(height: 20),

              // Form: New Password, Strength Meter, Confirm Password, Checklist, CTA Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SetNewPasswordForm(),
              ),
              SizedBox(height: 16),

              // Footer: Having trouble? Contact Hostel Warden Office
              SetNewPasswordFooter(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
