import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/student_leave_controller.dart';

class LeaveRecentRequestsList extends GetView<StudentLeaveController> {
  const LeaveRecentRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  AppStrings.leaveRecentRequests,
                  style: AppTextStyles.titleSmall.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDarkNavy,
                  ),
                ),
                const SizedBox(width: 8),
                Obx(
                  () => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.scaffoldDesktop,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      '${controller.recentRequests.length}',
                      style: AppTextStyles.labelSmall.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textSlate,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () => Get.toNamed(AppRoutes.studentAllLeaveRequests),
              borderRadius: BorderRadius.circular(6),
              child: Row(
                children: [
                  Text(
                    AppStrings.leaveViewAll,
                    style: AppTextStyles.labelSmall.copyWith(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    size: 13,
                    color: AppColors.primaryBlue,
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // ── Requests List
        Obx(
          () => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.recentRequests.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final req = controller.recentRequests[index];
              return _buildRequestCard(req);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRequestCard(Map<String, dynamic> req) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Top: Icon, Title, Ref & Status Badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: req['iconBg'] as Color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  req['icon'] as IconData,
                  size: 18,
                  color: req['iconColor'] as Color,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      req['type'] as String,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDarkNavy,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      req['ref'] as String,
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize: 10.5,
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
                decoration: BoxDecoration(
                  color: req['statusBg'] as Color,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  req['status'] as String,
                  style: AppTextStyles.labelSmall.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: req['statusColor'] as Color,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // ── Dates bar (Duration & Submission Date)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.fieldBgLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  req['dates'] as String,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.pdfDarkBar,
                  ),
                ),
                Text(
                  req['submittedDate'] as String,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSlate,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // ── Reason text
          Text(
            'Reason: ${req['reason']}',
            style: AppTextStyles.bodySmall.copyWith(
              fontSize: 11,
              color: AppColors.textSecondary,
              height: 1.45,
              fontWeight: FontWeight.w500,
            ),
          ),

          // ── Optional Warden Remark Box
          if (req['wardenRemark'] != null) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.softBlue,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.softBlueBorder),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.security_rounded,
                    size: 13,
                    color: AppColors.primaryBlue,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyles.bodySmall.copyWith(
                          fontSize: 10.5,
                          color: AppColors.primary,
                          height: 1.4,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Warden Remark: ',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          TextSpan(text: req['wardenRemark'] as String),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 10),
          const Divider(height: 1, color: AppColors.divider),
          const SizedBox(height: 8),

          // ── Footer row (Document / Check-in info & Action Link)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (req['hasDocument'] == true) ...[
                Row(
                  children: [
                    const Icon(
                      Icons.attach_file_rounded,
                      size: 13,
                      color: AppColors.textSlate,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      req['documentText'] as String,
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize: 10.5,
                        color: AppColors.textSlate,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ] else if (req['checkedIn'] != null) ...[
                Row(
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      size: 13,
                      color: AppColors.badgeGreenText,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      req['checkedIn'] as String,
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize: 10.5,
                        color: AppColors.badgeGreenText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ] else ...[
                const SizedBox(),
              ],
              // Action link
              InkWell(
                onTap: () {
                  if (req['status'] == 'Approved') {
                    Get.toNamed(AppRoutes.studentOutpassDetail, arguments: req);
                  } else {
                    Get.toNamed(
                      AppRoutes.studentLeaveRequestDetail,
                      arguments: req,
                    );
                  }
                },
                child: Row(
                  children: [
                    Text(
                      req['status'] == 'Approved'
                          ? 'View Outpass Slip'
                          : req['status'] == 'Completed'
                              ? 'Summary'
                              : 'Details',
                      style: AppTextStyles.labelSmall.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    const SizedBox(width: 3),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 9,
                      color: AppColors.primaryBlue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
