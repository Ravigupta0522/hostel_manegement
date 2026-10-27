import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/leave_request_detail_controller.dart';

class SecurityPostHelpFooter extends GetView<LeaveRequestDetailController> {
  const SecurityPostHelpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: controller.contactSecurityPost,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 11.5,
                color: AppColors.textSlate,
              ),
              children: [
                TextSpan(text: 'Need urgent gate clearance? '),
                TextSpan(
                  text: 'Contact Main Security Post',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2563EB),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
