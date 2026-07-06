import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/home/dalil_card.dart';
import 'package:waristmate_app/widgets/home/fun_fact_card.dart';
import 'package:waristmate_app/widgets/home/home_header.dart';
import 'package:waristmate_app/widgets/home/hero_card.dart';
import 'package:waristmate_app/widgets/home/welcome_text.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? onNavigateToCalculator;
  const HomeScreen({super.key, this.onNavigateToCalculator});

  @override
  Widget build(BuildContext context) {
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

                  HeroCard(onNavigateToCalculator: onNavigateToCalculator),

                  const SizedBox(height: 20),

                  FunFactCard(),

                  const SizedBox(height: 12),

                  DalilCard(),
                  const SizedBox(height: 150),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
