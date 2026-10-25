import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../leave/controllers/student_leave_controller.dart';

class ApplyLeaveController extends GetxController {
  // Step 1: Leave Information
  final RxString selectedLeaveType = 'Medical Leave'.obs;
  final List<String> leaveTypes = [
    'Medical Leave',
    'Home Visit',
    'Personal Leave',
    'Academic Trip',
    'Weekend Outing',
  ];

  final Rx<DateTime> startDate = DateTime(2026, 10, 24).obs;
  final Rx<DateTime> endDate = DateTime(2026, 10, 26).obs;

  bool get isMedicalLeave => selectedLeaveType.value == 'Medical Leave';
  bool get isDocsMandatory => isMedicalLeave;
  int get totalSteps => isMedicalLeave ? 4 : 3;

  int get durationInDays {
    final diff = endDate.value.difference(startDate.value).inDays;
    return diff >= 0 ? diff + 1 : 1;
  }

  static String _formatDate(DateTime dt) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    final day = dt.day.toString().padLeft(2, '0');
    final month = months[dt.month - 1];
    return '$day $month ${dt.year}';
  }

  String get formattedStartDate => _formatDate(startDate.value);
  String get formattedEndDate => _formatDate(endDate.value);

  // Step 2: Leave Details
  final TextEditingController reasonController = TextEditingController(
    text:
        'Scheduled wisdom tooth extraction and postoperative recovery under specialist care in hometown hospital.',
  );
  final RxInt charCount = 108.obs;

  final TextEditingController destinationController = TextEditingController(
    text: 'Flat 402, Greenfield Heights, Park Street, New Delhi - 110001',
  );
  final RxBool usePermanentAddress = true.obs;

  final TextEditingController contactNumberController =
      TextEditingController(text: '9876543210');

  // Step 3: Parent / Guardian Verification
  final TextEditingController parentNameController =
      TextEditingController(text: 'Rajesh Sharma');
  final RxString parentRelation = 'Father'.obs;
  final TextEditingController guardianContactController =
      TextEditingController(text: '9811223344');
  final RxBool smsTokenAgreement = true.obs;

  // Step 4: Supporting Document
  final RxBool isDocUploaded = true.obs;
  final RxString uploadedFileName = 'medical_prescription_max_clinic.pdf'.obs;
  final RxString uploadedFileSize = '1.4 MB'.obs;

  @override
  void onInit() {
    super.onInit();
    charCount.value = reasonController.text.length;
    reasonController.addListener(() {
      charCount.value = reasonController.text.length;
    });
  }

  @override
  void onClose() {
    reasonController.dispose();
    destinationController.dispose();
    contactNumberController.dispose();
    parentNameController.dispose();
    guardianContactController.dispose();
    super.onClose();
  }

  Future<void> pickStartDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: startDate.value,
      firstDate: DateTime(2026, 1, 1),
      lastDate: DateTime(2027, 12, 31),
    );
    if (picked != null) {
      startDate.value = picked;
      if (endDate.value.isBefore(picked)) {
        endDate.value = picked.add(const Duration(days: 2));
      }
    }
  }

  Future<void> pickEndDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: endDate.value.isAfter(startDate.value)
          ? endDate.value
          : startDate.value,
      firstDate: startDate.value,
      lastDate: DateTime(2027, 12, 31),
    );
    if (picked != null) {
      endDate.value = picked;
    }
  }

  void removeUploadedDoc() {
    isDocUploaded.value = false;
    uploadedFileName.value = '';
    uploadedFileSize.value = '';
    Get.snackbar(
      'Document Removed',
      'Please attach supporting document for medical leave approval.',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.softAmber,
      colorText: AppColors.amberText,
    );
  }

  void uploadDummyDoc() {
    isDocUploaded.value = true;
    uploadedFileName.value = 'medical_prescription_max_clinic.pdf';
    uploadedFileSize.value = '5 MB';
    Get.snackbar(
      'File Uploaded',
      'medical_prescription_max_clinic.pdf (Verified PDF)',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.leavePassBg,
      colorText: AppColors.leavePassText,
    );
  }

  void submitLeaveRequest() {
    if (reasonController.text.trim().isEmpty) {
      Get.snackbar(
        'Reason Required',
        'Please enter a detailed reason for your leave.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.softAmber,
        colorText: AppColors.amberText,
      );
      return;
    }

    if (isDocsMandatory && !isDocUploaded.value) {
      Get.snackbar(
        'Document Required',
        'Supporting doctor prescription is mandatory for Medical Leave.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.leaveClosedBg,
        colorText: AppColors.leaveClosedText,
      );
      return;
    }

    // Add new petition to StudentLeaveController if registered
    if (Get.isRegistered<StudentLeaveController>()) {
      final leaveCtrl = Get.find<StudentLeaveController>();
      final newRef =
          'Ref: #REQ-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}';
      final newReq = {
        'type': selectedLeaveType.value,
        'ref': newRef,
        'status': 'Pending Review',
        'dates':
            '$formattedStartDate - $formattedEndDate ($durationInDays Days)',
        'submittedDate': 'Submitted Today',
        'reason': reasonController.text.trim(),
        'hasDocument': isDocUploaded.value,
        'documentText': isDocUploaded.value ? '1 Document Attached' : null,
        'icon': selectedLeaveType.value == 'Medical Leave'
            ? Icons.medical_services_outlined
            : selectedLeaveType.value == 'Home Visit'
                ? Icons.home_outlined
                : Icons.flight_takeoff_rounded,
        'iconColor': AppColors.amberIcon,
        'iconBg': AppColors.softAmber,
        'statusColor': AppColors.leaveReviewText,
        'statusBg': AppColors.leaveReviewBg,
        'wardenRemark': null,
      };

      leaveCtrl.recentRequests.insert(0, newReq);
      leaveCtrl.totalPetitions.value++;
      leaveCtrl.pendingPetitions.value++;
    }

    Get.back(); // Return to Leave Management screen

    Get.snackbar(
      'Leave Petition Submitted',
      'Your request for $formattedStartDate – $formattedEndDate has been sent to Warden Office.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.textGreenDark,
      colorText: AppColors.textWhite,
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: const Icon(Icons.check_circle_rounded, color: AppColors.textWhite),
    );
  }

  void discardDraft() {
    Get.back();
  }
}
