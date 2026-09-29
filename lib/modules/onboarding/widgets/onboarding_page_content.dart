import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../controllers/onboarding_controller.dart';
import 'onboarding_mock_card.dart';
import 'onboarding_badge.dart';

/// Shared widget — renders a single onboarding page: mock card + text.
///
/// Used by both [MobileOnboardingView] and [DesktopOnboardingView].
class OnboardingPageContent extends StatelessWidget {
  final OnboardingPage page;
  final int pageIndex;
  final bool isMobile;

  const OnboardingPageContent({
    super.key,
    required this.page,
    required this.pageIndex,
    this.isMobile = true,
  });

  @override
  Widget build(BuildContext context) {
    return isMobile ? _buildMobileLayout() : _buildDesktopLayout();
  }

  /// Mobile: card top, text bottom — portrait column.
  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Mock card (top 58%)
        Expanded(
          flex: 58,
          child: Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 12),
            child: OnboardingMockCard(pageIndex: pageIndex),
          ),
        ),

        // Text (bottom 42%)
        Expanded(
          flex: 42,
          child: _TextSection(
            page: page,
            titleFontSize: 26,
            subtitleFontSize: 14,
            padding: const EdgeInsets.symmetric(horizontal: 24),
          ),
        ),
      ],
    );
  }

  /// Desktop: text left, card right — landscape row.
  Widget _buildDesktopLayout() {
    return Row(
      children: [
        // Text (left 42%)
        Expanded(
          flex: 42,
          child: _TextSection(
            page: page,
            titleFontSize: 34,
            subtitleFontSize: 16,
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
            crossAxisAlignment: CrossAxisAlignment.start,
            textAlign: TextAlign.left,
          ),
        ),

        // Card (right 58%)
        Expanded(
          flex: 58,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: OnboardingMockCard(pageIndex: pageIndex),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// Private: text section — badge + title + subtitle
// ─────────────────────────────────────────────
class _TextSection extends StatelessWidget {
  final OnboardingPage page;
  final double titleFontSize;
  final double subtitleFontSize;
  final EdgeInsets padding;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign textAlign;

  const _TextSection({
    required this.page,
    required this.titleFontSize,
    required this.subtitleFontSize,
    required this.padding,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          OnboardingBadge(label: page.actionBadge),
          const SizedBox(height: 16),
          Text(
            page.title,
            style: AppTextStyles.displayMedium.copyWith(
              color: AppColors.textPrimary,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w800,
              height: 1.15,
            ),
            textAlign: textAlign,
          ),
          const SizedBox(height: 10),
          Text(
            page.subtitle,
            style: AppTextStyles.bodyMedium.copyWith(
              color: page.subtitleColor,
              fontSize: subtitleFontSize,
              height: 1.65,
            ),
            textAlign: textAlign,
          ),
        ],
      ),
    );
  }
}
