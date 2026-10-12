import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../routes/app_routes.dart';

class RoomChangeRequestController extends GetxController {
  // Current Allocation
  final RxString currentRoom = 'Room #204, Bed B2'.obs;
  final RxString currentDetails = 'Block A • Standard Triple'.obs;
  final RxString currentStatus = 'Occupied'.obs;

  // Target Relocation
  final RxString targetRoom = 'Room #305, Bed B'.obs;
  final RxString targetDetails = 'Block B • Double AC (Quiet ...)'.obs;
  final RxString targetStatus = 'Available'.obs;

  // Step information
  final RxInt currentStep = 1.obs;
  final RxInt totalSteps = 2.obs;

  // Primary Reason
  final List<Map<String, dynamic>> reasons = [
    {
      'title': 'Roommate-related issue',
      'icon': Icons.groups_outlined,
    },
    {
      'title': 'Room facilities issue',
      'icon': Icons.build_outlined,
    },
    {
      'title': 'Medical or personal reason',
      'icon': Icons.medical_services_outlined,
    },
    {
      'title': 'Room environment / study quietness',
      'icon': Icons.volume_off_outlined,
    },
    {
      'title': 'Other reason',
      'icon': Icons.more_horiz_rounded,
    },
  ];

  final RxString selectedReason = 'Medical or personal reason'.obs;

  // Explanation field
  late final TextEditingController explanationController;
  final RxInt charCount = 0.obs;
  final int maxChars = 300;

  // Attached files
  final RxList<Map<String, String>> uploadedFiles = <Map<String, String>>[
    {
      'name': 'medical_note_dr_patel.pdf',
      'size': '1.2 MB • Verified Scan',
    },
  ].obs;

  // Agreement checkbox
  final RxBool isAgreementAccepted = true.obs;
  final RxBool isSubmitting = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Pre-fill explanation as shown in the screenshot
    const initialText =
        'Preparing for competitive entrance exams and requiring a quiet study environment with early sleep schedule in Block B silent wing. Prescribed recovery schedule.';
    explanationController = TextEditingController(text: initialText);
    charCount.value = initialText.length;

    explanationController.addListener(() {
      charCount.value = explanationController.text.length;
    });

    // Check if arguments were passed from Available Rooms selection
    if (Get.arguments != null && Get.arguments is Map) {
      final args = Get.arguments as Map;
      if (args['number'] != null) {
        final bed = args['bedOpen'] != null
            ? (args['bedOpen'].toString().split(' ').take(2).join(' '))
            : 'Bed B';
        targetRoom.value = '${args['number']}, $bed';
      }
      if (args['location'] != null) {
        targetDetails.value = args['location'].toString();
      }
    }
  }

  @override
  void onClose() {
    explanationController.dispose();
    super.onClose();
  }

  void selectReason(String reason) {
    selectedReason.value = reason;
  }

  void addDocument() {
    uploadedFiles.add({
      'name': 'warden_recommendation_${uploadedFiles.length + 1}.pdf',
      'size': '850 KB • Verified Scan',
    });
    Get.snackbar(
      'Document Attached',
      'File uploaded and verified successfully.',
      backgroundColor: const Color(0xFFDCFCE7),
      colorText: const Color(0xFF166534),
      icon: const Icon(Icons.check_circle_rounded, color: Color(0xFF16A34A)),
      snackPosition: SnackPosition.TOP,
    );
  }

  void removeDocument(int index) {
    if (index >= 0 && index < uploadedFiles.length) {
      uploadedFiles.removeAt(index);
    }
  }

  void submitRequest() {
    if (!isAgreementAccepted.value) {
      Get.snackbar(
        'Agreement Required',
        'Please accept the room inspection & handover agreement before proceeding.',
        backgroundColor: const Color(0xFFFEF3C7),
        colorText: const Color(0xFFB45309),
        icon: const Icon(Icons.warning_amber_rounded, color: Color(0xFFD97706)),
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (explanationController.text.trim().isEmpty) {
      Get.snackbar(
        'Explanation Required',
        'Please provide detailed explanation for the room change.',
        backgroundColor: const Color(0xFFFEF3C7),
        colorText: const Color(0xFFB45309),
        icon: const Icon(Icons.warning_amber_rounded, color: Color(0xFFD97706)),
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    // Success dialog
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFFDCFCE7),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF16A34A),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Request Submitted',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDarkNavy,
                ),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your room change request for ${targetRoom.value} has been logged under Express Review (within 24 hrs).',
              style: const TextStyle(
                fontSize: 13.5,
                color: AppColors.textDarkNavy,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, size: 16, color: Color(0xFF1D4ED8)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Reserved Hold is active for 48 hours.',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1D4ED8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back(); // close dialog
              Get.offNamedUntil(
                AppRoutes.studentRoom,
                (route) => route.settings.name == AppRoutes.studentDashboard,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D4ED8),
              foregroundColor: Colors.white,
              minimumSize: const Size(100, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Back to Room'),
          ),
        ],
      ),
    );
  }
}
