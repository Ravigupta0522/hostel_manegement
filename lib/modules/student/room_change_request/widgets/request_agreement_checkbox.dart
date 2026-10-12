import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/room_change_request_controller.dart';

class RequestAgreementCheckbox extends GetView<RoomChangeRequestController> {
  const RequestAgreementCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Obx(
        () => InkWell(
          onTap: () => controller.isAgreementAccepted.toggle(),
          borderRadius: BorderRadius.circular(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: controller.isAgreementAccepted.value,
                  onChanged: (val) =>
                      controller.isAgreementAccepted.value = val ?? false,
                  activeColor: const Color(0xFF1D4ED8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Room Inspection & Handover Agreement',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDarkNavy,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Obx(
                      () => Text(
                        'I confirm that I have inspected ${controller.targetRoom.value.split(',').first} and agree to the room handover inspection protocol upon warden clearance.',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF64748B),
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
    );
  }
}
