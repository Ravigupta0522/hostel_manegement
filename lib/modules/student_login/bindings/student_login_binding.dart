import 'package:get/get.dart';
import '../controllers/student_login_controller.dart';

class StudentLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentLoginController>(() => StudentLoginController());
  }
}
