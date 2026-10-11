import 'package:get/get.dart';
import '../controllers/community_guidelines_controller.dart';

class CommunityGuidelinesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityGuidelinesController>(
      () => CommunityGuidelinesController(),
    );
  }
}
