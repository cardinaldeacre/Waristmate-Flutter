import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:waristmate_app/widgets/modul/chapter_modal.dart';
import 'package:waristmate_app/widgets/modul/floating_menu.dart';
import 'package:waristmate_app/widgets/modul/native_flutter_table.dart';
import 'package:waristmate_app/widgets/modul/materi_header.dart';

class MateriScreen extends StatefulWidget {
  final String bab;
  final String title;
  final String contentHtml;

  const MateriScreen({
    super.key,
    required this.bab,
    required this.title,
    required this.contentHtml,
  });

  @override
  State<MateriScreen> createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  bool isMenuOpen = true;

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClean,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                MateriHeader(title: widget.title),
                const SizedBox(height: 5),

                Expanded(
                  child: GestureDetector(
                    onTap: toggleMenu,
                    behavior: HitTestBehavior.opaque,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      child: HtmlWidget(
                        widget.contentHtml,
                        textStyle: const TextStyle(
                          fontSize: 14,
                          height: 1.3,
                          color: AppColors.textDark,
                        ),
                        customWidgetBuilder: (element) {
                          if (element.localName == 'table') {
                            return NativeFlutterTable(tableElement: element);
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
              bottom: isMenuOpen ? 30 : -100,
              child: FloatingMenu(
                onPrevious: () => print("Previous"),
                onNext: () => print("Next"),
                onMenu: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return ChapterModal(
                        currentChapter: widget.bab,
                        onClose: () => Navigator.pop(context),
                      );
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
