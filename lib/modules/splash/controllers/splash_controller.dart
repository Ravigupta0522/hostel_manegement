import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  // Loading progress value (0.0 to 1.0)
  final RxDouble progress = 0.0.obs;
  final RxString statusText = 'Initializing...'.obs;

  @override
  void onReady() {
    super.onReady();
    _startSplashSequence();
  }

  Future<void> _startSplashSequence() async {
    await Future.delayed(const Duration(milliseconds: 500));

    // Step 1: Initializing
    statusText.value = 'Initializing...';
    await _animateProgress(0.0, 0.3, const Duration(milliseconds: 600));

    // Step 2: Loading config
    statusText.value = 'Loading configuration...';
    await _animateProgress(0.3, 0.6, const Duration(milliseconds: 500));

    // Step 3: System ready
    statusText.value = 'System ready';
    await _animateProgress(0.6, 1.0, const Duration(milliseconds: 400));

    await Future.delayed(const Duration(milliseconds: 800));

    // Navigate to onboarding
    Get.offAllNamed(AppRoutes.onboarding);
  }

  Future<void> _animateProgress(
    double from,
    double to,
    Duration duration,
  ) async {
    const int steps = 30;
    final double stepValue = (to - from) / steps;
    final Duration stepDuration = Duration(
      milliseconds: duration.inMilliseconds ~/ steps,
    );

    for (int i = 0; i <= steps; i++) {
      progress.value = (from + stepValue * i).clamp(0.0, 1.0);
      await Future.delayed(stepDuration);
    }
  }
}
