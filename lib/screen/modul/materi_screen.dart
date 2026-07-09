import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/modul_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:waristmate_app/widgets/modul/chapter_modal.dart';
import 'package:waristmate_app/widgets/modul/floating_menu.dart';
import 'package:waristmate_app/widgets/modul/table_share.dart';
import 'package:waristmate_app/widgets/modul/materi_header.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waristmate_app/widgets/modul/table_definition.dart';
import 'package:waristmate_app/widgets/profile/preference_card.dart';

class MateriScreen extends StatefulWidget {
  final List<Map<String, dynamic>> chapters;
  final int initialIndex;

  const MateriScreen({
    super.key,
    required this.chapters,
    required this.initialIndex,
  });
  @override
  State<MateriScreen> createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  late int _currentIndex;
  bool isMenuOpen = true;
  bool isLandscape = false;
  bool hasTriggerRotation = false;
  double _latinTextSize = 15.0;
  double _arabicTextSize = 28.0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _loadPreferences();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final babString = widget.chapters[_currentIndex]['bab']?.toString() ?? '';
      final int babNumber = int.tryParse(babString) ?? 1;

      context.read<ModulController>().updateLastReadBab(babNumber);
    });
  }

  void changeChapter(int newIndex) {
    if (newIndex == _currentIndex) return;

    setState(() {
      _currentIndex = newIndex;
    });

    final String babString =
        widget.chapters[newIndex]['bab']?.toString() ?? '1';
    final int babNumber = int.tryParse(babString) ?? 1;

    context.read<ModulController>().updateLastReadBab(babNumber);
  }

  Future<void> _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _latinTextSize = prefs.getDouble('latin_text_size') ?? 15.0;
      _arabicTextSize = prefs.getDouble('arabic_text_size') ?? 28.0;
    });
  }

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  void toggleOrientation() {
    setState(() {
      if (isLandscape) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      }
      setState(() {
        isLandscape = !isLandscape;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentChapter = widget.chapters[_currentIndex];
    final String bab = currentChapter['bab']?.toString() ?? '';
    final int currentBabNumber = int.tryParse(bab) ?? 1;
    final String title = currentChapter['title']?.toString() ?? '';
    final String contentHtml = currentChapter['content_html']?.toString() ?? '';

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.backgroundClean,
      body: GestureDetector(
        onScaleStart: (details) {
          hasTriggerRotation = false;
        },
        onScaleUpdate: (details) {
          if (details.pointerCount >= 2 && !hasTriggerRotation) {
            toggleOrientation();
            hasTriggerRotation = true;
          }
        },
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: toggleMenu,
                    behavior: HitTestBehavior.opaque,
                    child: SingleChildScrollView(
                      key: ValueKey(_currentIndex),
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(12, 120, 12, 100),
                      child: HtmlWidget(
                        key: ValueKey('html_$_latinTextSize-$_arabicTextSize'),
                        contentHtml,
                        textStyle: TextStyle(
                          fontSize: _latinTextSize,
                          height: 1.3,
                          color: AppColors.textDark,
                        ),
                        customStylesBuilder: (element) {
                          String greenHexColor =
                              '#${AppColors.primaryGreen.toARGB32().toRadixString(16).substring(2).padLeft(6, '0')}';

                          if (element.attributes['dir'] == 'rtl') {
                            return {
                              'font-size':
                                  '${_arabicTextSize.toInt()}px !important',
                              'font-family': 'Amiri',
                              'text-align': 'center',
                              'line-height': '2',
                              'color': greenHexColor,
                            };
                          }
                          if (element.classes.contains('span-blue')) {
                            return {'color': '#0a4fb6', 'font-weight': '500'};
                          }
                          if (element.classes.contains('span-green')) {
                            return {
                              'color': greenHexColor,
                              'font-weight': '500',
                            };
                          }
                          if (element.classes.contains('orange')) {
                            return {'color': '#c5681c', 'font-weight': '500'};
                          }
                          if (element.localName == 'p') {
                            return {
                              'text-align': 'justify',
                              'margin': '1px 2px 2px 1px',
                              'padding': '1px',
                            };
                          }
                          if (element.localName == 'ul' ||
                              element.localName == 'ol') {
                            return {'padding': '0px 1px 1px 16px'};
                          }
                          if (element.localName == 'li') {
                            return {'text-align': 'justify', 'padding': '1px'};
                          }

                          if (element.localName == 'i') {
                            return {
                              'font-style': 'italic',
                              'color': greenHexColor,
                              'font-weight': '500',
                            };
                          }
                          if (element.localName == 'h2') {
                            return {'text-align': 'center'};
                          }
                          if (element.localName == 'h3' ||
                              element.localName == 'h4') {
                            return {
                              'color': greenHexColor,
                              'margin': '0px',
                              'padding': '0px',
                            };
                          }
                          return null;
                        },

                        customWidgetBuilder: (element) {
                          if (element.classes.contains('table-definition') ||
                              element.classes.contains('table-count')) {
                            return TableDefinition(
                              tableElement: element,
                              fontSize: _latinTextSize,
                            );
                          }
                          if (element.classes.contains("table-share")) {
                            return NativeShareTable(
                              tableElement: element,
                              fontSize: _latinTextSize,
                            );
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),

            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: 0,
              right: 0,
              top: isMenuOpen ? 0 : -160,
              child: MateriHeader(title: title),
            ),

            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: 0,
              right: 0,
              bottom: isMenuOpen ? 30 : -100,
              child: Consumer<ModulController>(
                builder: (context, progressCtrl, child) {
                  return FloatingMenu(
                    onPrevious: _currentIndex > 0
                        ? () => changeChapter(_currentIndex - 1)
                        : null,
                    onNext: _currentIndex < widget.chapters.length - 1
                        ? () => changeChapter(_currentIndex + 1)
                        : null,
                    onMenu: () async {
                      final selectedIndex = await showModalBottomSheet<int>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return ChapterModal(
                            currentChapter: bab,
                            chapters: widget.chapters,
                            onClose: () => Navigator.pop(context),
                          );
                        },
                      );

                      if (selectedIndex != null) {
                        changeChapter(selectedIndex);
                      }
                    },
                    onFontSize: () async {
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return PreferenceCard(
                            title: "Preferensi",
                            heightFactor: 0.7,
                            onFontSizeChanged: () {
                              _loadPreferences();
                            },
                            child: Container(),
                          );
                        },
                      );
                      _loadPreferences();
                    },
                    onRotate: () => toggleOrientation(),
                  );
                },
              ),
            ),

            Positioned(
              top: 69,
              right: 16,
              child: Consumer<ModulController>(
                builder: (context, progressCtrl, _) {
                  final isBookmarked = progressCtrl.bookmarkedBabs.contains(
                    currentBabNumber,
                  );
                  if (!progressCtrl.isLoggedIn) {
                    return const SizedBox.shrink();
                  }
                  return IconButton(
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark,
                      color: isBookmarked ? AppColors.errorRed : AppColors.grey,
                      size: 48,
                    ),
                    onPressed: () {
                      progressCtrl.toggleBookmark(currentBabNumber);
                    },
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
