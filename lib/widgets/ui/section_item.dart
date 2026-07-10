import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class SectionItem extends StatelessWidget {
  final String name;
  final String description;
  final String? title;

  const SectionItem({
    super.key,
    required this.name,
    required this.description,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.gold,
            ),
          ),
          const Divider(height: 4, color: AppColors.darkGrey),
          if (title != null)
            Text(
              title!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.grey,
              ),
            ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 14, color: AppColors.textLight),
          ),
        ],
      ),
    );
  }
}
