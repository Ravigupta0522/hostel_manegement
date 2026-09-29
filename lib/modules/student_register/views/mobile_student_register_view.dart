import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/student_register_controller.dart';
import '../widgets/student_register_badge_bar.dart';
import '../widgets/student_register_footer.dart';
import '../widgets/student_register_form.dart';
import '../widgets/student_register_header_card.dart';
import '../widgets/student_register_top_bar.dart';

class MobileStudentRegisterView extends GetView<StudentRegisterController> {
  const MobileStudentRegisterView({super.key});

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
              // Top bar with back & branding
              StudentRegisterTopBar(),
              SizedBox(height: 6),

              // Resident Registration badge & Term pill
              StudentRegisterBadgeBar(),
              SizedBox(height: 14),

              // Header card with title & campus watermark
              StudentRegisterHeaderCard(),
              SizedBox(height: 18),

              // Registration Form (Full name, ID, Email, Phone, Passwords, Terms, CTA)
              StudentRegisterForm(),
              SizedBox(height: 16),

              // Footer with OR divider, Login link, and Encryption pill
              StudentRegisterFooter(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
