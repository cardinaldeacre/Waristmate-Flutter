import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/models/calculation_history.dart';

class CalculationHistoryService {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'calculation_history';

  final _calculationHistoryBox = Hive.box('calculationHistoryBox');

  Future<void> saveCalculation(CalculationHistoryModel history) async {
    try {
      await _calculationHistoryBox.add(history);
      await _supabase.from(_tableName).insert(history.toJson());
    } catch (e) {
      throw Exception('Gagal menyimpan riwayat perhitungan: $e');
    }
  }

  Future<List<CalculationHistoryModel>> getCalculationHistory(
    String userId,
  ) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      await _calculationHistoryBox.put(userId, response);

      return (response as List<dynamic>)
          .map((json) => CalculationHistoryModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Gagal mengambil riwayat perhitungan: $e');
    }
  }

  Future<CalculationHistoryModel?> getCalculationById(int id) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('id', id)
          .maybeSingle();

      if (response != null) {
        return CalculationHistoryModel.fromJson(response);
      }
      return null;
    } catch (e) {
      throw Exception('Gagal mengambil perhitungan dengan ID $id: $e');
    }
  }
}
