import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/features/home/dalil_data.dart';

class DalilCard extends StatefulWidget {
  final Duration rotationDuration;

  const DalilCard({
    super.key,
    this.rotationDuration = const Duration(seconds: 20),
  });

  @override
  State<DalilCard> createState() => _DalilCardState();
}

class _DalilCardState extends State<DalilCard>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
          vsync: this,
          duration: widget.rotationDuration,
          animationBehavior: AnimationBehavior.preserve,
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) _goToNext();
        });
    _controller.forward();
  }

  void _goToNext() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % kDalilList.length;
    });
    _controller
      ..reset()
      ..forward();
  }

  void _goToIndex(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
    _controller
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dalil = kDalilList[_currentIndex];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: GestureDetector(
        onTap: _goToNext,
        behavior: HitTestBehavior.opaque,
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            radius: const Radius.circular(20),
            strokeWidth: 2.5,
            dashPattern: const [10, 6],
            color: AppColors.darkGreen,
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: AppColors.darkGreen,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: const Icon(
                        Icons.menu_book_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Dalil Naqli',
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const Spacer(),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        key: ValueKey<String>(dalil.source),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.gold.withAlpha(38),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.gold.withAlpha(128),
                          ),
                        ),
                        child: Text(
                          dalil.source,
                          style: const TextStyle(
                            color: AppColors.darkGreen,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -14,
                      left: -6,
                      child: Icon(
                        Icons.format_quote_rounded,
                        size: 34,
                        color: AppColors.darkGreen.withAlpha(30),
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 450),
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.08),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      ),
                      child: Column(
                        key: ValueKey<int>(_currentIndex),
                        children: [
                          Text(
                            dalil.arabicText,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              fontSize: 24,
                              height: 1.9,
                              color: AppColors.textDark,
                              fontFamily: 'Amiri',
                            ),
                          ),
                          const SizedBox(height: 14),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 28,
                                height: 1,
                                color: AppColors.darkGreen.withAlpha(77),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                width: 5,
                                height: 5,
                                decoration: const BoxDecoration(
                                  color: AppColors.gold,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 28,
                                height: 1,
                                color: AppColors.darkGreen.withAlpha(77),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          Text(
                            dalil.translation,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 13.5,
                              fontStyle: FontStyle.italic,
                              color: AppColors.textDark,
                              height: 1.6,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (context, _) {
                                return LinearProgressIndicator(
                                  value: _controller.value,
                                  minHeight: 4,
                                  backgroundColor: AppColors.textLight,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.gold,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(kDalilList.length, (index) {
                    final isActive = index == _currentIndex;
                    return GestureDetector(
                      onTap: () => _goToIndex(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: isActive ? 16 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.darkGreen
                              : AppColors.darkGreen.withAlpha(64),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
