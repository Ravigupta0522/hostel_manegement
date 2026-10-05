import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/student_dashboard_controller.dart';
import '../widgets/student_dashboard_top_bar.dart';
import '../widgets/student_welcome_banner.dart';
import '../widgets/student_overview_metrics.dart';
import '../widgets/student_quick_actions.dart';
import '../widgets/student_room_info_card.dart';
import '../widgets/student_fee_summary_card.dart';
import '../widgets/student_attendance_card.dart';
import '../widgets/student_leave_request_card.dart';
import '../widgets/student_recent_complaint_card.dart';
import '../widgets/student_mess_card.dart';
import '../widgets/student_recent_notices_card.dart';
import '../widgets/student_bottom_nav_bar.dart';

class DesktopStudentDashboardView extends GetView<StudentDashboardController> {
  const DesktopStudentDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
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
                StudentDashboardTopBar(),

                // Scrollable Dashboard Body
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Welcome Banner
                      StudentWelcomeBanner(),
                      SizedBox(height: 14),

                      // 2. Overview Metrics
                      StudentOverviewMetrics(),
                      SizedBox(height: 14),

                      // 3. Quick Actions
                      StudentQuickActions(),
                      SizedBox(height: 14),

                      // 4. Room Information Card
                      StudentRoomInfoCard(),
                      SizedBox(height: 14),

                      // 5. Fee Summary Card
                      StudentFeeSummaryCard(),
                      SizedBox(height: 14),

                      // 6. Attendance Card
                      StudentAttendanceCard(),
                      SizedBox(height: 14),

                      // 7. Leave Request Card
                      StudentLeaveRequestCard(),
                      SizedBox(height: 14),

                      // 8. Recent Complaint Card
                      StudentRecentComplaintCard(),
                      SizedBox(height: 14),

                      // 9. Today's Mess Card
                      StudentMessCard(),
                      SizedBox(height: 14),

                      // 10. Recent Notices Card
                      StudentRecentNoticesCard(),
                      SizedBox(height: 8),
                    ],
                  ),
                ),

                // Bottom Nav
                StudentBottomNavBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
