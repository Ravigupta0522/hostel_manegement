import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/layout_widgets.dart';
import '../controllers/role_selection_controller.dart';
import 'mobile_role_selection_view.dart';
import 'desktop_role_selection_view.dart';

/// Role Selection Entry Point — shown after Onboarding, before Login.
///
/// This view's ONLY responsibility is to decide which layout to render
/// based on the current screen size, using the [Responsive] utility.
///
/// - Mobile / Tablet  (< 1024px wide) → [MobileRoleSelectionView]
/// - Desktop          (≥ 1024px wide) → [DesktopRoleSelectionView]
///
/// Both views use the same [RoleSelectionController] for all state and logic.
class RoleSelectionView extends GetView<RoleSelectionController> {
  const RoleSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const DesktopRoleSelectionView();
    }
    return const MobileRoleSelectionView();
  }
}
