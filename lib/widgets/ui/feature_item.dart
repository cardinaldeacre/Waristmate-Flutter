import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const FeatureItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textLight),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.textLight,
          fontWeight: FontWeight.w500,
        ),
      ),
      dense: true,
    );
  }
}
