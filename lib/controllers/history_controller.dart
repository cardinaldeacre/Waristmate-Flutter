import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';
import 'package:waristmate_app/models/calculation_history.dart';
import 'package:waristmate_app/services/calculator/calculation_history_service.dart';

class HistoryController extends ChangeNotifier {
  final CalculationHistoryService _service = CalculationHistoryService();
  final CalculatorController _calc = CalculatorController();

  List<CalculationHistoryModel> histories = [];
  bool isLoading = false;

  int currentPage = 1;
  int totalPages = 1;
  int limitPerPage = 10;
  bool isAsc = false;

  Future<void> saveCalculationHistory(String userId) async {
    final history = CalculationHistoryModel(
      userId: userId,
      hartaKotor: _calc.nTirkah,
      pengurusan: _calc.nTajhiz,
      hutang: _calc.nHutang,
      wasiat: _calc.nWasiat,
      hartaBersih: _calc.nIrst,
      results: _calc.results,
      penghalang: _calc.penghalang,
    );

    try {
      await CalculationHistoryService().saveCalculation(history);
    } catch (e) {
      throw Exception('Gagal menyimpan riwayat perhitungan: $e');
    }
  }

  Future<void> fetchCalculationHistory() async {
    isLoading = true;
    notifyListeners();

    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) return;

      final totalData = await _service.getTotalHistoryCount(user.id);
      totalPages = (totalData / limitPerPage).ceil();
      if (totalPages == 0) totalPages = 1;

      histories = await _service.getCalculationHistory(
        userId: user.id,
        page: currentPage,
        limitPerPage: limitPerPage,
        isAsc: isAsc,
      );
    } catch (e) {
      throw Exception('Gagal mengambil riwayat perhitungan: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void changePage(int page) {
    if (page < 1 || page > totalPages) return;
    currentPage = page;
    fetchCalculationHistory();
  }

  void toggleSortOrder() {
    isAsc = !isAsc;
    currentPage = 1;
    fetchCalculationHistory();
  }
}
