import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/student_settings_controller.dart';
import '../widgets/settings_profile_card.dart';
import '../widgets/settings_verified_strip.dart';
import '../widgets/settings_emergency_section.dart';
import '../widgets/settings_documents_section.dart';
import '../widgets/settings_notifications_section.dart';
import '../widgets/settings_preferences_section.dart';
import '../widgets/settings_security_section.dart';
import '../widgets/settings_hostel_info_section.dart';
import '../widgets/settings_support_section.dart';
import '../widgets/settings_legal_section.dart';
import '../widgets/settings_account_actions_section.dart';
import '../widgets/settings_footer.dart';

class MobileStudentSettingsView extends GetView<StudentSettingsController> {
  const MobileStudentSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<StudentSettingsController>()) {
      Get.put(StudentSettingsController());
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 18,
            color: AppColors.textDarkNavy,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Settings',
          style: AppTextStyles.titleMedium.copyWith(
            color: AppColors.textDarkNavy,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.borderLight),
        ),
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16, 16, 16, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Profile Card
            StudentSettingsProfileCard(),
            SizedBox(height: 10),

            // 2. Verified Strip
            StudentSettingsVerifiedStrip(),
            SizedBox(height: 20),

            // 3. SOS & Emergency
            SettingsEmergencySection(),
            SizedBox(height: 16),

            // 4. My Documents
            SettingsDocumentsSection(),
            SizedBox(height: 16),

            // 5. Notifications & Alerts
            SettingsNotificationsSection(),
            SizedBox(height: 16),

            // 6. App Preferences
            SettingsPreferencesSection(),
            SizedBox(height: 16),

            // 7. Security & Privacy
            SettingsSecuritySection(),
            SizedBox(height: 16),

            // 8. Hostel Information
            SettingsHostelInfoSection(),
            SizedBox(height: 16),

            // 9. Help & Support
            SettingsSupportSection(),
            SizedBox(height: 16),

            // 10. About & Legal
            SettingsLegalSection(),
            SizedBox(height: 16),

            // 11. Account Actions
            SettingsAccountActionsSection(),
            SizedBox(height: 20),

            // 12. Footer
            StudentSettingsFooter(),
          ],
        ),
      ),
    );
  }
}
