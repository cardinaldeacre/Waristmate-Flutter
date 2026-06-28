import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/models/share_table.dart';
import 'package:waristmate_app/widgets/modul/rule_card.dart';

class HeirCard extends StatelessWidget {
  final ShareHeir heir;
  final double fontSize;

  const HeirCard({super.key, required this.heir, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.primaryGreen, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 16, child: Text(heir.number)),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    heir.heirName,
                    style: TextStyle(
                      fontSize: fontSize + 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            ...heir.rules.map(
              (rule) => RuleCard(rule: rule, fontSize: fontSize),
            ),
          ],
        ),
      ),
    );
  }
}
