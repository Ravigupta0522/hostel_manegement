import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/leave_request_detail_controller.dart';

class LeaveReviewTimelineCard extends GetView<LeaveRequestDetailController> {
  const LeaveReviewTimelineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F172A),
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Zigzag Icon, Title & Stage Pill
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.trending_up_rounded,
                    size: 20,
                    color: Color(0xFF2563EB),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Approval Timeline',
                    style: AppTextStyles.titleMedium.copyWith(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDarkNavy,
                    ),
                  ),
                ],
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3.5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEF2FF),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    controller.currentStage.value,
                    style: AppTextStyles.labelSmall.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF4F46E5),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // ── Stage 1: Request Submitted
          _buildTimelineNode(
            icon: const Icon(
              Icons.check_circle_rounded,
              color: Color(0xFF10B981),
              size: 20,
            ),
            lineColor: const Color(0xFF10B981),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Request Submitted',
                      style: AppTextStyles.titleSmall.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDarkNavy,
                      ),
                    ),
                    Text(
                      'Oct 22, 09:30 AM',
                      style: AppTextStyles.labelSmall.copyWith(
                        fontSize: 10.5,
                        color: AppColors.textSlate,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  'Leave request registered on student portal. Automated parent notification dispatched via SMS & email.',
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 11.5,
                    color: AppColors.textSlate,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      size: 13,
                      color: Color(0xFF10B981),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Portal Record ID: #REC-4902',
                      style: AppTextStyles.labelSmall.copyWith(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSlate,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),

          // ── Stage 2: Guardian Verification
          _buildTimelineNode(
            icon: const Icon(
              Icons.check_circle_rounded,
              color: Color(0xFF10B981),
              size: 20,
            ),
            lineColor: const Color(0xFF10B981),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Guardian Verification',
                      style: AppTextStyles.titleSmall.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDarkNavy,
                      ),
                    ),
                    Text(
                      'Oct 22, 10:15 AM',
                      style: AppTextStyles.labelSmall.copyWith(
                        fontSize: 10.5,
                        color: AppColors.textSlate,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                RichText(
                  text: TextSpan(
                    style: AppTextStyles.bodySmall.copyWith(
                      fontSize: 11.5,
                      color: AppColors.textSlate,
                      height: 1.35,
                    ),
                    children: const [
                      TextSpan(text: 'Parent '),
                      TextSpan(
                        text: 'Rajesh Sharma',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDarkNavy,
                        ),
                      ),
                      TextSpan(
                        text: ' acknowledged SMS verification token (+91 ••••• 8912).',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: const Color(0xFFDBEAFE)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.shield_outlined,
                        size: 11,
                        color: Color(0xFF0284C7),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '2FA Verified',
                        style: AppTextStyles.labelSmall.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF0284C7),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),

          // ── Stage 3: Under Review by Warden (Active with inner card)
          _buildTimelineNode(
            icon: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Color(0xFFFEF3C7),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.hourglass_top_rounded,
                color: Color(0xFFD97706),
                size: 13,
              ),
            ),
            lineColor: const Color(0xFFE2E8F0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Under Review by Warden',
                      style: AppTextStyles.titleSmall.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDarkNavy,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF3C7),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'IN PROGRESS',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFFB45309),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Est. ~4h',
                          style: AppTextStyles.labelSmall.copyWith(
                            fontSize: 10.5,
                            color: AppColors.textSlate,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Assistant Warden Inner Box
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFBEB),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFFDE68A)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDE68A),
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFF59E0B)),
                        ),
                        child: Center(
                          child: Obx(
                            () => Text(
                              controller.wardenInitials.value,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFFB45309),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                controller.wardenName.value,
                                style: const TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textDarkNavy,
                                ),
                              ),
                            ),
                            Obx(
                              () => Text(
                                controller.wardenRole.value,
                                style: const TextStyle(
                                  fontSize: 10.5,
                                  color: AppColors.textSlate,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),
                Text(
                  'Prescription document under clinic verification. Final review underway before gate token issuance.',
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 11.5,
                    color: AppColors.textSlate,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),

          // ── Stage 4: Approved & Digital Outpass (Pending)
          _buildTimelineNode(
            icon: const Icon(
              Icons.auto_awesome_outlined,
              color: Color(0xFF94A3B8),
              size: 20,
            ),
            lineColor: Colors.transparent,
            isLast: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Approved & Digital Outpass',
                      style: AppTextStyles.titleSmall.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSlate,
                      ),
                    ),
                    Text(
                      'Pending',
                      style: AppTextStyles.labelSmall.copyWith(
                        fontSize: 10.5,
                        color: AppColors.textSlate,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  'Upon approval, biometric gate outpass QR code and turnstile permissions will activate on your dashboard.',
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 11.5,
                    color: AppColors.textSlate,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineNode({
    required Widget icon,
    required Widget child,
    required Color lineColor,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              icon,
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: lineColor,
                    margin: const EdgeInsets.symmetric(vertical: 3),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(child: child),
        ],
      ),
    );
  }
}
