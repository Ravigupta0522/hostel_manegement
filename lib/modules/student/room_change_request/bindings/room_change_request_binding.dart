import 'package:get/get.dart';
import '../controllers/room_change_request_controller.dart';

class RoomChangeRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoomChangeRequestController>(
      () => RoomChangeRequestController(),
    );
  }
}
