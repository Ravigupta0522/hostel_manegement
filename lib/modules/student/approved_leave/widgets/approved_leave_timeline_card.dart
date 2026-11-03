import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/approved_leave_controller.dart';

class ApprovedLeaveTimelineCard extends GetView<ApprovedLeaveController> {
  const ApprovedLeaveTimelineCard({super.key});

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
          // Header: Title & Tracked Steps Pill
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Approval Timeline',
                style: AppTextStyles.titleMedium.copyWith(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDarkNavy,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3.5),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  '3 of 5 steps tracked',
                  style: AppTextStyles.labelSmall.copyWith(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF2563EB),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // Steps List
          _buildTimelineStep(
            icon: const Icon(
              Icons.check_circle_rounded,
              color: Color(0xFF10B981),
              size: 20,
            ),
            title: 'Request Submitted',
            time: 'Oct 03, 10:14 AM',
            richDescription: RichText(
              text: TextSpan(
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 11.5,
                  color: AppColors.textSlate,
                ),
                children: const [
                  TextSpan(text: 'Initiated by Student '),
                  TextSpan(
                    text: 'Marcus Vance',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDarkNavy,
                    ),
                  ),
                  TextSpan(text: ' (Room R-204)'),
                ],
              ),
            ),
            lineColor: const Color(0xFF10B981),
            isLast: false,
          ),

          _buildTimelineStep(
            icon: const Icon(
              Icons.check_circle_rounded,
              color: Color(0xFF10B981),
              size: 20,
            ),
            title: 'Guardian Verification',
            time: 'Oct 03, 11:30 AM',
            richDescription: RichText(
              text: TextSpan(
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 11.5,
                  color: AppColors.textSlate,
                ),
                children: const [
                  TextSpan(text: 'SMS counter-approval confirmed by '),
                  TextSpan(
                    text: 'David Richardson',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDarkNavy,
                    ),
                  ),
                  TextSpan(text: ' (Parent)'),
                ],
              ),
            ),
            lineColor: const Color(0xFF10B981),
            isLast: false,
          ),

          _buildTimelineStep(
            icon: const Icon(
              Icons.check_circle_rounded,
              color: Color(0xFF10B981),
              size: 20,
            ),
            title: 'Warden Approval',
            time: 'Oct 03, 04:14 PM',
            richDescription: RichText(
              text: TextSpan(
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 11.5,
                  color: AppColors.textSlate,
                ),
                children: const [
                  TextSpan(text: 'Sanctioned by Chief Warden '),
                  TextSpan(
                    text: 'Dr. Robert Vance',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDarkNavy,
                    ),
                  ),
                ],
              ),
            ),
            lineColor: const Color(0xFF2563EB),
            isLast: false,
          ),

          _buildTimelineStep(
            icon: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Color(0xFF1D4ED8),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                size: 13,
              ),
            ),
            title: 'Gate Departure',
            badge: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFFBFDBFE)),
              ),
              child: Text(
                'Next Event',
                style: AppTextStyles.labelSmall.copyWith(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1D4ED8),
                ),
              ),
            ),
            richDescription: RichText(
              text: TextSpan(
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 11.5,
                  color: AppColors.textSlate,
                ),
                children: const [
                  TextSpan(text: 'Scheduled: '),
                  TextSpan(
                    text: 'Oct 04, 04:00 PM',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDarkNavy,
                    ),
                  ),
                  TextSpan(text: ' • South Turnstile Gate 2'),
                ],
              ),
            ),
            lineColor: const Color(0xFFCBD5E1),
            isLast: false,
          ),

          _buildTimelineStep(
            icon: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF94A3B8), width: 1.5),
              ),
              child: const Icon(
                Icons.access_time_rounded,
                color: Color(0xFF94A3B8),
                size: 11,
              ),
            ),
            title: 'Curfew Check-in',
            time: 'Oct 06, 09:00 PM',
            richDescription: Text(
              'Pending biometric scanner log at Westwood Floor 2 Terminal',
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 11.5,
                color: AppColors.textSlate,
              ),
            ),
            lineColor: Colors.transparent,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineStep({
    required Widget icon,
    required String title,
    String? time,
    Widget? badge,
    required Widget richDescription,
    required Color lineColor,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon & Line Column
          Column(
            children: [
              icon,
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: lineColor,
                  ),
                ),
            ],
          ),

          const SizedBox(width: 12),

          // Content Column
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            title,
                            style: AppTextStyles.titleSmall.copyWith(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textDarkNavy,
                            ),
                          ),
                          if (badge != null) ...[
                            const SizedBox(width: 8),
                            badge,
                          ],
                        ],
                      ),
                      if (time != null)
                        Text(
                          time,
                          style: AppTextStyles.labelSmall.copyWith(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF64748B),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  richDescription,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

