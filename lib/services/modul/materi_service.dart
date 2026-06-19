import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MateriService {
  final _supabase = Supabase.instance.client;

  final _materiBox = Hive.box('materiBox');

  Future<List<Map<String, dynamic>>> fetchLearningModules() async {
    final localData = _materiBox.get('modul_waris');

    if (localData != null) {
      _syncMateriInBackground();

      return List<Map<String, dynamic>>.from(
        (localData as List).map((item) => Map<String, dynamic>.from(item)),
      );
    }

    return await _fetchAndSaveFromSupabase();
  }

  Future<List<Map<String, dynamic>>> _fetchAndSaveFromSupabase() async {
    try {
      final response = await _supabase
          .from('learning_module')
          .select('bab, title, content_html')
          .order('bab', ascending: true);
      await _materiBox.put('modul_waris', response);

      return response;
    } catch (e) {
      throw Exception('Failed to fetch learning modules: $e');
    }
  }

  Future<void> _syncMateriInBackground() async {
    try {
      final response = await _supabase
          .from('learning_module')
          .select('bab, title, content_html')
          .order('bab', ascending: true);

      await _materiBox.put('modul_waris', response);
    } catch (e) {
      // Handle background sync errors silently
    }
  }
}
