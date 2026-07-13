import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/materi_controller.dart';
import 'package:waristmate_app/controllers/modul_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/modul/chapter_card.dart';
import 'package:waristmate_app/widgets/modul/module_header.dart';
import 'package:waristmate_app/widgets/modul/module_search_bar.dart';

class ModulScreen extends StatefulWidget {
  const ModulScreen({super.key});

  @override
  State<ModulScreen> createState() => _ModulScreenState();
}

class _ModulScreenState extends State<ModulScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ModulController>().fetchLastReadAndBookmarks();
      context.read<MateriController>().fetchLearningModules();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modulCtrl = context.watch<ModulController>();
    final materiCtrl = context.watch<MateriController>();

    final chapters = materiCtrl.searchResults;

    return Scaffold(
      backgroundColor: AppColors.backgroundClean,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          ModuleHeader(),

          const SizedBox(height: 5),
          const ModuleSearchBar(),

          Expanded(
            child: materiCtrl.isLoading
                ? const Center(child: CircularProgressIndicator())
                : chapters.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 70,
                          color: AppColors.darkGrey,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Materi tidak ditemukan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
                    physics: const BouncingScrollPhysics(),
                    itemCount: chapters.length,
                    itemBuilder: (context, index) {
                      final currentChapter = chapters[index];
                      final babNumber = currentChapter.bab;

                      return ChapterCard(
                        chapter: currentChapter,
                        index: index,
                        chapterList: chapters,
                        snippet: materiCtrl.getSnippet(currentChapter),
                        isBookmarked: modulCtrl.isLoggedIn
                            ? modulCtrl.bookmarkedBabs.contains(babNumber)
                            : false,
                        isLastRead: modulCtrl.lastReadBab == babNumber,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
