import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:dotted_border/dotted_border.dart';

class DalilCard extends StatelessWidget {
  final String arabicText;
  final String translation;

  const DalilCard({
    super.key,
    required this.arabicText,
    required this.translation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: const Radius.circular(16),
          strokeWidth: 2.5,
          dashPattern: const [12, 6],
          color: AppColors.darkGreen,
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Text(
                arabicText,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 26,
                  height: 1.8,
                  color: AppColors.textDark,
                  fontFamily: 'Amiri',
                ),
              ),
              const SizedBox(height: 16),
              Text(
                translation,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: AppColors.textDark,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
