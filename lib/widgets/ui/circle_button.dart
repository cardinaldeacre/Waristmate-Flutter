import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final double radius;

  const CircleButton({
    super.key,
    required this.icon,
    this.onTap,
    this.radius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(12),
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
        child: Icon(icon, color: AppColors.textLight, size: 24),
      ),
    );
  }
}
