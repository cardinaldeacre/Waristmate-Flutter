import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/modul/chapter_card.dart';
import 'package:waristmate_app/widgets/modul/module_header.dart';
import 'package:waristmate_app/services/modul/materi_service.dart';

class ModulScreen extends StatefulWidget {
  const ModulScreen({super.key});

  @override
  State<ModulScreen> createState() => _ModulScreenState();
}

class _ModulScreenState extends State<ModulScreen> {
  final MateriService materiService = MateriService();
  late final Future<List<Map<String, dynamic>>> _materiFuture;

  @override
  void initState() {
    super.initState();
    _materiFuture = materiService.fetchLearningModules();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClean,
      body: SafeArea(
        child: Column(
          children: [
            ModuleHeader(),

            const SizedBox(height: 5),

            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _materiFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  final chapters = snapshot.data ?? [];

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

                      return ChapterCard(
                        chapter: {
                          'bab': currentChapter['bab'].toString(),
                          'title': currentChapter['title'].toString(),
                          'content_html': currentChapter['content_html']
                              .toString(),
                        },
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
