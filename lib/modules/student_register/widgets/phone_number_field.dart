import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            alignment: Alignment.center,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: controller.selectedCountryCode.value,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF64748B),
                  size: 18,
                ),
                style: AppTextStyles.bodyMedium.copyWith(
                  color: const Color(0xFF0F172A),
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
              color: const Color(0xFF0F172A),
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: '98765 43210',
              hintStyle: AppTextStyles.bodySmall.copyWith(
                color: const Color(0xFF94A3B8),
                fontSize: 14,
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(
                Icons.phone_outlined,
                color: Color(0xFF64748B),
                size: 20,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color(0xFF00288E), width: 1.5),
              ),
            ),
            validator: (val) {
              if (val == null || val.trim().isEmpty) {
                return 'Phone number is required';
              }
              if (val.trim().length < 10) {
                return 'Enter a valid 10-digit phone number';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
