import 'package:get/get.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../routes/app_routes.dart';

class ResetPasswordSuccessController extends GetxController {
  void backToLogin() {
    Get.offAllNamed(AppRoutes.studentLogin);
  }

  void contactItDesk() {
    Get.snackbar(
      AppStrings.snackItSupportTitle,
      AppStrings.snackItSupportMsg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.portalNavy,
      colorText: AppColors.textWhite,
      duration: const Duration(seconds: 4),
    );
  }

  void showSecurityDetails() {
    Get.snackbar(
      AppStrings.snackSessionClearedTitle,
      AppStrings.snackSessionClearedMsg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.textDarkNavy,
      colorText: AppColors.textWhite,
    );
  }
}
