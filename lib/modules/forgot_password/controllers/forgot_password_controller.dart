import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailOrIdController = TextEditingController();

  final RxBool isLoading = false.obs;

  @override
  void onClose() {
    emailOrIdController.dispose();
    super.onClose();
  }

  Future<void> sendVerificationCode() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      await Future.delayed(const Duration(milliseconds: 700));
      isLoading.value = false;

      Get.snackbar(
        'Code Sent',
        'A 6-digit verification code has been dispatched to ${emailOrIdController.text.trim()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF10B981),
        colorText: Colors.white,
      );

      Get.toNamed(AppRoutes.otpVerification);
    }
  }

  void goToLogin() {
    Get.offNamed(AppRoutes.studentLogin);
  }

  void showDeskInfo() {
    Get.snackbar(
      'Warden Helpdesk',
      'Hall Block 4 Desk is open Monday - Saturday, 9:00 AM - 6:00 PM',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    );
  }

  void goBack() {
    Get.back();
  }
}
