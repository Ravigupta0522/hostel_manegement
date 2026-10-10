import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class StudentSettingsController extends GetxController {
  // ─── Toggle States ─────────────────────────────────────────────────
  final RxBool pushNotif      = true.obs;
  final RxBool messAlerts     = true.obs;
  final RxBool leaveUpdates   = false.obs;
  final RxBool confirmAlerts  = true.obs;
  final RxBool isDarkMode     = false.obs;
  final RxBool biometric      = true.obs;
  final RxBool loginActivity  = false.obs;

  // ─── Student Info ──────────────────────────────────────────────────
  final RxString studentName      = 'Rahul Sharma'.obs;
  final RxString hostelName       = 'Sunrise Hostel'.obs;
  final RxString roomNumber       = '204'.obs;
  final RxString blockName        = 'A Block'.obs;
  final RxString bedNumber        = 'B2 (Window side)'.obs;
  final RxString selectedLanguage = 'English (US)'.obs;
  final RxString dateFormat       = 'DD/MM/YYYY'.obs;
  final RxString appVersion       = 'v1.2.1 (Build 890)'.obs;

  // ─── SOS ──────────────────────────────────────────────────────────
  void onSosTap() {
    Get.snackbar(
      'SOS Alert Sent',
      'Emergency alert sent to Warden & Guardian.',
      backgroundColor: const Color(0xFFFFEEEE),
      colorText: const Color(0xFFDC2626),
      icon: const Icon(Icons.sos_rounded, color: Color(0xFFDC2626)),
      snackPosition: SnackPosition.TOP,
    );
  }

  // ─── Logout ────────────────────────────────────────────────────────
  void onLogout() {
    Get.defaultDialog(
      title: 'Sign Out',
      titleStyle: AppTextStyles.titleMedium,
      middleText:
          'Are you sure you want to sign out from the Student Portal?',
      textConfirm: 'Sign Out',
      textCancel: 'Cancel',
      confirmTextColor: Colors.white,
      buttonColor: AppColors.portalNavy,
      onConfirm: () {
        Get.back();
        Get.offAllNamed('/role-selection');
      },
    );
  }

  // ─── Delete Account ───────────────────────────────────────────────
  void onDeleteAccount() {
    Get.defaultDialog(
      title: 'Delete Account',
      titleStyle: AppTextStyles.titleMedium
          .copyWith(color: const Color(0xFFEF4444)),
      middleText:
          'This action is irreversible. Your data will be permanently removed.',
      textConfirm: 'Confirm Delete',
      textCancel: 'Cancel',
      confirmTextColor: Colors.white,
      buttonColor: const Color(0xFFEF4444),
      onConfirm: () => Get.back(),
    );
  }
}
