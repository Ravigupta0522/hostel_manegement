import 'package:get/get.dart';
import '../controllers/outpass_detail_controller.dart';

class OutpassDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OutpassDetailController>(() => OutpassDetailController());
  }
}
