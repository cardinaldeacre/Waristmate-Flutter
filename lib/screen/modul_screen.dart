import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/modul/chapter_card.dart';
import 'modul/materi_screen.dart';

class ModulScreen extends StatelessWidget {
  ModulScreen({super.key});

  final List<Map<String, String>> chapters = [
    {"bab": "Bab 1", "title": "Pendahuluan Ilmu Waris"},
    {"bab": "Bab 2", "title": "Harta Waris"},
    {"bab": "Bab 3", "title": "Sebab - Sebab Warisan"},
    {"bab": "Bab 4", "title": "Pembagian Yang Ditentukan"},
    {"bab": "Bab 5", "title": "Ahli Waris : Ta'sib"},
    {"bab": "Bab 6", "title": "Ahli Waris : Hajb"},
    {"bab": "Bab 7", "title": "Tabel Waris"},
    {"bab": "Bab 8", "title": "Metode Dasar"},
    {"bab": "Bab 9", "title": "Penyesuaian Al-'Aul"},
    {"bab": "Bab 10", "title": "Koreksi Masalah"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClean,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 20,
                bottom: 14,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40),
                  const Text(
                    "Modul Pembelajaran",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textLight,
                    ),
                  ),
                  Image.asset('assets/images/logo_white.png', width: 40),
                ],
              ),
            ),

            const SizedBox(height: 5),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  return ChapterCard(chapter: chapters[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
