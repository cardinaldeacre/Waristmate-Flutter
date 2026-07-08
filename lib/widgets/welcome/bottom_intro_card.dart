import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/core/extension/context_extension.dart';
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
    bool isSmall = context.isSmallScreen;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(
            isSmall ? 12 : 20,
            0,
            isSmall ? 12 : 20,
            40,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isSmall ? 12 : 16,
            vertical: isSmall ? 6 : 8,
          ),
          decoration: const BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmall ? 8 : 12,
                        vertical: isSmall ? 12 : 16,
                      ),

                      child: Column(
                        children: [
                          Text(
                            slide.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
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
                              fontSize: 14,
                              color: AppColors.darkGreen,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
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
          bottom: 40,
          child: GestureDetector(
            onTap: onHomeTap,
            child: Container(
              width: isSmall ? 80 : 100,
              height: isSmall ? 100 : 120,
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
              decoration: BoxDecoration(
                color: AppColors.secondaryGreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                  topRight: Radius.circular(200),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.darkShadow.withAlpha(128),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.home_rounded,
                    color: AppColors.primaryGreen,
                    size: isSmall ? 40 : 60,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
