import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/reset_password_success_controller.dart';
import '../widgets/account_security_chip.dart';
import '../widgets/campus_portal_card.dart';
import '../widgets/reset_password_cta_button.dart';
import '../widgets/reset_password_footer.dart';
import '../widgets/reset_password_header.dart';
import '../widgets/reset_password_success_badge.dart';
import '../widgets/sessions_secured_card.dart';

class DesktopResetPasswordSuccessView
    extends GetView<ResetPasswordSuccessController> {
  const DesktopResetPasswordSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldDesktop,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Container(
            width: 460,
            decoration: BoxDecoration(
              color: AppColors.scaffoldLight,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.borderLight),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 32),
                ResetPasswordSuccessBadge(),
                SizedBox(height: 16),
                AccountSecurityChip(),
                SizedBox(height: 14),
                ResetPasswordHeader(),
                SizedBox(height: 22),
                CampusPortalCard(),
                SizedBox(height: 14),
                SessionsSecuredCard(),
                SizedBox(height: 24),
                ResetPasswordCtaButton(),
                SizedBox(height: 10),
                ResetPasswordFooter(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
