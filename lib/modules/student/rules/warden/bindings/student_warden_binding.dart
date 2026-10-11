import 'package:get/get.dart';
import '../controllers/student_warden_controller.dart';

class StudentWardenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentWardenController>(() => StudentWardenController());
  }
}
