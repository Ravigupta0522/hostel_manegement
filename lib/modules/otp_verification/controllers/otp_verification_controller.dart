import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../routes/app_routes.dart';

class OtpVerificationController extends GetxController {
  final List<TextEditingController> otpControllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  final RxString maskedEmail = 'm***@campus.edu'.obs;
  final RxInt resendSeconds = 0.obs;
  final RxBool isLoading = false.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    // Pre-fill initial digits 5, 8, 2 as shown in the design prototype
    otpControllers[0].text = '5';
    otpControllers[1].text = '8';
    otpControllers[2].text = '2';
    // Focus on 4th box after frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (focusNodes.length > 3) {
        focusNodes[3].requestFocus();
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    for (var c in otpControllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.onClose();
  }

  void onDigitChanged(int index, String value) {
    if (value.length == 1 && index < 5) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void resendOtp() {
    resendSeconds.value = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendSeconds.value > 0) {
        resendSeconds.value--;
      } else {
        timer.cancel();
      }
    });

    Get.snackbar(
      AppStrings.snackOtpResentTitle,
      '${AppStrings.snackOtpResentMsgPrefix}${maskedEmail.value}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.badgeGreenDot,
      colorText: AppColors.textWhite,
    );
  }

  void editEmail() {
    Get.defaultDialog(
      title: AppStrings.dialogUpdateEmailTitle,
      titleStyle: AppTextStyles.titleSmall.copyWith(
        color: AppColors.textDarkNavy,
        fontWeight: FontWeight.w700,
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextField(
          decoration: const InputDecoration(
            hintText: AppStrings.dialogUpdateEmailHint,
            border: OutlineInputBorder(),
          ),
          onSubmitted: (val) {
            if (val.isNotEmpty) {
              maskedEmail.value = val;
              Get.back();
            }
          },
        ),
      ),
      textConfirm: AppStrings.dialogUpdateEmailConfirm,
      confirmTextColor: AppColors.textWhite,
      buttonColor: AppColors.portalNavy,
      onConfirm: () => Get.back(),
    );
  }

  Future<void> verifyAndProceed() async {
    final code = otpControllers.map((c) => c.text).join();
    if (code.length < 6) {
      Get.snackbar(
        AppStrings.snackOtpIncompleteTitle,
        AppStrings.snackOtpIncompleteMsg,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: AppColors.textWhite,
      );
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 700));
    isLoading.value = false;

    Get.snackbar(
      AppStrings.snackOtpVerifiedTitle,
      AppStrings.snackOtpVerifiedMsg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.badgeGreenDot,
      colorText: AppColors.textWhite,
    );

    Get.toNamed(AppRoutes.resetPassword);
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

  void resendViaSms() {
    Get.snackbar(
      AppStrings.snackSmsDispatchedTitle,
      AppStrings.snackSmsDispatchedMsg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.portalSky,
      colorText: AppColors.textWhite,
    );
  }

  void goBack() {
    Get.back();
  }
}
