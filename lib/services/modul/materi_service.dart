import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:waristmate_app/core/utils/html_utils.dart';
import 'package:waristmate_app/models/learning_module.dart';

class MateriService {
  final _supabase = Supabase.instance.client;

  final _materiBox = Hive.box('materiBox');
  final List<String> _judulBabLokal = [
    "Pendahuluan Ilmu Waris",
    "Harta Waris",
    "Sebab - Sebab Warisan",
    "Pembagian Yang Ditentukan",
    "Ahli Waris : Ta'sib",
    "Ahli Waris : Hajb",
    "Tabel Waris",
    "Metode Pembagian",
    "Penyesuaian Al-'Aul",
    "Koreksi Masalah",
    "Penyesuaian Ar-Radd",
    "Permasalahan Pembagian",
  ];

  String _generateSearchText(String title, String html) {
    return HtmlUtils.cleanText('$title $html').toLowerCase().trim();
  }

  Future<List<LearningModule>> fetchLearningModules() async {
    final localData = _materiBox.get('modul_waris');

    if (localData != null) {
      _syncMateriInBackground();

      return (localData as List)
          .map(
            (item) => LearningModule.fromMap(Map<String, dynamic>.from(item)),
          )
          .toList();
    }

    try {
      return await _fetchAndSaveFromSupabase();
    } catch (e) {
      debugPrint('Error fetching learning modules: $e');
      final seededData = await _seedFromLocalAsset();
      return seededData;
    }
  }

  Future<List<LearningModule>> _fetchAndSaveFromSupabase() async {
    final response = await _supabase
        .from('learning_module')
        .select('bab, title, content_html')
        .order('bab', ascending: true);

    final modules = response.map<LearningModule>((item) {
      return LearningModule(
        bab: item['bab'],
        title: item['title'],
        contentHtml: item['content_html'],
        searchText: _generateSearchText(item['title'], item['content_html']),
      );
    }).toList();

    await _materiBox.put(
      'modul_waris',
      modules.map((module) => module.toMap()).toList(),
    );

    return modules;
  }

  Future<void> _syncMateriInBackground() async {
    try {
      final response = await _supabase
          .from('learning_module')
          .select('bab, title, content_html')
          .order('bab', ascending: true);

      final modules = response.map<LearningModule>((item) {
        return LearningModule(
          bab: item['bab'],
          title: item['title'],
          contentHtml: item['content_html'],
          searchText: _generateSearchText(item['title'], item['content_html']),
        );
      }).toList();

      await _materiBox.put(
        'modul_waris',
        modules.map((module) => module.toMap()).toList(),
      );
    } catch (e) {
      //
    }
  }

  Future<List<LearningModule>> _seedFromLocalAsset() async {
    List<LearningModule> seededData = [];

    for (int i = 0; i < _judulBabLokal.length; i++) {
      int nomorBab = i + 1;
      try {
        final htmlContent = await rootBundle.loadString(
          'assets/materi/bab$nomorBab',
        );
        seededData.add(
          LearningModule(
            bab: nomorBab,
            title: _judulBabLokal[i],
            contentHtml: htmlContent,
            searchText: _generateSearchText(_judulBabLokal[i], htmlContent),
          ),
        );
      } catch (e) {
        debugPrint('Error loading local asset for bab $nomorBab: $e');
      }
    }

    if (seededData.isNotEmpty) {
      await _materiBox.put(
        'modul_waris',
        seededData.map((item) => item.toMap()).toList(),
      );
    }

    return seededData;
  }
}
