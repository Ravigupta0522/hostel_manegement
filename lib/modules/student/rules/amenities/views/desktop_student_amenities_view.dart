import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_amenities_controller.dart';
import '../widgets/amenities_filter_chips.dart';
import '../widgets/amenities_header_banner.dart';
import '../widgets/amenities_list_section.dart';
import '../widgets/amenities_maintenance_bottom_bar.dart';
import '../widgets/amenities_top_bar.dart';

class DesktopStudentAmenitiesView extends GetView<StudentAmenitiesController> {
  const DesktopStudentAmenitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<StudentAmenitiesController>()) {
      Get.put(StudentAmenitiesController());
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: const AmenitiesTopBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AmenitiesHeaderBanner(),
                SizedBox(height: 16),
                AmenitiesFilterChips(),
                SizedBox(height: 16),
                AmenitiesListSection(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AmenitiesMaintenanceBottomBar(),
    );
  }
}
