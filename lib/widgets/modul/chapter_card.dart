import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/models/learning_module.dart';
import 'package:waristmate_app/screen/modul/materi_screen.dart';

class ChapterCard extends StatelessWidget {
  final LearningModule chapter;
  final List<LearningModule> chapterList;
  final int index;
  final bool isBookmarked;
  final bool isLastRead;
  final String? snippet;

  const ChapterCard({
    super.key,
    required this.chapter,
    required this.chapterList,
    required this.index,
    this.snippet,
    this.isBookmarked = false,
    this.isLastRead = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkShadow.withAlpha(120),
            blurRadius: 7,
            offset: const Offset(0, -2),
          ),
        ],
        border: Border.all(
          color: isLastRead
              ? AppColors.primaryGreen.withAlpha(30)
              : AppColors.primaryGreen.withAlpha(51),
          width: isLastRead ? 1.5 : 1,
        ),
      ),

      child: Material(
        color: isLastRead
            ? AppColors.lightGreen.withAlpha(70)
            : AppColors.backgroundClean,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          splashColor: AppColors.primaryGreen.withValues(alpha: 0.1),
          highlightColor: AppColors.primaryGreen.withValues(alpha: 0.05),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MateriScreen(chapters: chapterList, initialIndex: index),
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
                      Row(
                        children: [
                          Text(
                            "Bab ${chapter.bab}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryGreen,
                            ),
                          ),
                          if (isBookmarked)
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.bookmark_rounded,
                                color: AppColors.gold,
                                size: 18,
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 4),

                      Text(
                        chapter.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),

                      if (snippet != null && snippet!.isNotEmpty) ...[
                        const SizedBox(height: 6),
                        Text(
                          snippet!,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.3,
                            color: AppColors.textDark,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],

                      if (isLastRead) ...[
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryGreen.withAlpha(30),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.access_time_filled_rounded,
                                size: 12,
                                color: AppColors.primaryGreen,
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                "Terakhir dibaca",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.primaryGreen,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
