import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class BuildCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const BuildCard({super.key, required this.child, this.padding});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkShadow.withAlpha(120),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
