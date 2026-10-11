import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../controllers/community_guidelines_controller.dart';
import 'guidelines_mess_schedule_card.dart';
import 'guidelines_rule_card.dart';
import 'guidelines_warden_contact_card.dart';

class GuidelinesSectionsList extends GetView<CommunityGuidelinesController> {
  const GuidelinesSectionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final showCurfew = controller.isCategoryVisible('curfew');
      final showRoom = controller.isCategoryVisible('room');
      final showVisitor = controller.isCategoryVisible('visitor');
      final showMess = controller.isCategoryVisible('mess');

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 1. Curfew & Gate Timing ──
          if (showCurfew) ...[
            _buildSectionHeader(
              icon: Icons.access_time_rounded,
              title: 'Curfew & Gate Timing',
              countLabel: '${controller.curfewRules.length} Guidelines',
            ),
            const SizedBox(height: 12),
            ...controller.curfewRules.map(
              (rule) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GuidelinesRuleCard(rule: rule),
              ),
            ),
            const SizedBox(height: 12),
          ],

          // ── 2. Room Conduct & Quiet Hours ──
          if (showRoom) ...[
            _buildSectionHeader(
              icon: Icons.bed_rounded,
              title: 'Room Conduct & Quiet Hours',
              countLabel: '${controller.roomRules.length} Guidelines',
            ),
            const SizedBox(height: 12),
            ...controller.roomRules.map(
              (rule) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GuidelinesRuleCard(rule: rule),
              ),
            ),
            const SizedBox(height: 12),
          ],

          // ── 3. Visitor & Guest Policies ──
          if (showVisitor) ...[
            _buildSectionHeader(
              icon: Icons.group_outlined,
              title: 'Visitor & Guest Policies',
              countLabel: '${controller.visitorRules.length} Guidelines',
            ),
            const SizedBox(height: 12),
            ...controller.visitorRules.map(
              (rule) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GuidelinesRuleCard(rule: rule),
              ),
            ),
            const SizedBox(height: 12),
          ],

          // ── 4. Mess & Dining Etiquette ──
          if (showMess) ...[
            _buildSectionHeader(
              icon: Icons.restaurant_rounded,
              title: 'Mess & Dining Etiquette',
              countLabel: 'Meal Protocols',
            ),
            const SizedBox(height: 12),
            GuidelinesMessScheduleCard(
              rule: controller.messRules.first,
              mealSlots: controller.mealSlots,
            ),
            const SizedBox(height: 16),
          ],

          // ── 5. Warden Office Support Card ──
          const GuidelinesWardenContactCard(),
          const SizedBox(height: 24),
        ],
      );
    });
  }

  Widget _buildSectionHeader({
    required IconData icon,
    required String title,
    required String countLabel,
  }) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 16,
            color: AppColors.primaryBlue,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColors.textDarkNavy,
              letterSpacing: -0.2,
            ),
          ),
        ),
        Text(
          countLabel,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
