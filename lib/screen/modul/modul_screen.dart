import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/modul_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/modul/chapter_card.dart';
import 'package:waristmate_app/widgets/modul/module_header.dart';
import 'package:waristmate_app/services/modul/materi_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ModulScreen extends StatefulWidget {
  const ModulScreen({super.key});

  @override
  State<ModulScreen> createState() => _ModulScreenState();
}

class _ModulScreenState extends State<ModulScreen> {
  final _materiService = MateriService();

  @override
  void initState() {
    super.initState();
    _materiService.fetchLearningModules();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ModulController>().fetchLastReadAndBookmarks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modulCtrl = context.watch<ModulController>();
    return Scaffold(
      backgroundColor: AppColors.backgroundClean,
      body: SafeArea(
        child: Column(
          children: [
            ModuleHeader(),

            const SizedBox(height: 5),

            Expanded(
              child: ValueListenableBuilder(
                valueListenable: Hive.box('materiBox').listenable(),
                builder: (context, Box box, _) {
                  final localData = box.get('modul_waris');

                  if (localData == null) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final chapters = List<Map<String, dynamic>>.from(
                    (localData as List).map(
                      (item) => Map<String, dynamic>.from(item),
                    ),
                  );

                  if (chapters.isEmpty) {
                    return const Center(
                      child: Text('Belum ada materi yang tersedia.'),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: chapters.length,
                    itemBuilder: (context, index) {
                      final currentChapter = chapters[index];
                      final String babStr = currentChapter['bab'].toString();
                      final int babNumber = int.tryParse(babStr) ?? 0;

                      return ChapterCard(
                        chapter: {
                          'bab': currentChapter['bab'].toString(),
                          'title': currentChapter['title'].toString(),
                          'content_html': currentChapter['content_html']
                              .toString(),
                        },
                        index: index,
                        chapterList: chapters,
                        isBookmarked: modulCtrl.isLoggedIn
                            ? modulCtrl.bookmarkedBabs.contains(babNumber)
                            : false,
                        isLastRead: modulCtrl.lastReadBab == babNumber,
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
