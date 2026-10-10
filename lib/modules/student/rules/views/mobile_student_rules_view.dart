import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/student_rules_controller.dart';
import '../widgets/rules_top_bar.dart';
import '../widgets/rules_hero_banner.dart';
import '../widgets/rules_occupancy_card.dart';
import '../widgets/rules_residence_profile_card.dart';
import '../widgets/rules_facilities_grid.dart';
import '../widgets/rules_staff_help_desk.dart';
import '../widgets/rules_resident_portals.dart';
import '../widgets/rules_reassignment_button.dart';

class MobileStudentRulesView extends GetView<StudentRulesController> {
  const MobileStudentRulesView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<StudentRulesController>()) {
      Get.put(StudentRulesController());
    }

    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: RulesTopBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16, 14, 16, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Hero Campus Card
            RulesHeroBanner(),
            SizedBox(height: 14),

            // 2. Live Occupancy Status Card
            RulesOccupancyCard(),
            SizedBox(height: 18),

            // 3. Residence Profile Section
            RulesResidenceProfileCard(),
            SizedBox(height: 18),

            // 4. Community Facilities Grid
            RulesFacilitiesGrid(),
            SizedBox(height: 18),

            // 5. Staff & Help Desk Section
            RulesStaffHelpDesk(),
            SizedBox(height: 18),

            // 6. Resident Portals
            RulesResidentPortals(),
            SizedBox(height: 20),

            // 7. Request Reassignment Button
            RulesReassignmentButton(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
