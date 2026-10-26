import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'leave_detail_bottom_sheet.dart';

class LeaveRequestCardItem extends StatelessWidget {
  final Map<String, dynamic> request;

  const LeaveRequestCardItem({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final id = request['id'] ?? '';
    final type = request['type'] ?? '';
    final status = request['status'] ?? '';
    final duration = request['duration'] ?? '';
    final totalDays = request['totalDays'] ?? '';
    final reason = request['reason'] ?? '';
    final submittedDate = request['submittedDate'] ?? '';
    final wardenRemark = request['wardenRemark'];
    final rejectionNote = request['rejectionNote'];

    final isApproved = status.toString().toLowerCase().contains('approved');
    final isRejected = status.toString().toLowerCase().contains('rejected');

    // Icon setup
    IconData typeIcon = Icons.event_note_rounded;
    Color iconColor = const Color(0xFF2563EB);
    Color iconBg = const Color(0xFFEFF6FF);

    final typeLower = type.toString().toLowerCase();
    if (typeLower.contains('medical')) {
      typeIcon = Icons.medical_services_rounded;
      iconColor = const Color(0xFF4338CA);
      iconBg = const Color(0xFFEEF2FF);
    } else if (typeLower.contains('home')) {
      typeIcon = Icons.home_rounded;
      iconColor = const Color(0xFF4F46E5);
      iconBg = const Color(0xFFEEF2FF);
    } else if (typeLower.contains('personal')) {
      typeIcon = Icons.person_rounded;
      iconColor = const Color(0xFF0284C7);
      iconBg = const Color(0xFFE0F2FE);
    } else if (typeLower.contains('emergency')) {
      typeIcon = Icons.warning_amber_rounded;
      iconColor = const Color(0xFFE11D48);
      iconBg = const Color(0xFFFFE4E6);
    }

    // Status badge setup
    Color badgeBg;
    Color badgeColor;
    Widget statusIcon;

    if (isApproved) {
      badgeBg = const Color(0xFFD1FAE5);
      badgeColor = const Color(0xFF047857);
      statusIcon = const Icon(
        Icons.check_circle_rounded,
        size: 13,
        color: Color(0xFF047857),
      );
    } else if (isRejected) {
      badgeBg = const Color(0xFFFFE4E6);
      badgeColor = const Color(0xFFDC2626);
      statusIcon = const Icon(
        Icons.cancel_rounded,
        size: 13,
        color: Color(0xFFDC2626),
      );
    } else {
      badgeBg = const Color(0xFFDBEAFE);
      badgeColor = const Color(0xFF1E40AF);
      statusIcon = Container(
        width: 6,
        height: 6,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF1E40AF),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Row 1: Icon, ID, Title & Status Badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    typeIcon,
                    size: 19,
                    color: iconColor,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      id,
                      style: AppTextStyles.labelSmall.copyWith(
                        color: const Color(0xFF64748B),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      type,
                      style: AppTextStyles.titleSmall.copyWith(
                        color: AppColors.textDarkNavy,
                        fontSize: 14.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeBg,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    statusIcon,
                    const SizedBox(width: 5),
                    Text(
                      status,
                      style: AppTextStyles.labelSmall.copyWith(
                        color: badgeColor,
                        fontSize: 10.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ── Row 2: Duration Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.durationLabel,
                      style: AppTextStyles.labelSmall.copyWith(
                        color: const Color(0xFF64748B),
                        fontSize: 10.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      duration,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textDarkNavy,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppStrings.totalDaysLabel,
                      style: AppTextStyles.labelSmall.copyWith(
                        color: const Color(0xFF64748B),
                        fontSize: 10.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      totalDays,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textDarkNavy,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // ── Row 3: Reason Preview
          Text(
            AppStrings.reasonPreviewLabel,
            style: AppTextStyles.labelSmall.copyWith(
              color: const Color(0xFF64748B),
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            reason,
            style: AppTextStyles.bodySmall.copyWith(
              color: const Color(0xFF475569),
              fontSize: 12,
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          // ── Row 4: Optional Remarks / Rejection Note
          if (wardenRemark != null) ...[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFBFDBFE)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 1.5),
                    child: Icon(
                      Icons.verified_user_rounded,
                      size: 14,
                      color: Color(0xFF2563EB),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.wardenRemarkLabel,
                          style: AppTextStyles.labelSmall.copyWith(
                            color: const Color(0xFF1D4ED8),
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          wardenRemark,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: const Color(0xFF475569),
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

          if (rejectionNote != null) ...[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF1F2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFFFE4E6)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 1.5),
                    child: Icon(
                      Icons.info_outline_rounded,
                      size: 14,
                      color: Color(0xFFDC2626),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.rejectionNoteLabel,
                          style: AppTextStyles.labelSmall.copyWith(
                            color: const Color(0xFFB91C1C),
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          rejectionNote,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: const Color(0xFF475569),
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 12),

          // ── Row 5: Submitted Date & View Details Link
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                submittedDate,
                style: AppTextStyles.labelSmall.copyWith(
                  color: const Color(0xFF94A3B8),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                onTap: () => LeaveDetailBottomSheet.show(context, request),
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppStrings.viewDetailsAction,
                        style: AppTextStyles.labelSmall.copyWith(
                          color: const Color(0xFF1E40AF),
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        size: 13,
                        color: Color(0xFF1E40AF),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
