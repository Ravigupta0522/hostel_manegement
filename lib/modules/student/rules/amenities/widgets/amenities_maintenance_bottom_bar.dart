import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../controllers/student_amenities_controller.dart';

class AmenitiesMaintenanceBottomBar
    extends GetView<StudentAmenitiesController> {
  const AmenitiesMaintenanceBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
        border: const Border(
          top: BorderSide(color: AppColors.borderLight, width: 1),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            onPressed: controller.openMaintenanceTicket,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.portalNavy,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            icon: const Icon(
              Icons.handyman_rounded,
              size: 20,
              color: Colors.white,
            ),
            label: Text(
              'Report Facility Issue / Maintenance',
              style: AppTextStyles.labelLarge.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 13.5,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
