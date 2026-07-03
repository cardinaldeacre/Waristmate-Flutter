import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/home/dalil_card.dart';
import 'package:waristmate_app/widgets/home/home_header.dart';
import 'package:waristmate_app/widgets/home/hero_card.dart';
import 'package:waristmate_app/widgets/home/welcome_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dalilList = [
      {
        "arabic":
            "لِلرِّجَالِ نَصِيبٌ مِّمَّا تَرَكَ الْوَالِدَانِ وَالْأَقْرَبُونَ...",
        "translation":
            "Bagi laki-laki ada hak bagian dari harta peninggalan kedua orang tua dan kerabatnya, dan bagi perempuan ada hak bagian (pula)... [Q.S 4: An-Nisa' (7)]",
      },
      {
        "arabic":
            "يُوصِيكُمُ اللَّهُ فِي أَوْلَادِكُمْ ۖ لِلذَّكَرِ مِثْلُ حَظِّ الْأُنثَيَيْنِ",
        "translation":
            "Allah mensyariatkan (mewajibkan) kepadamu tentang (pembagian warisan untuk) anak-anakmu, (yaitu) bagian seorang anak laki-laki sama dengan bagian dua orang anak perempuan. [Q.S 4: An-Nisa' (11)]",
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.backgroundClean,
      body: Column(
        children: [
          HomeHeader(),
          const SizedBox(height: 5),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 12),

                  WelcomeText(),

                  const SizedBox(height: 12),

                  HeroCard(
                    onContinueLearning: () {},
                    onStartCalculating: () {},
                  ),

                  const SizedBox(height: 8),

                  ...dalilList.map(
                    (dalil) => DalilCard(
                      arabicText: dalil["arabic"]!,
                      translation: dalil["translation"]!,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
