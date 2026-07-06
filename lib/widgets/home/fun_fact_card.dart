import 'dart:math';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/features/home/fun_facts_data.dart';

class FunFactCard extends StatefulWidget {
  const FunFactCard({super.key});

  @override
  State<FunFactCard> createState() => _FunFactCardState();
}

class _FunFactCardState extends State<FunFactCard> {
  late final List<String> _facts;
  late final PageController _pageController;

  static const int _loopPages = 100000;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _facts = List<String>.from(kFunFacts)..shuffle(Random());

    _pageController = PageController(initialPage: _loopPages ~/ 2);

    _currentIndex = (_loopPages ~/ 2) % _facts.length;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goNext() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goPrevious() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.primaryGreen,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.darkGreen, width: 3.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.lightbulb_rounded,
                    color: AppColors.textLight,
                    size: 18,
                  ),
                ),

                const SizedBox(width: 10),

                const Text(
                  'Tahukah Kamu?',
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                Text(
                  '${_currentIndex + 1}/${_facts.length}',
                  style: const TextStyle(
                    color: AppColors.gold,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            ExpandablePageView.builder(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: _loopPages,
              onPageChanged: (page) {
                setState(() {
                  _currentIndex = page % _facts.length;
                });
              },

              itemBuilder: (context, page) {
                final index = page % _facts.length;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    _facts[index],
                    style: const TextStyle(
                      color: AppColors.textLight,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                IconButton(
                  onPressed: _goPrevious,
                  icon: const Icon(Icons.chevron_left_rounded),
                  color: AppColors.gold,
                ),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (i) {
                      final active = (_currentIndex % 5) == i;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: active ? 18 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: active ? AppColors.gold : Colors.white38,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      );
                    }),
                  ),
                ),

                IconButton(
                  onPressed: _goNext,
                  icon: const Icon(Icons.chevron_right_rounded),
                  color: AppColors.gold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
