import 'package:get/get.dart';
import '../controllers/student_rules_controller.dart';

class StudentRulesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentRulesController>(() => StudentRulesController());
  }
}
