import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../models/warden_contact_models.dart';

class StudentWardenController extends GetxController {
  final TextEditingController messageController = TextEditingController();

  final Rx<InquiryCategory> selectedCategory =
      InquiryCategory.gatePass.obs;
  final RxBool isSending = false.obs;

  // Warden Data matching uploaded screenshot
  final WardenProfile chiefWarden = const WardenProfile(
    name: 'Prof. Alan G. Thorne',
    designation: 'Chief Hostel Warden',
    subTitle: 'Senior Faculty Advisor • Residential Life & Quadrangle',
    department: 'Office of Student Residence & Campus Community',
    officeLocation: 'Hall Block 4, Ground Floor, Suite #G-12',
    locationDetails: 'North Campus Quadrangle',
    visitingHours: 'Mon – Fri: 09:30 AM – 12:30 PM',
    visitingHoursEvening: 'Evening Session: 03:00 PM – 05:00 PM',
    photoAsset: 'assets/images/warden_prof_thorne.jpg',
    phoneExtension: 'Ext. 2834',
    email: 'warden.residence@campus.edu',
    isInOffice: true,
  );

  // Assistant Warden
  final AssistantWardenInfo assistantWarden = const AssistantWardenInfo(
    name: 'Dr. Robert Vance',
    initials: 'RV',
    designation: 'Assistant Warden • Wing North',
    responsibilities: 'Curfew & Daily Night Operations',
    phoneNumber: '+1 (555) 019-4820',
    isOnline: true,
  );

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }

  void selectCategory(InquiryCategory category) {
    selectedCategory.value = category;
  }

  void callOffice() {
    Get.snackbar(
      'Connecting Call',
      'Dialing ${chiefWarden.phoneExtension} (${chiefWarden.name} Office)...',
      backgroundColor: const Color(0xFFEFF6FF),
      colorText: AppColors.portalNavy,
      icon: const Icon(Icons.phone_in_talk_rounded, color: AppColors.portalNavy),
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );
  }

  void sendEmail() {
    Get.snackbar(
      'Opening Mail Client',
      'Composing mail to ${chiefWarden.email}',
      backgroundColor: const Color(0xFFEFF6FF),
      colorText: const Color(0xFF1D4ED8),
      icon: const Icon(Icons.email_outlined, color: Color(0xFF1D4ED8)),
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );
  }

  void deskChat() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFECFDF5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.chat_bubble_rounded,
                        color: Color(0xFF059669),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Warden Desk Live Chat',
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDarkNavy,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.textSecondary),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Office Reception Desk is currently available for quick queries.',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.back();
                  Get.snackbar(
                    'Chat Initiated',
                    'A duty proctor will connect with your student terminal shortly.',
                    backgroundColor: const Color(0xFFECFDF5),
                    colorText: const Color(0xFF065F46),
                    icon: const Icon(Icons.check_circle_rounded,
                        color: Color(0xFF059669)),
                    snackPosition: SnackPosition.TOP,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF059669),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.mark_chat_unread_rounded),
                label: const Text('Start Student Session'),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void callAssistantWarden() {
    Get.snackbar(
      'Calling Assistant Warden',
      'Connecting to ${assistantWarden.name} (${assistantWarden.phoneNumber})...',
      backgroundColor: const Color(0xFFEFF6FF),
      colorText: AppColors.portalNavy,
      icon: const Icon(Icons.phone_rounded, color: AppColors.portalNavy),
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );
  }

  void callEmergency() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: Color(0xFFFEE2E2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.emergency_rounded,
                  color: Color(0xFFDC2626),
                  size: 30,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Campus Emergency Guard',
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF991B1B),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Are you sure you want to trigger 24/7 Rapid Emergency Response for immediate medical, fire, or security distress?',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(0, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.snackbar(
                          'SOS Dispatched',
                          'Campus First Responders & Medical Team have been alerted to your registered room location.',
                          backgroundColor: const Color(0xFFFEF2F2),
                          colorText: const Color(0xFF991B1B),
                          icon: const Icon(Icons.warning_amber_rounded,
                              color: Color(0xFFDC2626)),
                          snackPosition: SnackPosition.TOP,
                          duration: const Duration(seconds: 5),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDC2626),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Confirm SOS'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) {
      Get.snackbar(
        'Message Required',
        'Please enter your query details before sending.',
        backgroundColor: const Color(0xFFFEF2F2),
        colorText: const Color(0xFF991B1B),
        icon: const Icon(Icons.info_outline_rounded, color: Color(0xFFDC2626)),
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    isSending.value = true;
    Future.delayed(const Duration(milliseconds: 600), () {
      isSending.value = false;
      final receiptId =
          'WD-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
      messageController.clear();

      Get.dialog(
        Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    color: Color(0xFFECFDF5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle_rounded,
                    color: Color(0xFF059669),
                    size: 32,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Inquiry Logged Successfully',
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDarkNavy,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Your ${selectedCategory.value.label} inquiry has been logged with official record receipt #$receiptId.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Text(
                    'Receipt Code: $receiptId',
                    style: AppTextStyles.labelMedium.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.portalNavy,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.portalNavy,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 44),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Done'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
