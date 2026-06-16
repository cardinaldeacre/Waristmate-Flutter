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
              <h3 style="font-size: 20px; margin-bottom: 15px;">Definisi</h3>
              <table style="width: 100%;">
                <tr>
                  <td style="width: 25%; color: #177E68; font-weight: bold;">Bahasa</td>
                  <td style="width: 5%; text-align: center;">:</td>
                  <td style="width: 70%;">jamak dari kata <i>fardhu</i>, artinya kebijakan.</td>
                </tr>
                
                <tr>
                  <td style="color: #177E68; font-weight: bold;">Istilah</td>
                  <td style="text-align: center;">:</td>
                  <td>ilmu yang mempelajari bagaimana cara membagi warisan diantara para ahli waris.</td>
                </tr>
                
                <tr>
                  <td style="color: #177E68; font-weight: bold;">Subjek</td>
                  <td style="text-align: center;">:</td>
                  <td>Warisan.</td>
                </tr>
                
                <tr>
                  <td style="color: #177E68; font-weight: bold;">Tujuan</td>
                  <td style="text-align: center;">:</td>
                  <td>Menyampaikan hak-hak kepada mereka yang berhak.</td>
                </tr>
              </table>
              <h3 style="font-size: 20px; margin-bottom: 15px;">Dalil Hukum</h3>
              <div style="text-align: center; margin-bottom: 20px;">
                <p dir="rtl" style="font-size: 28px; line-height: 1.8; color: #177E68; font-family: serif;">
                  لِلرِّجَالِ نَصِيبٌ مِّمَّا تَرَكَ الْوَالِدَانِ وَالْأَقْرَبُونَ وَلِلنِّسَاءِ نَصِيبٌ مِّمَّا تَرَكَ الْوَالِدَانِ وَالْأَقْرَبُونَ مِمَّا قَلَّ مِنْهُ أَوْ كَثُرَ ۚ نَصِيبًا مَّفْرُوضًا
                </p>
                <p style="font-size: 14px; color: #555; margin-top: 10px;">
                  Bagi laki-laki ada hak bagian dari harta peninggalan kedua orang tua dan kerabatnya, dan bagi perempuan ada hak bagian (pula) dari harta peninggalan kedua orang tua dan kerabatnya, baik sedikit atau banyak menurut bagian yang telah ditetapkan. [Q.S 4: An-Nisa' (7)].
                </p>
              </div>
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
                        chapter['bab'] ?? '',
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
