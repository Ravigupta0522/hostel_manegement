import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class StudentLoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailOrIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isPasswordVisible = false.obs;
  final RxBool rememberMe = true.obs;
  final RxBool isLoading = false.obs;

  @override
  void onClose() {
    emailOrIdController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  Future<void> signIn() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      await Future.delayed(const Duration(milliseconds: 600));
      isLoading.value = false;
      Get.offAllNamed(AppRoutes.studentDashboard);
    }
  }

  void switchToAdmin() {
    Get.offNamed(AppRoutes.login);
  }

  void goToRegister() {
    Get.toNamed(AppRoutes.register);
  }

  void goToForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }

  void showGateScanInfo() {
    Get.snackbar(
      'Gate Pass',
      'Digital QR code entry pass is active for North Wing',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void showWifiInfo() {
    Get.snackbar(
      'Campus Wi-Fi',
      'SSID: HostelNet-5G (Active throughout Block C)',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void goBack() {
    Get.back();
  }
}
