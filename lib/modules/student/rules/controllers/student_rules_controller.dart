import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../services/rules_pdf_service.dart';

class StudentRulesController extends GetxController {
  // Hall Info
  final RxString hallName = AppStrings.rulesDefaultHallName.obs;
  final RxString hallLocation = AppStrings.rulesDefaultHallLocation.obs;
  final RxString campusZone = AppStrings.rulesDefaultCampusZone.obs;

  // Occupancy metrics
  final RxInt totalBeds = 450.obs;
  final RxInt bookedBeds = 432.obs;
  final RxInt vacancies = 18.obs;
  final RxDouble occupancyPercent = 0.96.obs;

  // Actions
  void onCallWarden() {
    Get.snackbar(
      'Warden Office Desk',
      'Connecting to +1 (555) 019-4820 (Office 102)...',
      backgroundColor: const Color(0xFFEFF6FF),
      colorText: AppColors.portalNavy,
      icon: const Icon(Icons.phone, color: AppColors.portalNavy),
      snackPosition: SnackPosition.TOP,
    );
  }

  void onCallSecurity() {
    Get.snackbar(
      'Campus Security Dispatch',
      'Immediate residential assistance alerted.',
      backgroundColor: const Color(0xFFFFEEEE),
      colorText: const Color(0xFFEF4444),
      icon: const Icon(Icons.security, color: Color(0xFFEF4444)),
      snackPosition: SnackPosition.TOP,
    );
  }

  void onEmailAdmin() {
    Get.snackbar(
      'Administrative Desk',
      'Opening draft to helpdesk@campus.hostelflow.edu',
      backgroundColor: const Color(0xFFEFF6FF),
      colorText: AppColors.portalNavy,
      icon: const Icon(Icons.email_outlined, color: AppColors.portalNavy),
      snackPosition: SnackPosition.TOP,
    );
  }

  void showDetailedRulesSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.menu_book_rounded,
                          color: AppColors.portalNavy,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Hostel Rules & Regulations',
                        style: AppTextStyles.titleMedium
                            .copyWith(color: AppColors.textDarkNavy),
                      ),
                    ],
                  ),
                  IconButton(
                    icon:
                        const Icon(Icons.close, color: AppColors.textSecondary),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _ruleItem(Icons.access_time_rounded, 'Curfew Timing',
                  'All residents must return by 10:00 PM on weekdays and 11:00 PM on weekends. Late entry requires warden pre-approval.'),
              _ruleItem(Icons.volume_off_rounded, 'Quiet Hours Policy',
                  'Mandatory silence in corridors and rooms between 10:30 PM - 6:00 AM. Study pod acoustics respected at all times.'),
              _ruleItem(Icons.no_drinks_rounded, 'Substance & Alcohol Ban',
                  'Strict zero-tolerance policy against alcohol, smoking, vaping and illicit substances across entire campus premises.'),
              _ruleItem(Icons.people_outline_rounded, 'Visitor Registration',
                  'Outside guests permitted only in ground floor common lounges until 8:00 PM with security desk registration.'),
              _ruleItem(Icons.cleaning_services_rounded, 'Sanitation & Hygiene',
                  'Daily room tidiness expected. Routine sanitary inspections scheduled every Saturday at 11:00 AM.'),
              _ruleItem(Icons.bolt_rounded, 'High-Wattage Appliances',
                  'Electric heaters, induction plates, and heavy kitchen appliances are strictly prohibited inside resident rooms.'),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  void showFacilitiesTimingsSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.schedule_rounded,
                          color: AppColors.portalNavy,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Facilities & Timings',
                        style: AppTextStyles.titleMedium
                            .copyWith(color: AppColors.textDarkNavy),
                      ),
                    ],
                  ),
                  IconButton(
                    icon:
                        const Icon(Icons.close, color: AppColors.textSecondary),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _ruleItem(Icons.restaurant_outlined, 'Central Mess Dining',
                  'Breakfast: 7:30 AM - 9:30 AM\nLunch: 12:30 PM - 2:30 PM\nSnacks: 5:00 PM - 6:00 PM\nDinner: 7:30 PM - 10:00 PM'),
              _ruleItem(
                  Icons.local_laundry_service_outlined,
                  'Laundry Hub (B1)',
                  'Open 24/7. App token system. Heavy cycle dryers reserved 8:00 AM - 8:00 PM.'),
              _ruleItem(Icons.fitness_center_rounded, 'Gym & Fitness Center',
                  'Morning: 6:00 AM - 10:00 AM\nEvening: 4:30 PM - 9:30 PM\nTrainer present daily.'),
              _ruleItem(Icons.menu_book_rounded, 'Study Library Pods',
                  'Open 24/7 with high-speed campus Wi-Fi mesh and silent acoustic zoning.'),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  void showStaffContactSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0FDF4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.assignment_ind_rounded,
                        color: Color(0xFF059669),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Warden & Hall Staff',
                      style: AppTextStyles.titleMedium
                          .copyWith(color: AppColors.textDarkNavy),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.textSecondary),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _ruleItem(Icons.person, 'Chief Warden: Dr. Vikram Sharma',
                'Office 102, Ground Floor • Mon-Fri 10:00 AM - 4:00 PM\nPhone: +1 (555) 019-4820'),
            _ruleItem(Icons.security, 'Head Proctor: Capt. Arvind Rao',
                'Security Booth, Main Gate • Available 24/7 on call\nPhone: +1 (555) 019-9110'),
            _ruleItem(Icons.build_rounded, 'Facility Manager: Ramesh Kumar',
                'Maintenance Desk, B1 Level • 8:00 AM - 6:00 PM'),
            const SizedBox(height: 12),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void showReassignmentDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Room Reassignment',
                    style: AppTextStyles.titleMedium
                        .copyWith(color: AppColors.textDarkNavy),
                  ),
                  IconButton(
                    icon:
                        const Icon(Icons.close, color: AppColors.textSecondary),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Submit an inquiry or room swap request to the Residence Office.',
                style: AppTextStyles.bodySmall
                    .copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Current Room / Bed',
                  hintText: 'e.g. Room 204, Bed B2',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Reason for Reassignment',
                  hintText: 'e.g. Mutual room exchange / medical',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    Get.snackbar(
                      'Request Submitted',
                      'Your inquiry #REQ-882 has been recorded by Residence Office.',
                      backgroundColor: const Color(0xFFEFF6FF),
                      colorText: AppColors.portalNavy,
                      icon: const Icon(Icons.check_circle,
                          color: AppColors.portalNavy),
                      snackPosition: SnackPosition.TOP,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.portalNavy,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Submit Request',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ruleItem(IconData icon, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 16, color: AppColors.portalNavy),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.labelMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDarkNavy,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  desc,
                  style: AppTextStyles.bodySmall
                      .copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── PDF Download & Preview ──────────────────────────────────────────
  final RxBool isDownloadingPdf = false.obs;
  final RxDouble downloadProgress = 0.0.obs;
  final RxString savedPdfFilePath = ''.obs;

  Future<void> downloadRulesPdf() async {
    isDownloadingPdf.value = true;
    downloadProgress.value = 0.0;
    savedPdfFilePath.value = '';

    // Show download progress dialog
    Get.dialog(
      Obx(
        () => Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: downloadProgress.value < 1.0
                        ? AppColors.softBlue
                        : AppColors.badgeMintBg,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    downloadProgress.value < 1.0
                        ? Icons.picture_as_pdf_rounded
                        : Icons.check_circle_rounded,
                    color: downloadProgress.value < 1.0
                        ? AppColors.primaryBlue
                        : AppColors.emeraldIcon,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  downloadProgress.value < 1.0
                      ? AppStrings.rulesPdfDownloading
                      : AppStrings.rulesPdfCompleted,
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDarkNavy,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${AppStrings.rulesPdfFileName} • Official Handbook',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                if (downloadProgress.value < 1.0) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: downloadProgress.value,
                      minHeight: 8,
                      backgroundColor: AppColors.borderLight,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.primaryBlue),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${(downloadProgress.value * 100).toInt()}% completed',
                    style: AppTextStyles.labelMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ] else ...[
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.softGreen,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.softGreenBorder),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.check_circle,
                                size: 16, color: AppColors.emeraldIcon),
                            const SizedBox(width: 6),
                            Text(
                              AppStrings.rulesPdfSavedToStorage,
                              style: AppTextStyles.labelMedium.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.textGreenDark,
                              ),
                            ),
                          ],
                        ),
                        if (savedPdfFilePath.value.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          SelectableText(
                            savedPdfFilePath.value,
                            style: AppTextStyles.bodySmall.copyWith(
                              fontSize: 11,
                              color: AppColors.textGreenDark,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Get.back(),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text(
                            AppStrings.commonClose,
                            style: AppTextStyles.labelMedium,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            Get.back();
                            if (savedPdfFilePath.value.isNotEmpty) {
                              await RulesPdfService.openPdf(savedPdfFilePath.value);
                            } else {
                              final file = await RulesPdfService.savePdfToStorage();
                              await RulesPdfService.openPdf(file.path);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.open_in_new_rounded,
                                  size: 16, color: AppColors.textWhite),
                              const SizedBox(width: 6),
                              Text(
                                AppStrings.rulesOpenPdf,
                                style: AppTextStyles.labelMedium.copyWith(
                                  color: AppColors.textWhite,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );

    // Realistic progress animation while writing real file to storage
    for (int i = 1; i <= 6; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      downloadProgress.value = i / 10.0;
    }

    try {
      final file = await RulesPdfService.savePdfToStorage();
      savedPdfFilePath.value = file.path;
    } catch (e) {
      debugPrint('Error generating and saving PDF: $e');
    }

    for (int i = 7; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 90));
      downloadProgress.value = i / 10.0;
    }

    isDownloadingPdf.value = false;
  }

  void showPdfPreviewSheet() {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.88,
        decoration: const BoxDecoration(
          color: AppColors.pdfDarkNavy,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            // Top Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: const BoxDecoration(
                color: AppColors.pdfDarkBar,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.picture_as_pdf_rounded,
                      color: AppColors.error, size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.rulesPdfFileName,
                          style: AppTextStyles.labelLarge.copyWith(
                            color: AppColors.textWhite,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Official Resident Handbook • Tap download or share to save',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.white60,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    tooltip: 'Save PDF to Storage',
                    icon: const Icon(Icons.file_download_outlined,
                        color: AppColors.textWhite, size: 22),
                    onPressed: () async {
                      try {
                        final file = await RulesPdfService.savePdfToStorage();
                        savedPdfFilePath.value = file.path;
                        Get.snackbar(
                          'PDF Downloaded & Saved',
                          'Saved to system: ${file.path}',
                          backgroundColor: AppColors.backgroundWhite,
                          colorText: AppColors.textDarkNavy,
                          icon: const Icon(Icons.check_circle,
                              color: AppColors.emeraldIcon),
                          snackPosition: SnackPosition.TOP,
                          duration: const Duration(seconds: 4),
                        );
                      } catch (e) {
                        Get.snackbar('Error', 'Failed to save PDF: $e');
                      }
                    },
                  ),
                  IconButton(
                    tooltip: 'Share PDF Handbook',
                    icon: const Icon(Icons.share_outlined,
                        color: AppColors.textWhite, size: 20),
                    onPressed: () async {
                      try {
                        final file = await RulesPdfService.savePdfToStorage();
                        savedPdfFilePath.value = file.path;
                        await RulesPdfService.sharePdf(file.path);
                      } catch (e) {
                        try {
                          if (savedPdfFilePath.value.isNotEmpty) {
                            await RulesPdfService.openPdf(savedPdfFilePath.value);
                          } else {
                            final file = await RulesPdfService.savePdfToStorage();
                            await RulesPdfService.openPdf(file.path);
                          }
                        } catch (_) {
                          Get.snackbar(
                            'Error',
                            'Failed to share PDF: $e',
                            backgroundColor: AppColors.backgroundWhite,
                            colorText: AppColors.textDarkNavy,
                          );
                        }
                      }
                    },
                  ),
                  IconButton(
                    tooltip: AppStrings.commonClose,
                    icon: const Icon(Icons.close_rounded,
                        color: AppColors.textWhite, size: 22),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),

            // PDF Document Canvas Preview
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SUNRISE CAMPUS RESIDENCY',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.blue.shade900,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                'Westwood Hall & Oak Court',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF0F172A),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue.shade800),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'OFFICIAL DOC',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w800,
                                color: Colors.blue.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(thickness: 1.5, color: Color(0xFF0F172A)),
                      const SizedBox(height: 14),

                      // Document Title
                      const Center(
                        child: Text(
                          'HOSTEL RULES, CODE OF CONDUCT & SAFETY REGULATIONS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Academic Session: 2024 - 2025',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black54,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      _pdfClause('1. Curfew & Gate Pass Regulations',
                          '• Curfew on weekdays is strictly 10:00 PM; weekends 11:00 PM.\n• Digital Gate Pass QR required for entry after 8:00 PM.\n• Unapproved late check-ins will incur a disciplinary strike.'),
                      _pdfClause('2. Quiet Hours & Corridor Decorum',
                          '• Mandatory quiet hours observed from 10:30 PM to 6:00 AM daily.\n• Amplified music, noisy gatherings, or disturbance in wings strictly forbidden.'),
                      _pdfClause('3. Substance Prohibition Policy',
                          '• Zero tolerance for tobacco, alcohol, e-cigarettes, and illegal substances anywhere on premises.\n• Violators subject to immediate suspension and eviction.'),
                      _pdfClause('4. Visitor & Guest Policies',
                          '• External visitors restricted to Ground Floor Reception Lounge.\n• Visiting hours terminate at 8:00 PM prompt.'),
                      _pdfClause('5. Electrical & Appliance Safety',
                          '• High wattage devices (induction stoves, immersion rods, room heaters) prohibited.\n• Only laptops, phone chargers, and desk lamps permitted.'),

                      const SizedBox(height: 18),
                      const Divider(color: Colors.black26),
                      const SizedBox(height: 10),

                      // Signatures & Stamp
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dr. Vikram Sharma',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                  color: Colors.blue.shade900,
                                ),
                              ),
                              const Text(
                                'Chief Hostel Warden',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black54),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              border: Border.all(color: Colors.green.shade600),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.verified,
                                    size: 16, color: Colors.green.shade700),
                                Text(
                                  'DIGITALLY VERIFIED',
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.green.shade800,
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
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _pdfClause(String heading, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            body,
            style: const TextStyle(
              fontSize: 10.5,
              color: Color(0xFF334155),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
