import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_dashboard_controller.dart';

class StudentFeeSummaryCard extends GetView<StudentDashboardController> {
  const StudentFeeSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.receipt_long_outlined,
                      size: 18,
                      color: Color(0xFF2563EB),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Fee Summary',
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.textDarkNavy,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3C7),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text(
                  'Due Soon',
                  style: TextStyle(
                    color: Color(0xFFD97706),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 3 Stat Tiles
          Row(
            children: [
              // TOTAL FEE
              Expanded(
                child: _buildFeeTile(
                  label: 'TOTAL FEE',
                  amount: controller.totalFee.value,
                  bgColor: const Color(0xFFF8FAFC),
                  amountColor: AppColors.textDarkNavy,
                ),
              ),
              const SizedBox(width: 8),

              // PAID
              Expanded(
                child: _buildFeeTile(
                  label: 'PAID',
                  amount: controller.paidFee.value,
                  bgColor: const Color(0xFFF0FDF4),
                  amountColor: const Color(0xFF16A34A),
                ),
              ),
              const SizedBox(width: 8),

              // PENDING
              Expanded(
                child: _buildFeeTile(
                  label: 'PENDING',
                  amount: controller.feePendingAmount.value,
                  bgColor: const Color(0xFFFFFBEB),
                  amountColor: const Color(0xFFD97706),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Due date and term row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Due Date: ',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: controller.dueFeeDateFull.value,
                      style: const TextStyle(
                        color: AppColors.textDarkNavy,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                controller.feeSemesterTerm.value,
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Bottom Action Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.snackbar(
                    'Fee Details',
                    'Total: ₹25,000 | Paid: ₹20,500 | Pending: ₹4,500',
                    backgroundColor: const Color(0xFFEFF6FF),
                    colorText: AppColors.portalNavy,
                    snackPosition: SnackPosition.TOP,
                  );
                },
                child: const Row(
                  children: [
                    Text(
                      'View Fee Details',
                      style: TextStyle(
                        color: AppColors.portalNavy,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 11,
                      color: AppColors.portalNavy,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: controller.showPayNowDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.portalNavy,
                  elevation: 0,
                  minimumSize: const Size(0, 36),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Pay Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeeTile({
    required String label,
    required String amount,
    required Color bgColor,
    required Color amountColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 9.5,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            amount,
            style: TextStyle(
              color: amountColor,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
