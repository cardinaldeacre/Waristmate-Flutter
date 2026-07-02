import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/core/extension/context_extension.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const CircleButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool isSmall = context.isSmallScreen;
    final double padding = isSmall ? 8 : 12;
    final double iconSize = isSmall ? 20 : 24;
    final double margin = isSmall ? 4 : 8;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: AppColors.primaryGreen,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryGreen.withValues(alpha: 0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, color: AppColors.textLight, size: iconSize),
      ),
    );
  }
}
