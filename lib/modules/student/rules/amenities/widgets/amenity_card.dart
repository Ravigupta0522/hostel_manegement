import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../models/amenity_item.dart';

class AmenityCard extends StatelessWidget {
  final AmenityItem item;
  final bool isExpanded;
  final VoidCallback onToggleGuidelines;
  final VoidCallback onReportIssue;
  final VoidCallback onCallDutyDesk;

  const AmenityCard({
    super.key,
    required this.item,
    required this.isExpanded,
    required this.onToggleGuidelines,
    required this.onReportIssue,
    required this.onCallDutyDesk,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderLight, width: 1.1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 1. Top Header Row ──
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Container
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFDBEAFE)),
                ),
                child: Icon(
                  item.icon,
                  color: AppColors.portalNavy,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),

              // Title & Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDarkNavy,
                        fontSize: 15,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.locationOrSub,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 11.5,
                      ),
                    ),
                  ],
                ),
              ),

              // Status Badge
              _buildStatusBadge(item.statusBadge, item.statusType),
            ],
          ),
          const SizedBox(height: 14),

          // ── 2. Specialty Media / Telemetry Section ──
          if (item.id == 'wifi') _buildWifiBanner(),
          if (item.id == 'mess') _buildMessSchedule(),
          if (item.id == 'laundry' && item.laundrySlots != null)
            _buildLaundrySlots(item.laundrySlots!),
          if (item.id == 'security' && item.dutyContact != null)
            _buildSecurityDesk(item.dutyContact!),
          if (item.id == 'study') _buildStudyBanner(),
          if (item.id == 'recreation' && item.featureTags != null)
            _buildRecreationFeatures(item.featureTags!),

          // ── 3. Description ──
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 8),
            child: Text(
              item.description,
              style: AppTextStyles.bodySmall.copyWith(
                color: const Color(0xFF475569),
                fontSize: 12.5,
                height: 1.42,
              ),
            ),
          ),

          // ── 4. Expandable Guidelines ──
          if (isExpanded)
            Container(
              margin: const EdgeInsets.only(top: 6, bottom: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.info_outline_rounded,
                          size: 14, color: AppColors.primaryBlue),
                      const SizedBox(width: 6),
                      Text(
                        'Rules & Facility Etiquette',
                        style: AppTextStyles.labelSmall.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.portalNavy,
                          fontSize: 11.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ...item.guidelines.map(
                    (g) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ',
                              style: TextStyle(
                                  color: AppColors.primaryBlue,
                                  fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Text(
                              g,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                                fontSize: 11.5,
                                height: 1.35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          const Divider(height: 14, thickness: 0.8, color: AppColors.borderLight),

          // ── 5. Footer Actions ──
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Guidelines Toggle Button
              InkWell(
                onTap: onToggleGuidelines,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Row(
                    children: [
                      Text(
                        'Guidelines',
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.portalNavy,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        size: 18,
                        color: AppColors.portalNavy,
                      ),
                    ],
                  ),
                ),
              ),

              // Report Issue Button
              InkWell(
                onTap: onReportIssue,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.outlined_flag_rounded,
                        size: 14,
                        color: Color(0xFF64748B),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Report Issue',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: const Color(0xFF475569),
                          fontWeight: FontWeight.w600,
                          fontSize: 11.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Helper Badge Builder ──
  Widget _buildStatusBadge(String text, AmenityTagStatus type) {
    Color bg;
    Color textColor;
    Color border;

    switch (type) {
      case AmenityTagStatus.active:
      case AmenityTagStatus.openNow:
        bg = const Color(0xFFDCFCE7);
        textColor = const Color(0xFF15803D);
        border = const Color(0xFFBBF7D0);
        break;
      case AmenityTagStatus.info:
        bg = const Color(0xFFDBEAFE);
        textColor = const Color(0xFF1D4ED8);
        border = const Color(0xFFBFDBFE);
        break;
      case AmenityTagStatus.closingSoon:
        bg = const Color(0xFFEFF6FF);
        textColor = const Color(0xFF2563EB);
        border = const Color(0xFFDBEAFE);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border),
      ),
      child: Text(
        text,
        style: AppTextStyles.labelSmall.copyWith(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 11,
        ),
      ),
    );
  }

  // ── 1. Wi-Fi Banner ──
  Widget _buildWifiBanner() {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              item.bannerImageUrl ?? 'assets/images/wifi_amenity.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.wifi_rounded, size: 48, color: Colors.white24),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.15),
                    Colors.black.withValues(alpha: 0.65),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              left: 14,
              bottom: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.75),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.speed_rounded,
                        size: 14, color: Color(0xFF38BDF8)),
                    const SizedBox(width: 5),
                    Text(
                      item.bannerBadgeText ?? '150 Mbps / Room',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── 2. Dining Banner & Timings ──
  Widget _buildMessSchedule() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  item.bannerImageUrl ?? 'assets/images/mess_amenity.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF475569), Color(0xFF1E293B)],
                      ),
                    ),
                    child: const Center(
                      child: Icon(Icons.restaurant_rounded, size: 48, color: Colors.white24),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withValues(alpha: 0.15),
                        Colors.black.withValues(alpha: 0.65),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF065F46).withValues(alpha: 0.92),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF34D399)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Color(0xFF34D399),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Live Seat Audit',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: const Color(0xFF6EE7B7),
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Schedule chips row
        const Row(
          children: [
            Expanded(
              child: _ScheduleBadge(label: 'Breakfast: 07:30 - 09:30'),
            ),
            SizedBox(width: 6),
            Expanded(
              child: _ScheduleBadge(label: 'Lunch: 12:00 - 14:00'),
            ),
            SizedBox(width: 6),
            Expanded(
              child: _ScheduleBadge(label: 'Dinner: 19:30 - 21:30'),
            ),
          ],
        ),
      ],
    );
  }

  // ── 3. Laundry Telemetry Strip ──
  Widget _buildLaundrySlots(List<LaundryMachineSlot> slots) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: slots.map((s) {
          return Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: s.isAvailable
                      ? const Color(0xFFDCFCE7)
                      : const Color(0xFFDBEAFE),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: s.isAvailable
                        ? const Color(0xFF86EFAC)
                        : const Color(0xFF93C5FD),
                  ),
                ),
                child: Icon(
                  s.isAvailable
                      ? Icons.check_circle_rounded
                      : Icons.timelapse_rounded,
                  size: 18,
                  color: s.isAvailable
                      ? const Color(0xFF16A34A)
                      : const Color(0xFF2563EB),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                s.label,
                style: AppTextStyles.labelSmall.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                  color: AppColors.textDarkNavy,
                ),
              ),
              if (!s.isAvailable && s.remainingTime != null)
                Text(
                  s.remainingTime!,
                  style: AppTextStyles.labelSmall.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 9.5,
                    color: const Color(0xFF2563EB),
                  ),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }

  // ── 4. Security Desk Card ──
  Widget _buildSecurityDesk(Map<String, String> contact) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.badge_outlined,
              size: 20,
              color: AppColors.portalNavy,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact['warden'] ?? '',
                  style: AppTextStyles.labelMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDarkNavy,
                    fontSize: 12,
                  ),
                ),
                Text(
                  contact['extension'] ?? '',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onCallDutyDesk,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.portalNavy,
              foregroundColor: Colors.white,
              minimumSize: const Size(80, 34),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'Call Desk',
              style: AppTextStyles.labelSmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 11.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── 5. Study Hall Banner ──
  Widget _buildStudyBanner() {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              item.bannerImageUrl ?? 'assets/images/study_hall_amenity.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF334155), Color(0xFF0F172A)],
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.menu_book_rounded, size: 48, color: Colors.white24),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.15),
                    Colors.black.withValues(alpha: 0.65),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              right: 12,
              bottom: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.75),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                ),
                child: Text(
                  item.bannerBadgeText ?? '45/60 Desks Occupied',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── 6. Recreation Badges Row ──
  Widget _buildRecreationFeatures(List<Map<String, dynamic>> tags) {
    return Row(
      children: tags.map((t) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFDBEAFE)),
            ),
            child: Column(
              children: [
                Icon(
                  t['icon'] as IconData,
                  size: 20,
                  color: AppColors.primaryBlue,
                ),
                const SizedBox(height: 4),
                Text(
                  t['label'] as String,
                  style: AppTextStyles.labelSmall.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.portalNavy,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ScheduleBadge extends StatelessWidget {
  final String label;

  const _ScheduleBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFDBEAFE)),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: AppTextStyles.labelSmall.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.portalNavy,
            fontSize: 9.5,
          ),
        ),
      ),
    );
  }
}
