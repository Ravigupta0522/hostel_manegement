import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_amenities_controller.dart';
import '../widgets/amenities_filter_chips.dart';
import '../widgets/amenities_header_banner.dart';
import '../widgets/amenities_list_section.dart';
import '../widgets/amenities_maintenance_bottom_bar.dart';
import '../widgets/amenities_top_bar.dart';

class MobileStudentAmenitiesView extends GetView<StudentAmenitiesController> {
  const MobileStudentAmenitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      appBar: AmenitiesTopBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blue Header Banner
            AmenitiesHeaderBanner(),
            SizedBox(height: 16),

            // Horizontal Category Chips
            AmenitiesFilterChips(),
            SizedBox(height: 16),

            // List of Filtered Amenity Cards
            AmenitiesListSection(),
            SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: AmenitiesMaintenanceBottomBar(),
    );
  }
}
