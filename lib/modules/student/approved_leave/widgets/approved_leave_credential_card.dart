import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/approved_leave_controller.dart';

class ApprovedLeaveCredentialCard extends GetView<ApprovedLeaveController> {
  const ApprovedLeaveCredentialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0B2D79),
            Color(0xFF091E54),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x330B2D79),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Label & Location Pin Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'STUDENT LEAVE CREDENTIAL',
                      style: AppTextStyles.labelSmall.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF93C5FD),
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Obx(
                      () => Text(
                        controller.credentialTitle.value,
                        style: AppTextStyles.titleMedium.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: const Color(0xFF2563EB).withValues(alpha: 0.35),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF60A5FA).withValues(alpha: 0.4),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.location_on_rounded,
                    size: 19,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Destination Address Row
          Row(
            children: [
              const Icon(
                Icons.place_outlined,
                size: 14,
                color: Color(0xFF93C5FD),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Obx(
                  () => Text(
                    controller.destination.value,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontSize: 12,
                      color: const Color(0xFFE2E8F0),
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Side-by-Side Schedule Panels
          Row(
            children: [
              // Left: Departure Out
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.flight_takeoff_rounded,
                            size: 13,
                            color: Color(0xFF93C5FD),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Departure Out',
                            style: AppTextStyles.labelSmall.copyWith(
                              fontSize: 10.5,
                              color: const Color(0xFFBFDBFE),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Obx(
                        () => Text(
                          controller.departureDate.value,
                          style: AppTextStyles.titleSmall.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Obx(
                        () => Text(
                          controller.departureTime.value,
                          style: AppTextStyles.bodySmall.copyWith(
                            fontSize: 11,
                            color: const Color(0xFF93C5FD),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // Right: In Curfew
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time_rounded,
                            size: 13,
                            color: Color(0xFF93C5FD),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'In Curfew',
                            style: AppTextStyles.labelSmall.copyWith(
                              fontSize: 10.5,
                              color: const Color(0xFFBFDBFE),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Obx(
                        () => Text(
                          controller.curfewDate.value,
                          style: AppTextStyles.titleSmall.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Obx(
                        () => Text(
                          controller.curfewTime.value,
                          style: AppTextStyles.bodySmall.copyWith(
                            fontSize: 11,
                            color: const Color(0xFF93C5FD),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Footer: Total Allocation Banner
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.timelapse_rounded,
                    size: 15,
                    color: Color(0xFF93C5FD),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Total Allocation',
                    style: AppTextStyles.bodySmall.copyWith(
                      fontSize: 11.5,
                      color: const Color(0xFFBFDBFE),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D4ED8),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFF60A5FA).withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    controller.totalAllocation.value,
                    style: AppTextStyles.labelSmall.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
