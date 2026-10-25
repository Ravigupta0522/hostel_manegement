import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/student_leave_controller.dart';
import '../widgets/leave_top_bar.dart';
import '../widgets/leave_hero_banner.dart';
import '../widgets/leave_balance_status_grid.dart';
import '../widgets/leave_upcoming_outpass_card.dart';
import '../widgets/leave_recent_requests_list.dart';
import '../widgets/leave_policies_rules_card.dart';

class DesktopStudentLeaveView extends GetView<StudentLeaveController> {
  const DesktopStudentLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldDesktop,
      body: Center(
        child: Container(
          width: 540,
          margin: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            color: AppColors.scaffoldLight,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.borderLight),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F000000),
                blurRadius: 24,
                offset: Offset(0, 8),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: const Column(
            children: [
              LeaveTopBar(),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LeaveHeroBanner(),
                      SizedBox(height: 22),
                      LeaveBalanceStatusGrid(),
                      SizedBox(height: 22),
                      LeaveUpcomingOutpassCard(),
                      SizedBox(height: 26),
                      LeaveRecentRequestsList(),
                      SizedBox(height: 26),
                      LeavePoliciesRulesCard(),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
