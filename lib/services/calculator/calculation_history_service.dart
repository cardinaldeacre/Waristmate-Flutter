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

  Future<List<CalculationHistoryModel>> getCalculationHistory({
    required String userId,
    int page = 1,
    int limitPerPage = 10,
    bool isAsc = false,
  }) async {
    List<dynamic> historyList = [];

    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: isAsc);

      await _calculationHistoryBox.put(userId, response);

      historyList = List<dynamic>.from(response);
    } catch (e) {
      debugPrint('Supabase error/offline, mencoba narik dari Hive... ($e)');

      final localData = _calculationHistoryBox.get(userId);

      if (localData != null) {
        historyList = List<dynamic>.from(localData as List);
      } else {
        throw Exception(
          'Gagal mengambil riwayat perhitungan. Pastikan ada koneksi internet untuk tarikan pertama.',
        );
      }
    }

    if (isAsc) {
      historyList = historyList.reversed.toList();
    }

    final from = (page - 1) * limitPerPage;
    int to = from + limitPerPage;

    if (from >= historyList.length) {
      return [];
    }

    if (to > historyList.length) {
      to = historyList.length;
    }

    final pagedList = historyList.sublist(from, to);

    return pagedList
        .map(
          (json) =>
              CalculationHistoryModel.fromJson(Map<String, dynamic>.from(json)),
        )
        .toList();
  }

  Future<int> getTotalHistoryCount(String userId) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .count(CountOption.exact)
          .eq('user_id', userId);

      return response;
    } catch (e) {
      final localData = _calculationHistoryBox.get(userId);
      if (localData != null) {
        return (localData as List).length;
      }

      return 0;
    }
  }
}
