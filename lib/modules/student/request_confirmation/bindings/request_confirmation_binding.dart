import 'package:get/get.dart';
import '../controllers/request_confirmation_controller.dart';

class RequestConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestConfirmationController>(
      () => RequestConfirmationController(),
    );
  }
}
