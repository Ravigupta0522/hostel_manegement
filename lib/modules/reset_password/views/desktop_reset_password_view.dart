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

class DesktopResetPasswordView extends GetView<ResetPasswordController> {
  const DesktopResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldDesktop,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 36),
          child: Container(
            width: 480,
            decoration: BoxDecoration(
              color: AppColors.backgroundWhite,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.border),
              boxShadow: [
                BoxShadow(
                  color: AppColors.portalNavy.withValues(alpha: 0.08),
                  blurRadius: 28,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SetNewPasswordTopBar(),
                SizedBox(height: 12),
                SetNewPasswordHeroBadge(),
                SizedBox(height: 14),
                SetNewPasswordChip(),
                SizedBox(height: 14),
                SetNewPasswordHeader(),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: SetNewPasswordForm(),
                ),
                SizedBox(height: 16),
                SetNewPasswordFooter(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
