import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/apply_leave_controller.dart';

class LeaveReviewConfirmationSheet extends GetView<ApplyLeaveController> {
  const LeaveReviewConfirmationSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const LeaveReviewConfirmationSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final leaveType = controller.selectedLeaveType.value;
    final isMedical = controller.isMedicalLeave;
    final reason = controller.reasonController.text.trim();
    final destination = controller.destinationController.text.trim();
    final studentPhone = controller.contactNumberController.text.trim();
    final parentName = controller.parentNameController.text.trim();
    final parentRel = controller.parentRelation.value;
    final guardianPhone = controller.guardianContactController.text.trim();

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.88,
      ),
      decoration: const BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Drag Handle
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: 42,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFCBD5E1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 14),

          // ── Sheet Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.assignment_turned_in_rounded,
                    size: 24,
                    color: Color(0xFF1E40AF),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.reviewLeaveTitle,
                        style: AppTextStyles.titleMedium.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDarkNavy,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        AppStrings.reviewLeaveSubtitle,
                        style: AppTextStyles.bodySmall.copyWith(
                          fontSize: 11.5,
                          color: AppColors.textSlate,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close_rounded, size: 20),
                  color: const Color(0xFF64748B),
                  splashRadius: 18,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),
          const Divider(height: 1, color: Color(0xFFE2E8F0)),

          // ── Scrollable Review Content
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Leave Type & Dates Highlight Box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: isMedical
                                    ? const Color(0xFFEEF2FF)
                                    : const Color(0xFFEFF6FF),
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: isMedical
                                      ? const Color(0xFFC7D2FE)
                                      : const Color(0xFFBFDBFE),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    isMedical
                                        ? Icons.medical_services_rounded
                                        : Icons.event_available_rounded,
                                    size: 13,
                                    color: isMedical
                                        ? const Color(0xFF4338CA)
                                        : const Color(0xFF1D4ED8),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    leaveType,
                                    style: AppTextStyles.labelSmall.copyWith(
                                      color: isMedical
                                          ? const Color(0xFF4338CA)
                                          : const Color(0xFF1D4ED8),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3.5),
                              decoration: BoxDecoration(
                                color: const Color(0xFFDCFCE7),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                '${controller.durationInDays} Days Total',
                                style: AppTextStyles.labelSmall.copyWith(
                                  color: const Color(0xFF15803D),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'START DATE',
                                    style: AppTextStyles.labelSmall.copyWith(
                                      color: const Color(0xFF64748B),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    controller.formattedStartDate,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: AppColors.textDarkNavy,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              size: 16,
                              color: Color(0xFF94A3B8),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'END DATE',
                                    style: AppTextStyles.labelSmall.copyWith(
                                      color: const Color(0xFF64748B),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    controller.formattedEndDate,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: AppColors.textDarkNavy,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 2. Reason for Leave Review
                  _buildSectionHeader('Reason for Leave', Icons.article_outlined),
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Text(
                      reason.isNotEmpty ? reason : 'No reason provided',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: const Color(0xFF334155),
                        fontSize: 12.5,
                        height: 1.45,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 3. Destination & Student Contact Review
                  _buildSectionHeader(
                      'Destination & Contact', Icons.location_on_outlined),
                  const SizedBox(height: 6),
                  _buildReviewRow(
                    label: 'Destination Address',
                    value: destination.isNotEmpty
                        ? destination
                        : 'Registered Permanent Address',
                  ),
                  const SizedBox(height: 8),
                  _buildReviewRow(
                    label: 'Student Phone Number',
                    value: studentPhone.isNotEmpty
                        ? studentPhone
                        : 'Not specified',
                  ),

                  const SizedBox(height: 16),

                  // 4. Parent / Guardian Review
                  _buildSectionHeader(
                      'Parent / Guardian Verification', Icons.people_outline_rounded),
                  const SizedBox(height: 6),
                  _buildReviewRow(
                    label: 'Guardian Name & Relation',
                    value: '$parentName ($parentRel)',
                  ),
                  const SizedBox(height: 8),
                  _buildReviewRow(
                    label: 'Guardian Contact Number',
                    value: guardianPhone.isNotEmpty
                        ? guardianPhone
                        : 'Not specified',
                  ),

                  // 5. Supporting Document (if Medical Leave)
                  if (isMedical) ...[
                    const SizedBox(height: 16),
                    _buildSectionHeader(
                        'Supporting Medical Document', Icons.attach_file_rounded),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.picture_as_pdf_rounded,
                            size: 20,
                            color: Color(0xFFDC2626),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.uploadedFileName.value,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.textDarkNavy,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  controller.uploadedFileSize.value,
                                  style: AppTextStyles.labelSmall.copyWith(
                                    color: const Color(0xFF64748B),
                                    fontSize: 10.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.check_circle_rounded,
                            size: 16,
                            color: Color(0xFF16A34A),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 16),

                  // 6. Declaration Alert Box
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFBFDBFE)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.verified_user_outlined,
                          size: 16,
                          color: Color(0xFF1D4ED8),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            AppStrings.reviewDeclaration,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: const Color(0xFF1E3A8A),
                              fontSize: 11.5,
                              fontWeight: FontWeight.w500,
                              height: 1.35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Divider(height: 1, color: Color(0xFFE2E8F0)),

          // ── Bottom Action Buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            child: Column(
              children: [
                // Right / Correct -> Final Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back(); // close confirmation sheet
                      controller.confirmAndFinalSubmit(); // perform actual submission
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E40AF),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check_circle_rounded,
                            size: 18, color: Colors.white),
                        const SizedBox(width: 8),
                        Text(
                          AppStrings.confirmAndSubmit,
                          style: AppTextStyles.labelLarge.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 13.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Not Right / Edit -> Cancel and Continue Filling
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: OutlinedButton(
                    onPressed: () => Get.back(), // closes sheet and returns to form
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF475569),
                      side: const BorderSide(color: Color(0xFFCBD5E1)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.edit_note_rounded,
                            size: 18, color: Color(0xFF475569)),
                        const SizedBox(width: 6),
                        Text(
                          AppStrings.editAndContinue,
                          style: AppTextStyles.labelMedium.copyWith(
                            color: const Color(0xFF475569),
                            fontWeight: FontWeight.w700,
                            fontSize: 12.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 14, color: const Color(0xFF64748B)),
        const SizedBox(width: 6),
        Text(
          title,
          style: AppTextStyles.labelSmall.copyWith(
            color: const Color(0xFF64748B),
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }

  Widget _buildReviewRow({required String label, required String value}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.labelSmall.copyWith(
              color: const Color(0xFF64748B),
              fontSize: 10.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textDarkNavy,
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
