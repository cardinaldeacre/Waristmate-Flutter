import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/screen/modul/materi_screen.dart';

class ChapterCard extends StatelessWidget {
  final Map<String, String> chapter;

  const ChapterCard({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    const double cardRadius = 20;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.backgroundClean,
        borderRadius: BorderRadius.circular(cardRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: AppColors.primaryGreen.withValues(alpha: 0.2),
          width: 1,
        ),
      ),

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(cardRadius),
          splashColor: AppColors.primaryGreen.withValues(alpha: 0.1),
          highlightColor: AppColors.primaryGreen.withValues(alpha: 0.05),
          onTap: () {
            String dummyHtml = '''
            
            ''';
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MateriScreen(
                  bab: chapter['bab'] ?? '',
                  title: chapter['title'] ?? '',
                  contentHtml: dummyHtml,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.import_contacts_rounded,
                    color: AppColors.primaryGreen,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bab ${chapter['bab'] ?? ''}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryGreen,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        chapter['title'] ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.primaryGreen,
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
