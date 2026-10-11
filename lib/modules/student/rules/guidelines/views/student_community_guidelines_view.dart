import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/widgets/layout_widgets.dart';
import '../controllers/community_guidelines_controller.dart';
import 'desktop_community_guidelines_view.dart';
import 'mobile_community_guidelines_view.dart';

class StudentCommunityGuidelinesView
    extends GetView<CommunityGuidelinesController> {
  const StudentCommunityGuidelinesView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CommunityGuidelinesController>()) {
      Get.put(CommunityGuidelinesController());
    }

    if (Responsive.isDesktop(context)) {
      return const DesktopCommunityGuidelinesView();
    }
    return const MobileCommunityGuidelinesView();
  }
}
