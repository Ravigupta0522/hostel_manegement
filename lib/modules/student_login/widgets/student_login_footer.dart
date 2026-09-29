import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_login_controller.dart';

class StudentLoginFooter extends GetView<StudentLoginController> {
  const StudentLoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          // Register link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: AppTextStyles.bodySmall.copyWith(
                  color: const Color(0xFF64748B),
                  fontSize: 13,
                ),
              ),
              InkWell(
                onTap: controller.goToRegister,
                child: Text(
                  'Register here',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: const Color(0xFF00288E),
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Institutional footer links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFooterLink('Hostel Helpdesk', () {
                Get.snackbar('Helpdesk', 'Calling Campus Helpdesk: 1800-HOSTEL');
              }),
              _buildBullet(),
              _buildFooterLink('Dorm Guidelines', () {
                Get.snackbar('Guidelines', 'Hostel Code of Conduct & Policies');
              }),
              _buildBullet(),
              _buildFooterLink('Duty Warden', () {
                Get.snackbar('Duty Warden', 'Warden on Duty: Prof. S. Sharma');
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBullet() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Text(
        '•',
        style: TextStyle(
          color: Color(0xFF94A3B8),
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildFooterLink(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: AppTextStyles.bodySmall.copyWith(
          color: const Color(0xFF64748B),
          fontSize: 11.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
