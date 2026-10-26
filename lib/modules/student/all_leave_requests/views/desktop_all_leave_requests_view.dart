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

class DesktopAllLeaveRequestsView extends GetView<AllLeaveRequestsController> {
  const DesktopAllLeaveRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: const AllLeaveTopBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 840),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Filter container
              Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: LeaveSearchBar()),
                        const SizedBox(width: 16),
                        ElevatedButton.icon(
                          onPressed: () => Get.toNamed(AppRoutes.studentApplyLeave),
                          icon: const Icon(Icons.add_rounded, size: 18),
                          label: Text(
                            AppStrings.applyForNewLeave,
                            style: AppTextStyles.labelMedium.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E40AF),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: LeaveStatusFilterTabs()),
                        SizedBox(width: 16),
                        LeaveTypeChips(),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Request list
              Expanded(
                child: Obx(() {
                  final list = controller.filteredRequests;

                  if (list.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.search_off_rounded,
                            size: 48,
                            color: Color(0xFF94A3B8),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'No matching requests found',
                            style: AppTextStyles.titleMedium.copyWith(
                              color: AppColors.textDarkNavy,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Try clearing search terms or selecting another filter.',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: const Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 32),
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
      ),
    );
  }
}
