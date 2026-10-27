import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/layout_widgets.dart';
import '../controllers/outpass_detail_controller.dart';
import 'desktop_outpass_detail_view.dart';
import 'mobile_outpass_detail_view.dart';

class OutpassDetailView extends GetView<OutpassDetailController> {
  const OutpassDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<OutpassDetailController>()) {
      Get.put(OutpassDetailController());
    }

    if (Responsive.isDesktop(context)) {
      return const DesktopOutpassDetailView();
    }
    return const MobileOutpassDetailView();
  }
}
