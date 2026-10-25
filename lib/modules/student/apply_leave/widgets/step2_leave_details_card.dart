import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/apply_leave_controller.dart';

class Step2LeaveDetailsCard extends GetView<ApplyLeaveController> {
  const Step2LeaveDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Section Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.cardLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.description_outlined,
                      size: 18,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    AppStrings.step2LeaveDetails,
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.textDarkNavy,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Obx(
                () {
                  final total = controller.selectedLeaveType.value == 'Medical Leave' ? 4 : 3;
                  return Text(
                    'STEP 2 OF $total',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.textSlate,
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 14),

          // ── Reason for Leave
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.reasonForLeave,
                style: AppTextStyles.labelSmall.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDarkNavy,
                ),
              ),
              Obx(
                () => Text(
                  '${controller.charCount.value} / 500 chars',
                  style: AppTextStyles.labelSmall.copyWith(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSlate,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          TextField(
            controller: controller.reasonController,
            maxLines: 3,
            maxLength: 500,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 12.5,
              color: AppColors.textDarkNavy,
              height: 1.4,
            ),
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: AppColors.fieldBgLight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.borderLight),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.borderLight),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.primaryBlue),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
          ),

          const SizedBox(height: 12),

          // ── Destination Address
          Text(
            AppStrings.destinationAddress,
            style: AppTextStyles.labelSmall.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.textDarkNavy,
            ),
          ),

          const SizedBox(height: 6),

          TextField(
            controller: controller.destinationController,
            maxLines: 2,
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: 12.5,
              color: AppColors.textDarkNavy,
              height: 1.35,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.fieldBgLight,
              prefixIcon: const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Icon(Icons.location_on_outlined,
                    color: AppColors.linkBlue, size: 18),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.borderLight),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.borderLight),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.primaryBlue),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
          ),

          const SizedBox(height: 8),

          // ── Checkbox: Use registered permanent address
          Obx(
            () => InkWell(
              onTap: () => controller.usePermanentAddress.toggle(),
              borderRadius: BorderRadius.circular(6),
              child: Row(
                children: [
                  SizedBox(
                    width: 22,
                    height: 22,
                    child: Checkbox(
                      value: controller.usePermanentAddress.value,
                      onChanged: (v) {
                        if (v != null) controller.usePermanentAddress.value = v;
                      },
                      activeColor: AppColors.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppStrings.usePermanentHomeAddress,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDarkNavy,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ── Contact Number During Leave
          Text(
            AppStrings.contactNumberDuringLeave,
            style: AppTextStyles.labelSmall.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.textDarkNavy,
            ),
          ),

          const SizedBox(height: 6),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.fieldBgLight,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.cardLight,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      const Text('🇮🇳', style: TextStyle(fontSize: 12)),
                      const SizedBox(width: 4),
                      Text(
                        '+91',
                        style: AppTextStyles.labelSmall.copyWith(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDarkNavy,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: controller.contactNumberController,
                    keyboardType: TextInputType.phone,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDarkNavy,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                const Icon(
                  Icons.check_circle_outline_rounded,
                  size: 18,
                  color: AppColors.portalSky,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
