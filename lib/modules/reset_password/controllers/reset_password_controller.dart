import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../routes/app_routes.dart';

class ResetPasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final RxBool isNewPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;
  final RxBool isLoading = false.obs;

  // Real-time strength & requirement observables
  final RxInt passwordStrength = 4.obs; // Pre-filled to 4 for initial design prototype
  final RxBool hasMin8Chars = true.obs;
  final RxBool hasNumericOrSpecial = true.obs;
  final RxBool passwordsMatch = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Pre-fill initial prototype values as depicted in the design screenshot
    newPasswordController.text = 'SuperSecretPass123!';
    confirmPasswordController.text = 'SuperSecretPass123!';
    evaluateRequirements();
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void onPasswordChanged(String value) {
    evaluateRequirements();
  }

  void onConfirmPasswordChanged(String value) {
    evaluateRequirements();
  }

  void evaluateRequirements() {
    final pass = newPasswordController.text;
    final confirm = confirmPasswordController.text;

    hasMin8Chars.value = pass.length >= 8;
    hasNumericOrSpecial.value =
        pass.contains(RegExp(r'[0-9]')) || pass.contains(RegExp(r'[!@#\$&*~]'));
    passwordsMatch.value = pass.isNotEmpty && pass == confirm;

    int score = 0;
    if (pass.isNotEmpty) score++;
    if (pass.length >= 8) score++;
    if (pass.contains(RegExp(r'[0-9]'))) score++;
    if (pass.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) score++;

    passwordStrength.value = score;
  }

  String get strengthLabel {
    switch (passwordStrength.value) {
      case 0:
      case 1:
        return AppStrings.strengthWeak;
      case 2:
        return AppStrings.strengthFair;
      case 3:
        return AppStrings.strengthGood;
      case 4:
      default:
        return AppStrings.strengthStrong;
    }
  }

  Color get strengthColor {
    switch (passwordStrength.value) {
      case 0:
      case 1:
        return AppColors.error;
      case 2:
        return AppColors.warning;
      case 3:
        return AppColors.info;
      case 4:
      default:
        return AppColors.successRingDark;
    }
  }

  Future<void> submitResetPassword() async {
    evaluateRequirements();

    if (!hasMin8Chars.value || !hasNumericOrSpecial.value) {
      Get.snackbar(
        AppStrings.snackWeakPasswordTitle,
        AppStrings.snackWeakPasswordMsg,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: AppColors.textWhite,
      );
      return;
    }

    if (!passwordsMatch.value) {
      Get.snackbar(
        AppStrings.snackPasswordMismatchTitle,
        AppStrings.snackPasswordMismatchMsg,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: AppColors.textWhite,
      );
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 650));
    isLoading.value = false;

    // Navigate to the Password Reset Complete screen (second image)
    Get.toNamed(AppRoutes.resetPasswordSuccess);
  }

  void contactWarden() {
    Get.snackbar(
      AppStrings.snackWardenHelpdeskTitle,
      AppStrings.snackWardenHelpdeskMsg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.portalNavy,
      colorText: AppColors.textWhite,
    );
  }

  void goBack() {
    Get.back();
  }
}
