import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../services/rules_pdf_service.dart';
import '../models/guideline_rule_item.dart';

class CommunityGuidelinesController extends GetxController {
  // Selected category filter
  final RxString selectedCategory = 'all'.obs;

  // Filter chips
  final List<Map<String, String>> filterCategories = [
    {'id': 'all', 'label': 'All Rules (10)'},
    {'id': 'curfew', 'label': 'Curfew & Gate'},
    {'id': 'room', 'label': 'Room & Noise'},
    {'id': 'visitor', 'label': 'Visitor & Guest'},
    {'id': 'mess', 'label': 'Mess & Dining'},
  ];

  // Full guidelines dataset matching exact user screenshot
  final List<GuidelineRuleItem> curfewRules = const [
    GuidelineRuleItem(
      id: 'c1',
      categoryId: 'curfew',
      title: 'Mandatory Roll-Call',
      description:
          'Physical biometric roll-call between 10:00 PM and 10:30 PM daily at designated floor terminals. Absence without prior approved leave triggers automatic parent notification.',
      tagType: GuidelineTagType.strict,
      tagLabel: 'Strict',
      icon: Icons.fingerprint_rounded,
      footerText: '10:00 PM - 10:30 PM • Floor Commons',
      footerIcon: Icons.access_time_rounded,
    ),
    GuidelineRuleItem(
      id: 'c2',
      categoryId: 'curfew',
      title: 'Campus Gate Closure',
      description:
          'Main security turnstiles lock at 11:00 PM. Late arrival requires emergency warden authorization and will be registered as a compliance incident in the student portal.',
      tagType: GuidelineTagType.strict,
      tagLabel: 'Strict',
      icon: Icons.meeting_room_rounded,
      footerText: 'Turnstile auto-lock 11:00 PM Sharp',
      footerIcon: Icons.lock_clock_rounded,
    ),
    GuidelineRuleItem(
      id: 'c3',
      categoryId: 'curfew',
      title: 'Night Outpass Requirement',
      description:
          'Minimum 6-hour advance submission required for off-campus overnight stay via the HostelFlow requests tab. Requires guardian counter-approval for 1st-year students.',
      tagType: GuidelineTagType.standard,
      tagLabel: 'Standard',
      icon: Icons.edit_calendar_rounded,
    ),
  ];

  final List<GuidelineRuleItem> roomRules = const [
    GuidelineRuleItem(
      id: 'r1',
      categoryId: 'room',
      title: 'Quiet Study Hours',
      description:
          '11:00 PM to 07:00 AM strictly observed in corridors, study halls, and dorm units. Use headphones for audio-visual media. Amplified speaker systems are confiscated upon first breach.',
      tagType: GuidelineTagType.strict,
      tagLabel: 'Strict',
      icon: Icons.volume_off_rounded,
    ),
    GuidelineRuleItem(
      id: 'r2',
      categoryId: 'room',
      title: 'Electrical Appliances',
      description:
          'Heavy heaters, immersion rods, and electric hotplates strictly prohibited. Only personal laptops, certified phone chargers, and low-wattage desk lamps permitted.',
      tagType: GuidelineTagType.strict,
      tagLabel: 'Strict',
      icon: Icons.power_rounded,
    ),
    GuidelineRuleItem(
      id: 'r3',
      categoryId: 'room',
      title: 'Cleanliness & Inspections',
      description:
          'Bi-weekly room inspection on Saturday mornings between 10:00 AM and 12:00 PM. Residents are expected to keep trash bins emptied and emergency exit paths unobstructed.',
      tagType: GuidelineTagType.notice,
      tagLabel: 'Notice',
      icon: Icons.cleaning_services_rounded,
    ),
  ];

  final List<GuidelineRuleItem> visitorRules = const [
    GuidelineRuleItem(
      id: 'v1',
      categoryId: 'visitor',
      title: 'Registered Visitors',
      description:
          'Permitted in Central Reception & Common Lounge only, between 09:00 AM and 07:00 PM. Visitors must exchange a government photo ID at the front security counter.',
      tagType: GuidelineTagType.standard,
      tagLabel: 'Standard',
      icon: Icons.badge_outlined,
    ),
    GuidelineRuleItem(
      id: 'v2',
      categoryId: 'visitor',
      title: 'Overnight Guests',
      description:
          'Strictly disallowed in student suites without prior Associate Dean approval. Unauthorized overnight guests result in immediate suspension of residential privileges.',
      tagType: GuidelineTagType.strict,
      tagLabel: 'Strict',
      icon: Icons.night_shelter_rounded,
    ),
  ];

  final List<GuidelineRuleItem> messRules = const [
    GuidelineRuleItem(
      id: 'm1',
      categoryId: 'mess',
      title: 'Waste-Free Dining & Schedule',
      description:
          'Self-service trays must be returned to clearing conveyors. Dining hall utensils and glassware cannot be removed under any circumstance.',
      tagType: GuidelineTagType.standard,
      tagLabel: 'Standard',
      icon: Icons.restaurant_rounded,
    ),
  ];

  // Meal schedule slots
  final List<Map<String, String>> mealSlots = const [
    {'title': 'Breakfast', 'time': '07:30 AM - 09:30 AM'},
    {'title': 'Lunch', 'time': '12:15 PM - 02:30 PM'},
    {'title': 'Evening Tea', 'time': '05:00 PM - 06:15 PM'},
    {'title': 'Dinner', 'time': '07:45 PM - 09:45 PM'},
  ];

  void selectCategory(String catId) {
    selectedCategory.value = catId;
  }

  bool isCategoryVisible(String catId) {
    if (selectedCategory.value == 'all') return true;
    return selectedCategory.value == catId;
  }

  // ── PDF Download Implementation ──
  final RxBool isDownloadingPdf = false.obs;
  final RxDouble downloadProgress = 0.0.obs;
  final RxString savedPdfFilePath = ''.obs;

  Future<void> downloadGuidelinesPdf() async {
    isDownloadingPdf.value = true;
    downloadProgress.value = 0.0;
    savedPdfFilePath.value = '';

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
                      ? 'Downloading Community Guidelines'
                      : 'Download Completed!',
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDarkNavy,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Community_Guidelines_2024-25.pdf • Official Handbook',
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
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
                              await RulesPdfService.openPdf(
                                  savedPdfFilePath.value);
                            } else {
                              final file =
                                  await RulesPdfService.savePdfToStorage();
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

    // Realistic progress animation & authentic PDF save to disk
    for (int i = 1; i <= 6; i++) {
      await Future.delayed(const Duration(milliseconds: 90));
      downloadProgress.value = i / 10.0;
    }

    try {
      final file = await RulesPdfService.savePdfToStorage();
      savedPdfFilePath.value = file.path;
    } catch (e) {
      debugPrint('Error saving PDF: $e');
    }

    for (int i = 7; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 80));
      downloadProgress.value = i / 10.0;
    }

    isDownloadingPdf.value = false;
  }

  void contactWardenOffice() => onContactWardenOffice();

  void onContactWardenOffice() {
    Get.snackbar(
      'Residential Warden Office',
      'Connecting to chief warden dispatch desk (Ext: 4022).',
      backgroundColor: AppColors.softBlue,
      colorText: AppColors.portalNavy,
      icon: const Icon(Icons.contact_phone_rounded,
          color: AppColors.portalNavy),
      snackPosition: SnackPosition.TOP,
    );
  }
}
