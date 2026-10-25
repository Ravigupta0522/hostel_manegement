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

class MobileStudentLeaveView extends GetView<StudentLeaveController> {
  const MobileStudentLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldLight,
      appBar: LeaveTopBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Banner with Location, Title & "+ New Leave Request" button
            LeaveHeroBanner(),
            SizedBox(height: 20),

            // 2x2 Grid of Balance & Status Petitions
            LeaveBalanceStatusGrid(),
            SizedBox(height: 20),

            // Upcoming Approved Outpass Card with QR Code button
            LeaveUpcomingOutpassCard(),
            SizedBox(height: 24),

            // Recent Requests List
            LeaveRecentRequestsList(),
            SizedBox(height: 24),

            // Leave Policies & Rules Card
            LeavePoliciesRulesCard(),
            SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
