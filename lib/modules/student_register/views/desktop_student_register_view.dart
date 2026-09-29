import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_register_controller.dart';
import '../widgets/student_register_badge_bar.dart';
import '../widgets/student_register_footer.dart';
import '../widgets/student_register_form.dart';
import '../widgets/student_register_header_card.dart';
import '../widgets/student_register_top_bar.dart';

class DesktopStudentRegisterView extends GetView<StudentRegisterController> {
  const DesktopStudentRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Container(
            width: 480,
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFE2E8F0)),
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
                StudentRegisterTopBar(),
                SizedBox(height: 6),
                StudentRegisterBadgeBar(),
                SizedBox(height: 14),
                StudentRegisterHeaderCard(),
                SizedBox(height: 18),
                StudentRegisterForm(),
                SizedBox(height: 16),
                StudentRegisterFooter(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
