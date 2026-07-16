import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/models/calculation_history.dart';

class CalculationHistoryService {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'calculation_history';

  final _calculationHistoryBox = Hive.box('calculationHistoryBox');

  Future<void> saveCalculation(CalculationHistoryModel history) async {
    try {
      final userId = history.userId;

      final existingHistory = await _supabase
          .from(_tableName)
          .select('id')
          .eq('user_id', userId)
          .order('created_at', ascending: true);

      if (existingHistory.length >= 50) {
        final oldestId = existingHistory.first['id'];

        await _supabase.from(_tableName).delete().eq('id', oldestId);
      }

      await _supabase.from(_tableName).insert(history.toJson());

      final localData = _calculationHistoryBox.get(userId);
      List<dynamic> updatedList = [];

      if (localData != null) {
        updatedList = List<dynamic>.from(localData as List);
        updatedList.insert(0, history.toJson());

        if (updatedList.length > 50) {
          updatedList = updatedList.sublist(0, 50);
        }
      } else {
        updatedList = [history.toJson()];
      }

      await _calculationHistoryBox.put(userId, updatedList);

      debugPrint('Riwayat perhitungan berhasil disimpan ke Supabase dan Hive.');
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
      debugPrint('Supabase error/offline, mencoba narik dari Hive... ($e)');

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
