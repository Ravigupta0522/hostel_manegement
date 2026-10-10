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

class DesktopStudentRulesView extends GetView<StudentRulesController> {
  const DesktopStudentRulesView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<StudentRulesController>()) {
      Get.put(StudentRulesController());
    }

    return Scaffold(
      backgroundColor: AppColors.scaffoldDesktop,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Container(
            width: 520,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.borderLight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Bar
                RulesTopBar(),

                // Scrollable Content
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 14, 16, 32),
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
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
