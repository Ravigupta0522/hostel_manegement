import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class AuthController extends GetxController {
  // ─── Form Controllers ───────────────────────────────
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();

  final forgotEmailController = TextEditingController();

  final resetPasswordController = TextEditingController();
  final resetConfirmPasswordController = TextEditingController();

  // ─── Form Keys ──────────────────────────────────────
  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();
  final forgotFormKey = GlobalKey<FormState>();
  final resetFormKey = GlobalKey<FormState>();

  // ─── State ──────────────────────────────────────────
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxString selectedRole = 'student'.obs; // 'student' or 'admin'

  // ─── OTP ────────────────────────────────────────────
  final List<TextEditingController> otpControllers =
      List.generate(6, (_) => TextEditingController());
  final RxString otpEmail = ''.obs;
  final RxInt otpResendTimer = 0.obs;

  @override
  void onClose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    registerNameController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();
    forgotEmailController.dispose();
    resetPasswordController.dispose();
    resetConfirmPasswordController.dispose();
    for (final c in otpControllers) {
      c.dispose();
    }
    super.onClose();
  }

  // ─── Actions ────────────────────────────────────────

  void selectRole(String role) {
    selectedRole.value = role;
    errorMessage.value = '';
  }

  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) return;
    errorMessage.value = '';
    isLoading.value = true;
    try {
      // TODO: Connect to API service
      await Future.delayed(const Duration(seconds: 1));

      // Navigate based on role
      if (selectedRole.value == 'admin') {
        Get.offAllNamed(AppRoutes.adminDashboard);
      } else {
        Get.offAllNamed(AppRoutes.studentDashboard);
      }
    } catch (e) {
      errorMessage.value = 'Invalid credentials. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register() async {
    if (!registerFormKey.currentState!.validate()) return;
    errorMessage.value = '';
    isLoading.value = true;
    try {
      // TODO: Connect to API service
      await Future.delayed(const Duration(seconds: 1));
      otpEmail.value = registerEmailController.text;
      Get.toNamed(AppRoutes.otpVerification);
    } catch (e) {
      errorMessage.value = 'Registration failed. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> forgotPassword() async {
    if (!forgotFormKey.currentState!.validate()) return;
    errorMessage.value = '';
    isLoading.value = true;
    try {
      // TODO: Connect to API service
      await Future.delayed(const Duration(seconds: 1));
      otpEmail.value = forgotEmailController.text;
      Get.toNamed(AppRoutes.otpVerification);
    } catch (e) {
      errorMessage.value = 'Failed to send OTP. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOtp() async {
    final otp = otpControllers.map((c) => c.text).join();
    if (otp.length < 6) {
      errorMessage.value = 'Please enter the complete 6-digit OTP.';
      return;
    }
    errorMessage.value = '';
    isLoading.value = true;
    try {
      // TODO: Connect to API service
      await Future.delayed(const Duration(seconds: 1));
      Get.toNamed(AppRoutes.resetPassword);
    } catch (e) {
      errorMessage.value = 'Invalid OTP. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetPassword() async {
    if (!resetFormKey.currentState!.validate()) return;
    errorMessage.value = '';
    isLoading.value = true;
    try {
      // TODO: Connect to API service
      await Future.delayed(const Duration(seconds: 1));
      Get.offAllNamed(AppRoutes.login);
      Get.snackbar(
        'Success',
        'Password reset successfully. Please login.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      errorMessage.value = 'Failed to reset password. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  void goToRegister() => Get.toNamed(AppRoutes.register);
  void goToLogin() => Get.offAllNamed(AppRoutes.login);
  void goToForgotPassword() => Get.toNamed(AppRoutes.forgotPassword);
}
