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

class MobileStudentLoginView extends GetView<StudentLoginController> {
  const MobileStudentLoginView({super.key});

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
              // Top Bar with back & logo
              StudentLoginTopBar(),
              SizedBox(height: 8),

              // Portal badge + Switch to admin button
              StudentPortalBadgeBar(),
              SizedBox(height: 14),

              // Campus Hostel building banner (User's second image)
              CampusBannerCard(),
              SizedBox(height: 16),

              // Main login form card
              StudentLoginFormCard(),
              SizedBox(height: 14),

              // Warden switcher banner
              WardenSwitchCard(),
              SizedBox(height: 12),

              // Fast Gate Scan & Campus SSID row
              StudentQuickInfoRow(),
              SizedBox(height: 8),

              // Footer links & register link
              StudentLoginFooter(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
