import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/forgot_password_controller.dart';

class WardenDeskHelpCard extends GetView<ForgotPasswordController> {
  const WardenDeskHelpCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEFF6FE),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFD6E4F8)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            // Headset help icon circle
            Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                color: Color(0xFFDCE8FA),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.support_agent_rounded,
                color: Color(0xFF00288E),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),

            // Text column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Having trouble with campus em...',
                    style: AppTextStyles.labelMedium.copyWith(
                      color: const Color(0xFF0F172A),
                      fontWeight: FontWeight.w700,
                      fontSize: 12.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Visit Warden Desk at Hall Block 4',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: const Color(0xFF64748B),
                      fontSize: 11,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),

            // Desk Info button
            InkWell(
              onTap: controller.showDeskInfo,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: const Color(0xFFDDE7FA),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Desk Info',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: const Color(0xFF00288E),
                    fontWeight: FontWeight.w700,
                    fontSize: 11.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
