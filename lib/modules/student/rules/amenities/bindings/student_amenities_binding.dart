import 'package:get/get.dart';
import '../controllers/student_amenities_controller.dart';

class StudentAmenitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentAmenitiesController>(
      () => StudentAmenitiesController(),
    );
  }
}
