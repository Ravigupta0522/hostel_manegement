import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_register_controller.dart';

class PhoneNumberField extends GetView<StudentRegisterController> {
  const PhoneNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Country Code Dropdown Box
        Obx(
          () => Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.fieldBgLight,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.borderLight),
            ),
            alignment: Alignment.center,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: controller.selectedCountryCode.value,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.textSlate,
                  size: 18,
                ),
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textDarkNavy,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
                onChanged: (val) {
                  if (val != null) controller.selectedCountryCode.value = val;
                },
                items: controller.countryCodes
                    .map((code) => DropdownMenuItem(
                          value: code,
                          child: Text(code),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Phone number input
        Expanded(
          child: TextFormField(
            controller: controller.phoneController,
            keyboardType: TextInputType.phone,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textDarkNavy,
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: AppStrings.phoneHint,
              hintStyle: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textMuted,
                fontSize: 14,
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(
                Icons.phone_outlined,
                color: AppColors.textSlate,
                size: 20,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
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
                borderSide:
                    const BorderSide(color: AppColors.portalNavy, width: 1.5),
              ),
            ),
            validator: (val) {
              if (val == null || val.trim().isEmpty) {
                return AppStrings.validationRequired;
              }
              if (val.trim().length < 10) {
                return AppStrings.validationPhoneInvalid;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
