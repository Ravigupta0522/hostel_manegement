import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class WardenQuickActions extends StatelessWidget {
  final VoidCallback onCallOffice;
  final VoidCallback onSendEmail;
  final VoidCallback onDeskChat;

  const WardenQuickActions({
    super.key,
    required this.onCallOffice,
    required this.onSendEmail,
    required this.onDeskChat,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 1. Call Office
        Expanded(
          child: _buildActionCard(
            icon: Icons.phone_outlined,
            iconBg: const Color(0xFFEFF6FF),
            iconColor: const Color(0xFF1D4ED8),
            title: 'Call Office',
            subtitle: 'Ext. 2834',
            onTap: onCallOffice,
          ),
        ),
        const SizedBox(width: 10),

        // 2. Send Email
        Expanded(
          child: _buildActionCard(
            icon: Icons.mail_outline_rounded,
            iconBg: const Color(0xFFE0F2FE),
            iconColor: const Color(0xFF0284C7),
            title: 'Send Email',
            subtitle: 'Official Mail',
            onTap: onSendEmail,
          ),
        ),
        const SizedBox(width: 10),

        // 3. Desk Chat
        Expanded(
          child: _buildActionCard(
            icon: Icons.chat_bubble_outline_rounded,
            iconBg: const Color(0xFFD1FAE5),
            iconColor: const Color(0xFF059669),
            title: 'Desk Chat',
            subtitle: 'Leave Note',
            onTap: onDeskChat,
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderLight),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: iconBg,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 22, color: iconColor),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.labelMedium.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 12.5,
                color: AppColors.textDarkNavy,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 10.5,
                color: const Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
