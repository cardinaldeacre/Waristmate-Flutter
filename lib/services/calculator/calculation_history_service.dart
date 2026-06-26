import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/models/calculation_history.dart';

class CalculationHistoryService {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'calculation_history';

  final _calculationHistoryBox = Hive.box('calculationHistoryBox');

  Future<void> saveCalculation(CalculationHistoryModel history) async {
    try {
      await _calculationHistoryBox.add(history.toJson());
      await _supabase.from(_tableName).insert(history.toJson());
      print('Riwayat perhitungan berhasil disimpan ke Supabase dan Hive.');
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
      print('Supabase error/offline, mencoba narik dari Hive... ($e)');

      final localData = _calculationHistoryBox.get(userId);

      if (localData != null) {
        final List<dynamic> rawList = localData as List<dynamic>;

        return rawList
            .map(
              (json) => CalculationHistoryModel.fromJson(
                Map<String, dynamic>.from(json),
              ),
            )
            .toList();
      }

      throw Exception(
        'Gagal mengambil riwayat perhitungan. Pastikan ada koneksi internet untuk tarikan pertama.',
      );
    }
  }
}
