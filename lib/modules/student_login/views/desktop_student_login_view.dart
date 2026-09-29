import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/student_login_controller.dart';
import '../widgets/student_login_top_bar.dart';
import '../widgets/student_portal_badge_bar.dart';
import '../widgets/campus_banner_card.dart';
import '../widgets/student_login_form_card.dart';
import '../widgets/warden_switch_card.dart';
import '../widgets/student_quick_info_row.dart';
import '../widgets/student_login_footer.dart';

class DesktopStudentLoginView extends GetView<StudentLoginController> {
  const DesktopStudentLoginView({super.key});

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
                StudentLoginTopBar(),
                SizedBox(height: 8),
                StudentPortalBadgeBar(),
                SizedBox(height: 14),
                CampusBannerCard(),
                SizedBox(height: 16),
                StudentLoginFormCard(),
                SizedBox(height: 14),
                WardenSwitchCard(),
                SizedBox(height: 12),
                StudentQuickInfoRow(),
                SizedBox(height: 8),
                StudentLoginFooter(),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
