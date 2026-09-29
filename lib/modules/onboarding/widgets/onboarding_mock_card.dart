import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_strings.dart';

/// Animated mock UI card — content changes per [pageIndex].
///
/// Page 0 → Room allocation card
/// Page 1 → Fees & payments card (Semester Ledger)
/// Page 2 → Notices & complaints card
class OnboardingMockCard extends StatelessWidget {
  final int pageIndex;
  const OnboardingMockCard({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      child: KeyedSubtree(
        key: ValueKey(pageIndex),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.backgroundWhite,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.08),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
            border: Border.all(color: AppColors.border),
          ),
          child: switch (pageIndex) {
            0 => const _RoomCard(),
            1 => const _FeesCard(),
            2 => const _NoticesCard(),
            _ => const _RoomCard(),
          },
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════
// PAGE 0 — Room Allocation Card
// ══════════════════════════════════════════════
class _RoomCard extends StatelessWidget {
  const _RoomCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _OccupancyBanner(),
        const Divider(height: 0, color: AppColors.divider),
        _RoomHeader(),
        const Divider(height: 0, color: AppColors.divider),
        _BedRow(),
        const Divider(height: 0, color: AppColors.divider),
        _KeycardFooter(),
      ],
    );
  }
}

class _OccupancyBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _Pill(
            label: AppStrings.onboardingOccupancy,
            bg: AppColors.success.withOpacity(0.1),
            border: AppColors.success.withOpacity(0.3),
            textColor: AppColors.success,
            dot: AppColors.success,
          ),
        ],
      ),
    );
  }
}

class _RoomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          _CircleIcon(icon: Icons.apartment_rounded, bg: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('WING NORTH',
                    style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.textSecondary, letterSpacing: 0.8)),
                Text('Unit #204 \u2013 Premium Shared',
                    style: AppTextStyles.labelLarge
                        .copyWith(color: AppColors.textPrimary)),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.success,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '2/3\nOccupied',
              textAlign: TextAlign.center,
              style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.w700,
                  height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}

class _BedRow extends StatelessWidget {
  final _beds = const [
    {'name': 'Bed A', 'student': 'Marcus R.', 'status': 'Verified', 'ok': true},
    {'name': 'Bed B', 'student': 'Aria Chen', 'status': 'Verified', 'ok': true},
    {'name': 'Bed C', 'student': 'Vacant', 'status': 'Ready', 'ok': false},
  ];

  const _BedRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: _beds.map((b) => Expanded(child: _BedTile(bed: b))).toList(),
      ),
    );
  }
}

class _BedTile extends StatelessWidget {
  final Map<String, dynamic> bed;
  const _BedTile({required this.bed});

  @override
  Widget build(BuildContext context) {
    final bool ok = bed['ok'] as bool;
    final Color dot = ok ? AppColors.success : AppColors.warning;
    final Color sc = ok ? AppColors.success : AppColors.textSecondary;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(bed['name'] as String,
                style: AppTextStyles.labelSmall
                    .copyWith(color: AppColors.textSecondary)),
            const SizedBox(width: 3),
            Container(
                width: 5,
                height: 5,
                decoration:
                    BoxDecoration(color: dot, shape: BoxShape.circle)),
          ]),
          const SizedBox(height: 5),
          Icon(ok ? Icons.person_rounded : Icons.bed_rounded,
              size: 18, color: ok ? AppColors.primary : AppColors.textLight),
          const SizedBox(height: 4),
          Text(bed['student'] as String,
              style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.textPrimary, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              color: sc.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(bed['status'] as String,
                style: AppTextStyles.labelSmall.copyWith(
                    color: sc, fontSize: 9, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}

class _KeycardFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            const Icon(Icons.credit_card_rounded,
                size: 14, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(AppStrings.onboardingKeycardActive,
                style: AppTextStyles.labelSmall
                    .copyWith(color: AppColors.textSecondary)),
          ]),
          Text(AppStrings.onboardingLiveSync,
              style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.primary, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════
// PAGE 1 — Fees & Payments Card (Semester Ledger)
// ══════════════════════════════════════════════
class _FeesCard extends StatelessWidget {
  const _FeesCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header row
        Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              _CircleIcon(
                  icon: Icons.receipt_long_rounded, bg: AppColors.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Semester Ledger',
                        style: AppTextStyles.labelLarge
                            .copyWith(color: AppColors.textPrimary)),
                    Text('Hostel Block B \u2022 Bed #204',
                        style: AppTextStyles.labelSmall
                            .copyWith(color: AppColors.textSecondary)),
                  ],
                ),
              ),
              _Pill(
                label: 'Fee Paid \u2022 Verified',
                bg: AppColors.success.withOpacity(0.12),
                border: AppColors.success.withOpacity(0.3),
                textColor: AppColors.success,
                dot: AppColors.success,
                icon: Icons.verified_rounded,
              ),
            ],
          ),
        ),
        const Divider(height: 0, color: AppColors.divider),

        // Total settled
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('TOTAL SETTLED',
                        style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.textSecondary,
                            letterSpacing: 0.8)),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: '\$1,450.00',
                          style: AppTextStyles.displayMedium.copyWith(
                              fontSize: 22, color: AppColors.textPrimary),
                        ),
                        TextSpan(
                          text: ' USD',
                          style: AppTextStyles.labelSmall
                              .copyWith(color: AppColors.textSecondary),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.receipt_outlined,
                  size: 20, color: AppColors.primary),
            ],
          ),
        ),

        // Line items
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          child: Column(
            children: const [
              _FeeLineItem(
                  dot: AppColors.primary,
                  label: 'Fall Semester Bunk (Shared)',
                  amount: '\$1,100.00'),
              _FeeLineItem(
                  dot: AppColors.info,
                  label: 'Unlimited Mess & Meal Plan',
                  amount: '\$300.00'),
              _FeeLineItem(
                  dot: AppColors.success,
                  label: 'Laundry & High-Speed Wi-Fi',
                  amount: '\$50.00'),
            ],
          ),
        ),
        const Divider(height: 0, color: AppColors.divider),

        // Payment action buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            children: [
              _ActionChip(icon: Icons.credit_card_rounded, label: 'Card'),
              const SizedBox(width: 8),
              _ActionChip(icon: Icons.compare_arrows_rounded, label: 'UPI / Net'),
              const Spacer(),
              _ActionChip(
                  icon: Icons.download_rounded,
                  label: 'Receipt PDF',
                  outlined: false),
            ],
          ),
        ),
        const Divider(height: 0, color: AppColors.divider),

        // Footer
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            children: [
              Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                      color: AppColors.success.withOpacity(0.6),
                      shape: BoxShape.circle)),
              const SizedBox(width: 8),
              Text('Auto-reconciliation with Dean Bursar Office',
                  style: AppTextStyles.labelSmall
                      .copyWith(color: AppColors.textSecondary, fontSize: 10)),
            ],
          ),
        ),
      ],
    );
  }
}

class _FeeLineItem extends StatelessWidget {
  final Color dot;
  final String label;
  final String amount;
  const _FeeLineItem(
      {required this.dot, required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Container(
              width: 7,
              height: 7,
              decoration:
                  BoxDecoration(color: dot, shape: BoxShape.circle)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(label,
                style: AppTextStyles.bodySmall
                    .copyWith(color: AppColors.textSecondary)),
          ),
          Text(amount,
              style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.textPrimary, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool outlined;
  const _ActionChip(
      {required this.icon, required this.label, this.outlined = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: outlined ? AppColors.backgroundWhite : AppColors.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: outlined ? AppColors.border : AppColors.primary.withOpacity(0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              size: 12,
              color: outlined ? AppColors.textSecondary : AppColors.primary),
          const SizedBox(width: 5),
          Text(label,
              style: AppTextStyles.labelSmall.copyWith(
                color: outlined ? AppColors.textSecondary : AppColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 10,
              )),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════
// PAGE 2 — Complaints, Attendance & Notices Card
// ══════════════════════════════════════════════
class _NoticesCard extends StatelessWidget {
  const _NoticesCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Row 1: Complaint — Room 304 Pipe Leak
        _ComplaintRow(),
        const Divider(height: 0, color: AppColors.divider),

        // ── Row 2: Attendance — Night Curfew Roll-Call (98%)
        _AttendanceRow(),
        const Divider(height: 0, color: AppColors.divider),

        // ── Row 3: Warden Memo notice
        _WardenMemoRow(),
        const Divider(height: 0, color: AppColors.divider),

        // ── Footer: Campus Shield Sync
        _CampusShieldFooter(),
      ],
    );
  }
}

// ── Row 1: Pipe Leak complaint with "Done" badge
class _ComplaintRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      child: Row(
        children: [
          // Green wrench icon
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.plumbing_rounded,
                size: 18, color: AppColors.success),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Room 304 Pipe Leak',
                        style: AppTextStyles.labelLarge
                            .copyWith(color: AppColors.textPrimary, fontSize: 12)),
                    const SizedBox(width: 5),
                    Container(
                      width: 6, height: 6,
                      decoration: const BoxDecoration(
                          color: AppColors.success, shape: BoxShape.circle),
                    ),
                  ],
                ),
                Row(children: [
                  const Icon(Icons.timer_outlined,
                      size: 10, color: AppColors.textSecondary),
                  const SizedBox(width: 3),
                  Text('Resolved in 1.5 hrs',
                      style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.textSecondary, fontSize: 10)),
                ]),
              ],
            ),
          ),
          // Done badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.success.withOpacity(0.3)),
            ),
            child: Text('Done',
                style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.success,
                    fontWeight: FontWeight.w700,
                    fontSize: 11)),
          ),
        ],
      ),
    );
  }
}

// ── Row 2: Night Curfew Roll-Call with 98% ring
class _AttendanceRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      child: Row(
        children: [
          // 98% circle
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: 2.5),
            ),
            child: Center(
              child: Text('98%',
                  style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                      fontSize: 9)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text('Night Curfew Roll-Call',
                      style: AppTextStyles.labelLarge
                          .copyWith(color: AppColors.textPrimary, fontSize: 12)),
                  const SizedBox(width: 5),
                  const Icon(Icons.notifications_rounded,
                      size: 12, color: AppColors.warning),
                ]),
                Text('412 of 420 Residents Verified',
                    style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.textSecondary, fontSize: 10)),
              ],
            ),
          ),
          // Sync / settings icon
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.backgroundSecondary,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.border),
            ),
            child: const Icon(Icons.sync_rounded,
                size: 15, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

// ── Row 3: Warden Memo
class _WardenMemoRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Blue megaphone icon
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.campaign_rounded,
                size: 18, color: AppColors.textWhite),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('WARDEN MEMO',
                        style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.textSecondary,
                            letterSpacing: 0.7,
                            fontWeight: FontWeight.w700,
                            fontSize: 9)),
                    Text('Today, 7:15 PM',
                        style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.textSecondary, fontSize: 9)),
                  ],
                ),
                const SizedBox(height: 2),
                Text('Quiet Hours & Library Extension',
                    style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 11)),
                Text('Study corridors open 24/7 during end-...',
                    style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.textSecondary, fontSize: 10),
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Footer: Campus Shield Sync
class _CampusShieldFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(Icons.shield_outlined,
              size: 12, color: AppColors.textLight),
          const SizedBox(width: 5),
          Text('CAMPUS SHIELD SYNC',
              style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.textLight,
                  letterSpacing: 0.6,
                  fontSize: 9,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════
// Shared helpers
// ══════════════════════════════════════════════
class _CircleIcon extends StatelessWidget {
  final IconData icon;
  final Color bg;
  const _CircleIcon({required this.icon, required this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)),
      child: Icon(icon, color: AppColors.textWhite, size: 18),
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;
  final Color bg;
  final Color border;
  final Color textColor;
  final Color dot;
  final IconData? icon;
  const _Pill({
    required this.label,
    required this.bg,
    required this.border,
    required this.textColor,
    required this.dot,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 11, color: textColor),
            const SizedBox(width: 4),
          ] else ...[
            Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(color: dot, shape: BoxShape.circle)),
            const SizedBox(width: 5),
          ],
          Text(label,
              style: AppTextStyles.labelSmall.copyWith(
                  color: textColor, fontWeight: FontWeight.w600, fontSize: 10)),
        ],
      ),
    );
  }
}
