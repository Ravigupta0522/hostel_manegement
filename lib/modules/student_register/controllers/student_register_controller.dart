import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class StudentRegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final RxString selectedCountryCode = 'IN +91'.obs;
  final List<String> countryCodes = ['IN +91', 'US +1', 'UK +44', 'AE +971'];

  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;
  final RxBool agreeToTerms = false.obs;
  final RxBool isLoading = false.obs;
  final RxInt passwordStrength = 2.obs; // 0: None, 1: Weak, 2: Medium, 3: Strong

  @override
  void onClose() {
    fullNameController.dispose();
    studentIdController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void toggleTerms() {
    agreeToTerms.value = !agreeToTerms.value;
  }

  void onPasswordChanged(String val) {
    if (val.isEmpty) {
      passwordStrength.value = 0;
    } else if (val.length < 6) {
      passwordStrength.value = 1;
    } else if (val.length < 10) {
      passwordStrength.value = 2;
    } else {
      passwordStrength.value = 3;
    }
  }

  Future<void> createAccount() async {
    if (!agreeToTerms.value) {
      Get.snackbar(
        'Terms Required',
        'Please agree to the Hostel Rules & Terms of Residence to continue.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFEF4444),
        colorText: Colors.white,
      );
      return;
    }

    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      await Future.delayed(const Duration(milliseconds: 700));
      isLoading.value = false;

      Get.snackbar(
        'Account Created',
        'Welcome to HostelFlow! Your resident account is active.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF10B981),
        colorText: Colors.white,
      );

      Get.offAllNamed(AppRoutes.studentDashboard);
    }
  }

  void goToLogin() {
    Get.offNamed(AppRoutes.studentLogin);
  }

  void goBack() {
    Get.back();
  }
}
