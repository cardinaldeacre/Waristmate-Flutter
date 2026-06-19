import 'package:supabase_flutter/supabase_flutter.dart';

class MateriService {
  final _supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetchLearningModules() async {
    try {
      final response = await _supabase
          .from('learning_module')
          .select('*')
          .order('bab', ascending: true);
      print(response);
      return response;
    } catch (e) {
      print(e);
      throw Exception('Wait mas: $e');
    }
  }
}
