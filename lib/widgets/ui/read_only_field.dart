import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class ReadOnlyField extends StatelessWidget {
  final String value;

  const ReadOnlyField({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.textLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: AppColors.primaryGreen,
        ),
      ),
    );
  }
}
