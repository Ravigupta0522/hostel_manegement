import 'package:get/get.dart';
import '../controllers/approved_leave_controller.dart';

class ApprovedLeaveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApprovedLeaveController>(() => ApprovedLeaveController());
  }
}

