import 'dart:math';

import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/features/home/fun_facts_data.dart';

class FunFactCard extends StatefulWidget {
  final Duration rotationDuration;

  const FunFactCard({
    super.key,
    this.rotationDuration = const Duration(seconds: 7),
  });

  @override
  State<FunFactCard> createState() => _FunFactCardState();
}

class _FunFactCardState extends State<FunFactCard>
    with SingleTickerProviderStateMixin {
  late final List<String> _facts;
  int _currentIndex = 0;
  late final AnimationController _progressController;

  @override
  void initState() {
    super.initState();

    _facts = List<String>.from(kFunFacts)..shuffle(Random());

    _progressController =
        AnimationController(vsync: this, duration: widget.rotationDuration)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _goToNext();
            }
          });

    _progressController.forward();
  }

  void _goToNext() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _facts.length;
    });
    _progressController
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: _goToNext,
        behavior: HitTestBehavior.opaque,
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
                    style: TextStyle(
                      color: AppColors.gold,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) {
                  final offsetAnimation = Tween<Offset>(
                    begin: const Offset(0, 0.15),
                    end: Offset.zero,
                  ).animate(animation);
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    ),
                  );
                },
                child: Text(
                  _facts[_currentIndex],
                  key: ValueKey<int>(_currentIndex),
                  style: const TextStyle(
                    color: AppColors.textLight,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AnimatedBuilder(
                  animation: _progressController,
                  builder: (context, _) {
                    return LinearProgressIndicator(
                      value: _progressController.value,
                      minHeight: 4,
                      backgroundColor: AppColors.textLight,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.gold),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
