import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_amenities_controller.dart';
import 'amenity_card.dart';

class AmenitiesListSection extends GetView<StudentAmenitiesController> {
  const AmenitiesListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final items = controller.filteredAmenities;
      final expandedSet = controller.expandedGuidelines;

      return Column(
        children: items.map((item) {
          final isExpanded = expandedSet.contains(item.id);
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: AmenityCard(
              item: item,
              isExpanded: isExpanded,
              onToggleGuidelines: () => controller.toggleGuidelines(item.id),
              onReportIssue: () => controller.openReportIssueDialog(item),
              onCallDutyDesk: controller.callDutyDesk,
            ),
          );
        }).toList(),
      );
    });
  }
}
