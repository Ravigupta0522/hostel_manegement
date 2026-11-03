import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/approved_leave_controller.dart';

class ApprovedLeaveHallDeskHelpCard extends GetView<ApprovedLeaveController> {
  const ApprovedLeaveHallDeskHelpCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDBEAFE)),
      ),
      child: Row(
        children: [
          // Headset Support Icon Box
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFBFDBFE)),
            ),
            child: const Center(
              child: Icon(
                Icons.support_agent_rounded,
                size: 20,
                color: Color(0xFF1D4ED8),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Text Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Plans Changed or Delayed?',
                  style: AppTextStyles.labelMedium.copyWith(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDarkNavy,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  'Call 24/7 Westwood Hall Desk',
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 11,
                    color: const Color(0xFF64748B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Action Call Button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: controller.callWestwoodHallDesk,
              borderRadius: BorderRadius.circular(100),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFBFDBFE)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0A0F172A),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.phone_in_talk_rounded,
                    size: 17,
                    color: Color(0xFF1D4ED8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

