import 'package:get/get.dart';
import '../controllers/student_room_controller.dart';

class StudentRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentRoomController>(
      () => StudentRoomController(),
    );
  }
}
