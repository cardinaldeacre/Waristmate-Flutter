import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/screen/welcome/welcome_screen.dart';

class BottomIntroCard extends StatelessWidget {
  final PageController pageController;
  final List<WelcomeSlide> slides;
  final int currentPage;
  final ValueChanged<int> onPageChanged;
  final VoidCallback onHomeTap;

  const BottomIntroCard({
    super.key,
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
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 32,
                      ),

                      child: Column(
                        children: [
                          Text(
                            slide.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: AppColors.darkGreen,
                              height: 1.25,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            slide.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.darkGreen,
                              fontWeight: FontWeight.w600,
                              height: 1.4,
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
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                width: currentPage == index ? 20 : 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: currentPage == index
                                      ? AppColors.primaryGreen
                                      : AppColors.primaryGreen.withAlpha(128),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 33,
          child: GestureDetector(
            onTap: onHomeTap,
            child: const Icon(
              Icons.home_rounded,
              color: AppColors.primaryGreen,
              size: 80,
            ),
          ),
        ),
      ],
    );
  }
}
