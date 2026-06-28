import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/models/share_table.dart';

class RuleCard extends StatelessWidget {
  final ShareRule rule;
  final double fontSize;

  const RuleCard({super.key, required this.rule, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    if (rule.isNote) {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.amber.shade50,
          border: Border.all(color: Colors.amber.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          rule.condition,
          style: TextStyle(
            fontSize: fontSize,
            fontStyle: FontStyle.italic,
            color: Colors.grey.shade800,
            height: 1.4,
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (rule.share != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                rule.share!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                ),
              ),
            ),

          if (rule.share != null) const SizedBox(height: 10),

          Text(
            rule.condition,
            style: TextStyle(fontSize: fontSize, height: 1.4),
          ),
        ],
      ),
    );
  }
}
