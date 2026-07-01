import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

  Future<List<Map<String, dynamic>>> fetchLearningModules() async {
    final localData = _materiBox.get('modul_waris');

    if (localData != null) {
      _syncMateriInBackground();

      return List<Map<String, dynamic>>.from(
        (localData as List).map((item) => Map<String, dynamic>.from(item)),
      );
    }

    try {
      return await _fetchAndSaveFromSupabase();
    } catch (e) {
      print('Error fetching learning modules: $e');
      return await _seedFromLocalAsset();
    }
  }

  Future<List<Map<String, dynamic>>> _fetchAndSaveFromSupabase() async {
    final response = await _supabase
        .from('learning_module')
        .select('bab, title, content_html')
        .order('bab', ascending: true);

    await _materiBox.put('modul_waris', response);

    return response;
  }

  Future<void> _syncMateriInBackground() async {
    try {
      final response = await _supabase
          .from('learning_module')
          .select('bab, title, content_html')
          .order('bab', ascending: true);

      await _materiBox.put('modul_waris', response);
    } catch (e) {
      //
    }
  }

  Future<List<Map<String, dynamic>>> _seedFromLocalAsset() async {
    List<Map<String, dynamic>> seededData = [];

    for (int i = 0; i < _judulBabLokal.length; i++) {
      int nomorBab = i + 1;
      try {
        final htmlContent = await rootBundle.loadString(
          'assets/materi/bab$nomorBab',
        );
        seededData.add({
          'bab': nomorBab,
          'title': _judulBabLokal[i],
          'content_html': htmlContent,
        });
      } catch (e) {
        print('Error loading local asset for bab $nomorBab: $e');
      }
    }

    if (seededData.isNotEmpty) {
      await _materiBox.put('modul_waris', seededData);
    }

    return seededData;
  }
}
