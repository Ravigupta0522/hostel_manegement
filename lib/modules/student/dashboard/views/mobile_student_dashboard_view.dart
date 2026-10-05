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

class MobileStudentDashboardView extends GetView<StudentDashboardController> {
  const MobileStudentDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: StudentDashboardTopBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Welcome Banner (Hero Blue Card)
            StudentWelcomeBanner(),
            SizedBox(height: 14),

            // 2. Overview Metrics (Room, Fee, Attendance, Leave, Complaints)
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
            SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: StudentBottomNavBar(),
    );
  }
}
