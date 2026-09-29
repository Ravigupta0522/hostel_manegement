import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../core/constants/app_strings.dart';

/// Data model for a single onboarding page.
class OnboardingPage {
  final String topBadge;        // center text in top bar
  final bool topBadgeIsStep;    // true → show as "STEP X OF Y" blue style
  final String actionBadge;     // pill badge above title
  final String title;
  final String subtitle;
  final Color subtitleColor;    // subtitle text color
  final String buttonLabel;     // CTA button label
  final String? footerNote;     // small text below button (optional)

  const OnboardingPage({
    required this.topBadge,
    this.topBadgeIsStep = false,
    required this.actionBadge,
    required this.title,
    required this.subtitle,
    this.subtitleColor = const Color(0xFF5A6A8A),
    required this.buttonLabel,
    this.footerNote,
  });
}

class OnboardingController extends GetxController {
  late final PageController pageController;
  final RxInt currentPage = 0.obs;

  final List<OnboardingPage> pages = const [
    OnboardingPage(
      topBadge: 'ROOM ALLOCATOR',
      actionBadge: 'Automated Dispatch',
      title: 'Hostel Management',
      subtitle:
          'Effortlessly manage room allocations, bed assignments, and resident profiles in one centralized digital space.',
      buttonLabel: 'Continue',
    ),
    OnboardingPage(
      topBadge: 'CAMPUS PAY SAFE',
      actionBadge: 'Smart Payments',
      title: 'Easy Fees & Payments',
      subtitle:
          'Track semester hostel dues, receive automated fee reminders, and pay securely with instant downloadable receipts.',
      buttonLabel: 'Continue to Verification',
    ),
    OnboardingPage(
      topBadge: 'STEP 3 OF 3',
      topBadgeIsStep: true,
      actionBadge: 'Campus Shield Sync',
      title: 'Complaints, Attendance & Notices',
      subtitle:
          'Log facility maintenance requests in real-time, register daily roll-call attendance, and never miss critical hostel circulars.',
      subtitleColor: Color(0xFFF59E0B),   // amber
      buttonLabel: 'Get Started',
      footerNote: 'Instant single sign-on with your student ID',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) => currentPage.value = index;

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      goToLogin();
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipOnboarding() => goToLogin();
  void goToLogin() => Get.offAllNamed(AppRoutes.roleSelection);

  bool get isLastPage  => currentPage.value == pages.length - 1;
  bool get isFirstPage => currentPage.value == 0;

  OnboardingPage get currentPageData => pages[currentPage.value];
  String get nextButtonLabel => currentPageData.buttonLabel;
  String? get footerNote => currentPageData.footerNote;

  String get stepLabel =>
      '${AppStrings.onboardingStep} ${currentPage.value + 1} ${AppStrings.onboardingOf} ${pages.length}';
}
