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

class MobileResetPasswordSuccessView
    extends GetView<ResetPasswordSuccessController> {
  const MobileResetPasswordSuccessView({super.key});

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
    );
  }
}
