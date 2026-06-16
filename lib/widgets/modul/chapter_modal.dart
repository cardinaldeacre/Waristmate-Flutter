import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';

class ChapterModal extends StatelessWidget {
  final String currentChapter;
  final VoidCallback onClose;

  const ChapterModal({
    super.key,
    required this.currentChapter,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> chapters = [
      'Pendahuluan',
      'Dasar Hukum',
      'Harta Warisan',
      'Ahli Waris',
      'Pembagian Warisan',
    ];

    return Container(
      height:
          MediaQuery.of(context).size.height * 0.7, // Tinggi modal 70% layar
      decoration: const BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 16,
              top: 20,
              bottom: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Pilih Bab",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gabarito',
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded, color: Colors.white),
                  onPressed: onClose,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Cari bab...",
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.grey.shade500,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_downward_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              physics: const BouncingScrollPhysics(),
              itemCount: chapters.length,
              itemBuilder: (context, index) {
                final isCurrent = chapters[index].startsWith(currentChapter);

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: isCurrent
                        ? Border.all(color: AppColors.primaryGreen, width: 1.5)
                        : null,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 4,
                    ),
                    title: Text(
                      chapters[index],
                      style: TextStyle(
                        color: isCurrent
                            ? AppColors.primaryGreen
                            : Colors.white,
                        fontWeight: isCurrent
                            ? FontWeight.bold
                            : FontWeight.w500,
                        fontFamily: 'Gabarito',
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Navigasi ke bab yang dipilih
                      print("Pindah ke: ${chapters[index]}");
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
