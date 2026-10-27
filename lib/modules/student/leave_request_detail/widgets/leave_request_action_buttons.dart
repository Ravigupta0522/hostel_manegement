import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/leave_request_detail_controller.dart';

class LeaveRequestActionButtons extends GetView<LeaveRequestDetailController> {
  const LeaveRequestActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Primary Button: View Full Leave Application
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            onPressed: controller.viewFullApplication,
            icon: const Icon(Icons.assignment_outlined, size: 19),
            label: Text(
              'View Full Leave Application',
              style: AppTextStyles.labelMedium.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.portalNavy,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // 2. Secondary Row: Call Warden Office & Cancel Request
        Row(
          children: [
            // Call Warden Office Button
            Expanded(
              child: SizedBox(
                height: 44,
                child: OutlinedButton.icon(
                  onPressed: controller.callWardenOffice,
                  icon: const Icon(
                    Icons.phone_in_talk_outlined,
                    size: 16,
                    color: AppColors.textDarkNavy,
                  ),
                  label: Text(
                    'Call Warden Office',
                    style: AppTextStyles.labelSmall.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDarkNavy,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFFE2E8F0)),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 10),

            // Cancel Request Button
            Expanded(
              child: SizedBox(
                height: 44,
                child: OutlinedButton.icon(
                  onPressed: controller.cancelRequest,
                  icon: const Icon(
                    Icons.cancel_outlined,
                    size: 16,
                    color: Color(0xFFE11D48),
                  ),
                  label: Text(
                    'Cancel Request',
                    style: AppTextStyles.labelSmall.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFE11D48),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFFFFE4E6)),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
