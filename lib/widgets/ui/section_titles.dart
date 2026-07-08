import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class SectionTitles extends StatelessWidget {
  final String title;

  const SectionTitles({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
      ),
    );
  }
}
