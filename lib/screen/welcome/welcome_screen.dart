import 'dart:async';
import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/screen/main_wrapper.dart';

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
      backgroundColor: AppColors.primaryGreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // koin-koin dekoratif, opsional, bisa dihapus
                      // kalau sudah pakai file ilustrasi lengkap
                      Image.asset(
                        'assets/images/scale_illustration.png',
                        height: 220,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.balance_rounded,
                          size: 160,
                          color: AppColors.gold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'WARISTMATE',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textLight,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: _BottomIntroCard(
                pageController: _pageController,
                slides: _slides,
                currentPage: _currentPage,
                onPageChanged: _onPageChanged,
                onHomeTap: () {
                  // Navigasi ke halaman utama aplikasi
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

class _BottomIntroCard extends StatelessWidget {
  final PageController pageController;
  final List<WelcomeSlide> slides;
  final int currentPage;
  final ValueChanged<int> onPageChanged;
  final VoidCallback onHomeTap;

  const _BottomIntroCard({
    required this.pageController,
    required this.slides,
    required this.currentPage,
    required this.onPageChanged,
    required this.onHomeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/welcome_layout.png'),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: onPageChanged,
                  itemCount: slides.length,
                  itemBuilder: (context, index) {
                    final slide = slides[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          slide.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryGreen,
                            height: 1.25,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          slide.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.primaryGreen,
                            height: 1.4,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Indikator titik (dot indicator)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  slides.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentPage == index ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? AppColors.primaryGreen
                          : AppColors.primaryGreen.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // 2. Tombol Home
        Positioned(
          // ⚠️ PENTING: Atur angka bottom ini biar posisi tombol pas di tengah-tengah lubang gambar
          bottom: 12,
          child: GestureDetector(
            onTap: onHomeTap,
            child: Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: AppColors
                    .cardBackground, // Bisa diganti putih kalau kurang nyatu
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.home_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
