import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/screen/main_wrapper.dart';
import 'package:waristmate_app/widgets/welcome/bottom_intro_card.dart';
import 'package:waristmate_app/widgets/welcome/hero_welcome.dart';

class WelcomeSlide {
  final String title;
  final String description;

  const WelcomeSlide({required this.title, required this.description});
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  Timer? _autoSlideTimer;
  int _currentPage = 0;

  final List<WelcomeSlide> _slides = const [
    WelcomeSlide(
      title: 'Akses Modul Faraidh\nKapan Saja',
      description:
          'Aplikasi lengkap untuk mempelajari hukum waris Islam (Faraidh) '
          'secara terstruktur, interaktif, dan mudah dipahami',
    ),
    WelcomeSlide(
      title: 'Simulasi Perhitungan\nWaris Otomatis',
      description:
          'Hitung pembagian harta waris sesuai syariat dengan cepat, '
          'akurat, dan berdasarkan dalil yang berlaku',
    ),
    WelcomeSlide(
      title: 'Catatan Pribadi\nTerorganisir',
      description:
          'Simpan progres belajar dan catatan pentingmu agar mudah '
          'diakses kapan pun kamu membutuhkannya',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.primaryGreen.withAlpha(3000),
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!mounted) return;
      final nextPage = (_currentPage + 1) % _slides.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onPageChanged(int index) {
    setState(() => _currentPage = index);
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.secondaryGreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(flex: 8, child: HeroWelcome()),
            Expanded(
              flex: 7,
              child: BottomIntroCard(
                pageController: _pageController,
                slides: _slides,
                currentPage: _currentPage,
                onPageChanged: _onPageChanged,
                onHomeTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const MainWrapper(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
