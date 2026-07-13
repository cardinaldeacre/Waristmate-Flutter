import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/controllers/modul_controller.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/models/learning_module.dart';
import 'package:waristmate_app/screen/modul/materi_screen.dart';

class HeroCard extends StatelessWidget {
  final VoidCallback? onNavigateToCalculator;
  const HeroCard({super.key, this.onNavigateToCalculator});

  void onContinueLearning(BuildContext context) {
    final modulController = context.read<ModulController>();
    final lastRead = modulController.lastReadBab;

    final materiBab = Hive.box('materiBox');
    final localData = materiBab.get('modul_waris');

    if (localData == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Data modul sedang dimuat, coba buka tab modul dulu ya!',
          ),
          backgroundColor: AppColors.primaryGreen,
        ),
      );
      return;
    }

    final chapters = List<LearningModule>.from(
      (localData as List).map((item) => LearningModule.fromMap(item)),
    );

    int targetIndex = chapters.indexWhere(
      (chapter) => chapter.bab.toString() == lastRead.toString(),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            MateriScreen(chapters: chapters, initialIndex: targetIndex),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = Supabase.instance.client.auth.currentUser != null;
    final String welcomeMessage = isLoggedIn ? 'Lanjut' : 'Mulai';
    final String user =
        Supabase.instance.client.auth.currentUser?.userMetadata?['name'] ?? '';
    final userName = user.isNotEmpty ? user : 'Pembelajar Faraidh';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.darkGreen, width: 3.5),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: -10,
                  bottom: -5,
                  child: Image.asset('assets/images/3d_book.png', width: 172),
                ),

                Positioned(
                  top: 18,
                  right: -15,
                  child: Image.asset('assets/images/3d_coin.png', width: 45),
                ),

                Positioned(
                  top: 80,
                  left: -20,
                  child: Transform.flip(
                    flipX: true,
                    child: Image.asset('assets/images/3d_coin.png', width: 45),
                  ),
                ),

                Positioned(
                  bottom: -15,
                  left: 180,
                  child: Image.asset('assets/images/3d_coin.png', width: 50),
                ),

                Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 15,
                    bottom: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hai $userName,\nAyo $welcomeMessage Belajar!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.only(left: 120),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.gold,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  shadowColor: Colors.black,
                                  elevation: 4,
                                ),
                                onPressed: () => onContinueLearning(context),
                                child: Text(
                                  "$welcomeMessage Belajar",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.lime,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  shadowColor: Colors.black,
                                  elevation: 4,
                                ),
                                onPressed: onNavigateToCalculator,
                                child: const Text(
                                  "Kalkulator Waris",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
