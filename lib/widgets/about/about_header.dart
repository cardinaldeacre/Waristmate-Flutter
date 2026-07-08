import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class AboutHeader extends StatelessWidget {
  const AboutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.primaryGreen.withAlpha(26),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
            'assets/images/logo_rounded.png',
            width: 60,
            height: 60,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'WarisMate',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryGreen,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'v1.0.0',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.lime,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '"Hitung Warisan dengan Mudah"',
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}
