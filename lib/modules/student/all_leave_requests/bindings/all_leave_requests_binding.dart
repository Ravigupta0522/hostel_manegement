import 'package:get/get.dart';
import '../controllers/all_leave_requests_controller.dart';

class AllLeaveRequestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllLeaveRequestsController>(
      () => AllLeaveRequestsController(),
    );
  }
}
