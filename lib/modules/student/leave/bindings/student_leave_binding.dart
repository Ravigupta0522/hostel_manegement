import 'package:get/get.dart';
import '../controllers/student_leave_controller.dart';

class StudentLeaveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentLeaveController>(
      () => StudentLeaveController(),
    );
  }
}
