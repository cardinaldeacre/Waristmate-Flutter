import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalculatorController extends ChangeNotifier {
  double nTirkah = 0;
  double nHutang = 0;
  double nWasiat = 0;
  double nTajhiz = 0;
  double nIrst = 0;
  String muwarrits = '';
  double totalashobah = 0;
  List<dynamic> masalah = [];
  bool nilaiAyah = false;
  bool nilaiIbu = false;
  bool nilaiSuami = false;
  int nilaiIstri = 0;
  int nilaiAnaklaki = 0;
  int nilaiAnakPerempuan = 0;
  int nilaiCuculaki = 0;
  int nilaiCucuperempuan = 0;
  int nilaiKakek = 0;
  int nilaiNenekAyah = 0;
  int nilaiNenekIbu = 0;
  int nilaiSaudaraLakiKKandung = 0;
  int nilaiSaudaraPerempuanKandung = 0;
  int nilaiSaudaraLakiSeayah = 0;
  int nilaiSaudaraPerempuanSeayah = 0;
  int nilaiSaudaraLakiSeibu = 0;
  int nilaiSaudaraperempuanseIbu = 0;
  int nilaiAnakLakiSaudaraKandung = 0;
  int nilaiAnakLakiSaudaraSeayah = 0;
  int nilaiPamanKandungAyah = 0;
  int nilaiPamanSekakekAyah = 0;
  int nilaiAnakLakiPamanKandung = 0;
  int nilaiAnakLakiPamanSekakek = 0;

  void calculateIrts() {
    double sisaHarta = nTirkah - nHutang - nTajhiz;
    double maxWasiat = sisaHarta / 3;

    if (nWasiat > maxWasiat) {
      nWasiat = maxWasiat;
      // snackbar maksmal 1/3
    }

    nIrst = nTirkah - nHutang - nWasiat - nTajhiz;
    // info UI udah update data
    notifyListeners();
  }

  // setter
  void updateTirkah(double val) {
    nTirkah = val;
    calculateIrts();
  }

  void updateHutang(double val) {
    nHutang = val;
    calculateIrts();
  }

  void updateTajhiz(double val) {
    nTajhiz = val;
    calculateIrts();
  }

  void updateWasiat(double val) {
    nWasiat = val;
    calculateIrts();
  }

  String get formattedIrst {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(nIrst);
  }
}
