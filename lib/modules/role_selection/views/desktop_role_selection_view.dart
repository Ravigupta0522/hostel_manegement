import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/role_selection_controller.dart';
import '../widgets/role_selection_top_bar.dart';
import '../widgets/role_gateway_header.dart';
import '../widgets/role_card.dart';
import '../widgets/role_selection_footer.dart';

/// Desktop Role Selection View — centered card with two-column role layout.
///
/// Layout:
///  ┌──────────────────────────────────────────┐
///  │  BackgroundSecondary outer scaffold      │
///  │  ┌────────────────────────────────────┐  │
///  │  │  TopBar                            │  │
///  │  │  GatewayHeader (centered)          │  │
///  │  │  [Student Card] | [Admin Card]     │  │
///  │  │  Footer                            │  │
///  │  └────────────────────────────────────┘  │
///  └──────────────────────────────────────────┘
class DesktopRoleSelectionView extends GetView<RoleSelectionController> {
  const DesktopRoleSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
            decoration: BoxDecoration(
              color: AppColors.backgroundWhite,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.border),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.06),
                  blurRadius: 40,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              children: [
                // ── Top bar
                const RoleSelectionTopBar(),
                const Divider(height: 0, color: AppColors.border),

                // ── Scrollable body
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Column(
                      children: [
                        // Gateway header
                        const RoleGatewayHeader(),
                        const SizedBox(height: 32),

                        // Two-column role cards
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: controller.roles
                                .map((role) => Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: RoleCard(
                                          data: role,
                                          onTap: () =>
                                              controller.selectRole(role.role),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Footer
                        const RoleSelectionFooter(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
