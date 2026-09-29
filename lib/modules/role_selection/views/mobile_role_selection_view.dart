import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/role_selection_controller.dart';
import '../widgets/role_selection_top_bar.dart';
import '../widgets/role_gateway_header.dart';
import '../widgets/role_card.dart';
import '../widgets/role_selection_footer.dart';

/// Mobile Role Selection View — single scrollable column layout.
///
/// Composes all role_selection widgets from [role_selection/widgets].
/// Uses [RoleSelectionController] via GetView pattern.
class MobileRoleSelectionView extends GetView<RoleSelectionController> {
  const MobileRoleSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top bar: Back | Role Selection | Profile icon
            const RoleSelectionTopBar(),

            // ── Scrollable content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(
                  children: [
                    const SizedBox(height: 8),

                    // ── Gateway header: icon + badge + title + subtitle
                    const RoleGatewayHeader(),
                    const SizedBox(height: 24),

                    // ── Role cards
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: controller.roles
                            .map((role) => Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: RoleCard(
                                    data: role,
                                    onTap: () => controller.selectRole(role.role),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),

                    // ── Footer: hostel info + help text
                    const RoleSelectionFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
