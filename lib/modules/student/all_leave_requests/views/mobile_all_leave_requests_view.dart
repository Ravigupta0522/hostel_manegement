import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/all_leave_requests_controller.dart';
import '../widgets/all_leave_top_bar.dart';
import '../widgets/leave_request_card_item.dart';
import '../widgets/leave_search_bar.dart';
import '../widgets/leave_status_filter_tabs.dart';
import '../widgets/leave_type_chips.dart';

class MobileAllLeaveRequestsView extends GetView<AllLeaveRequestsController> {
  const MobileAllLeaveRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: const AllLeaveTopBar(),
      body: SafeArea(
        child: Column(
          children: [
            // ── Top Fixed Search and Filter Bar
            Container(
              color: AppColors.backgroundWhite,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LeaveSearchBar(),
                  SizedBox(height: 12),
                  LeaveStatusFilterTabs(),
                  SizedBox(height: 10),
                  LeaveTypeChips(),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFE2E8F0)),

            // ── Scrollable Leave Requests List
            Expanded(
              child: Obx(() {
                final list = controller.filteredRequests;

                if (list.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              color: Color(0xFFEFF6FF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.search_off_rounded,
                              size: 36,
                              color: Color(0xFF3B82F6),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No matching requests found',
                            style: AppTextStyles.titleSmall.copyWith(
                              color: AppColors.textDarkNavy,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Try adjusting your search terms or filters.',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: const Color(0xFF64748B),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          OutlinedButton(
                            onPressed: () {
                              controller.clearSearch();
                              controller.setStatusTab('All');
                              controller.setTypeFilter('Any');
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF1E40AF),
                              side: const BorderSide(color: Color(0xFF1E40AF)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Reset All Filters'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 80),
                  physics: const BouncingScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return LeaveRequestCardItem(request: item);
                  },
                );
              }),
            ),
          ],
        ),
      ),
      // ── Fixed Bottom Button: + Apply for New Leave
      bottomSheet: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F172A).withValues(alpha: 0.06),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
          border: const Border(
            top: BorderSide(color: Color(0xFFE2E8F0)),
          ),
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.studentApplyLeave),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E40AF),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_rounded, size: 20, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    AppStrings.applyForNewLeave,
                    style: AppTextStyles.labelLarge.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
