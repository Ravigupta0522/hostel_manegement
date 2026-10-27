import 'package:get/get.dart';
import '../controllers/leave_request_detail_controller.dart';

class LeaveRequestDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaveRequestDetailController>(() => LeaveRequestDetailController());
  }
}
