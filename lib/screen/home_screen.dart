import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/home/home_header.dart';
// import 'package:waristmate_app/widgets/home/hero_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClean,
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(),
            // HeroCard(onContinueLearning: () {}, onStartCalculating: () {}),
          ],
        ),
      ),
    );
  }
}
