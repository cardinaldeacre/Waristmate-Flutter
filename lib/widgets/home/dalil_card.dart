import 'package:expandable_page_view/expandable_page_view.dart';
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
  late final PageController _pageController;

  static const int _loopPages = 100000;

  static int _currentPage = _loopPages ~/ 2;

  int get _currentIndex => _currentPage % kDalilList.length;

  @override
  void initState() {
    super.initState();

    _currentPage = _loopPages ~/ 2;

    _pageController = PageController(initialPage: _currentPage);
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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: GestureDetector(
        onTap: _goNext,
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
                      "Dalil Naqli",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGreen,
                      ),
                    ),

                    const Spacer(),

                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Container(
                        key: ValueKey(_currentIndex),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.gold.withAlpha(38),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.gold.withAlpha(120),
                          ),
                        ),
                        child: Text(
                          kDalilList[_currentIndex].source,
                          style: const TextStyle(
                            color: AppColors.darkGreen,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Icon(
                          Icons.format_quote_rounded,
                          size: 34,
                          color: AppColors.darkGreen.withAlpha(35),
                        ),
                      ),
                    ),

                    const SizedBox(height: 6),

                    ExpandablePageView.builder(
                      controller: _pageController,
                      itemCount: _loopPages,
                      physics: const BouncingScrollPhysics(),

                      onPageChanged: (page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },

                      itemBuilder: (_, page) {
                        final dalil = kDalilList[page % kDalilList.length];

                        return Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Column(
                            children: [
                              Text(
                                dalil.arabicText,
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontFamily: "Amiri",
                                  height: 1.9,
                                  color: AppColors.darkGreen,
                                ),
                              ),

                              const SizedBox(height: 14),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 28,
                                    height: 1,
                                    color: AppColors.darkGreen.withAlpha(80),
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
                                    color: AppColors.darkGreen.withAlpha(80),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 14),

                              Text(
                                dalil.translation,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 13.5,
                                  height: 1.6,
                                  color: AppColors.textDark,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    IconButton(
                      onPressed: _goPrevious,
                      icon: const Icon(Icons.chevron_left_rounded),
                      color: AppColors.darkGreen,
                    ),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (i) {
                          final active = (_currentIndex % 5) == i;

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: active ? 18 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: active
                                  ? AppColors.darkGreen
                                  : AppColors.darkGreen.withAlpha(60),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          );
                        }),
                      ),
                    ),

                    IconButton(
                      onPressed: _goNext,
                      icon: const Icon(Icons.chevron_right_rounded),
                      color: AppColors.darkGreen,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
