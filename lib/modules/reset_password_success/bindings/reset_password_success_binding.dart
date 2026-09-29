import 'package:get/get.dart';
import '../controllers/reset_password_success_controller.dart';

class ResetPasswordSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordSuccessController>(() => ResetPasswordSuccessController());
  }
}
