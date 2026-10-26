import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class LeaveDetailBottomSheet extends StatelessWidget {
  final Map<String, dynamic> request;

  const LeaveDetailBottomSheet({super.key, required this.request});

  static void show(BuildContext context, Map<String, dynamic> request) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LeaveDetailBottomSheet(request: request),
    );
  }

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
    final hasDocument = request['hasDocument'] == true;
    final docName = request['docName'];
    final destination = request['destination'] ?? 'Not specified';
    final guardianContact = request['guardianContact'] ?? 'Not specified';

    final isApproved = status.toString().toLowerCase().contains('approved');
    final isRejected = status.toString().toLowerCase().contains('rejected');

    Color badgeBg;
    Color badgeColor;
    if (isApproved) {
      badgeBg = const Color(0xFFD1FAE5);
      badgeColor = const Color(0xFF047857);
    } else if (isRejected) {
      badgeBg = const Color(0xFFFFE4E6);
      badgeColor = const Color(0xFFDC2626);
    } else {
      badgeBg = const Color(0xFFDBEAFE);
      badgeColor = const Color(0xFF1E40AF);
    }

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.82,
      ),
      decoration: const BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFCBD5E1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    id,
                    style: AppTextStyles.labelSmall.copyWith(
                      color: const Color(0xFF64748B),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    type,
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.textDarkNavy,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: badgeBg,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isApproved)
                      const Icon(Icons.check_circle_rounded,
                          size: 13, color: Color(0xFF047857))
                    else if (isRejected)
                      const Icon(Icons.cancel_rounded,
                          size: 13, color: Color(0xFFDC2626))
                    else
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF1E40AF),
                        ),
                      ),
                    const SizedBox(width: 5),
                    Text(
                      status,
                      style: AppTextStyles.labelSmall.copyWith(
                        color: badgeColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(height: 1, color: Color(0xFFE2E8F0)),
          const SizedBox(height: 14),

          // Scrollable content
          Flexible(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Duration box
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Duration',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: const Color(0xFF64748B),
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              duration,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textDarkNavy,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Total',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: const Color(0xFF64748B),
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              totalDays,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textDarkNavy,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Reason
                  Text(
                    'Reason for Leave',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: const Color(0xFF64748B),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    reason,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: const Color(0xFF334155),
                      fontSize: 13,
                      height: 1.45,
                    ),
                  ),

                  // Warden remark or rejection note
                  if (wardenRemark != null) ...[
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF6FF),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFBFDBFE)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.verified_user_rounded,
                              size: 16, color: Color(0xFF2563EB)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Warden Remark',
                                  style: AppTextStyles.labelSmall.copyWith(
                                    color: const Color(0xFF1D4ED8),
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  wardenRemark,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: const Color(0xFF475569),
                                    fontSize: 12,
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
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF1F2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFFFE4E6)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.info_outline_rounded,
                              size: 16, color: Color(0xFFDC2626)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rejection Note',
                                  style: AppTextStyles.labelSmall.copyWith(
                                    color: const Color(0xFFB91C1C),
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  rejectionNote,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: const Color(0xFF475569),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 14),

                  // Destination & Guardian
                  Text(
                    'Destination Address',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: const Color(0xFF64748B),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    destination,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: const Color(0xFF334155),
                      fontSize: 12.5,
                    ),
                  ),

                  const SizedBox(height: 12),
                  Text(
                    'Parent / Guardian Contact',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: const Color(0xFF64748B),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    guardianContact,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: const Color(0xFF334155),
                      fontSize: 12.5,
                    ),
                  ),

                  // Document if available
                  if (hasDocument && docName != null) ...[
                    const SizedBox(height: 14),
                    Text(
                      'Attached Document',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: const Color(0xFF64748B),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.picture_as_pdf_rounded,
                              size: 18, color: Color(0xFFDC2626)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              docName,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: const Color(0xFF0F172A),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 16),
                  Text(
                    submittedDate,
                    style: AppTextStyles.labelSmall.copyWith(
                      color: const Color(0xFF94A3B8),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Close button
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E40AF),
                foregroundColor: Colors.white,
                shape: RoundedRectangle64Border(radius: 12),
                elevation: 0,
              ),
              child: Text(
                'Close',
                style: AppTextStyles.labelLarge.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedRectangle64Border extends RoundedRectangleBorder {
  RoundedRectangle64Border({required double radius})
      : super(borderRadius: BorderRadius.circular(radius));
}
