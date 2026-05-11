import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:waristmate_app/controllers/hajb_controller.dart';

class CalculatorController extends ChangeNotifier {
  int nTirkah = 0;
  int nHutang = 0;
  int nWasiat = 0;
  int nTajhiz = 0;
  int nIrst = 0;
  String muwarrits = '';
  int totalashobah = 0;
  List<dynamic> masalah = [];
  bool nilaiAyah = false;
  bool nilaiIbu = false;
  bool nilaiSuami = false;
  int nilaiIstri = 0;
  int nilaiAnaklaki = 0;
  int nilaiAnakPerempuan = 0;
  int nilaiCuculaki = 0;
  int nilaiCucuperempuan = 0;
  bool nilaiKakek = false;
  bool nilaiNenekAyah = false;
  bool nilaiNenekIbu = false;
  int nilaiSaudaraLakiKandung = 0;
  int nilaiSaudaraPerempuanKandung = 0;
  int nilaiSaudaraLakiSeayah = 0;
  int nilaiSaudaraPerempuanSeayah = 0;
  int nilaiSaudaraLakiSeibu = 0;
  int nilaiSaudaraPerempuanSeibu = 0;
  int nilaiAnakLakiSaudaraKandung = 0;
  int nilaiAnakLakiSaudaraSeayah = 0;
  int nilaiPamanKandungAyah = 0;
  int nilaiPamanSekakekAyah = 0;
  int nilaiAnakLakiPamanKandung = 0;
  int nilaiAnakLakiPamanSekakek = 0;

  void calculateIrts() {
    nIrst = nTirkah - nHutang - nWasiat - nTajhiz;
    // info UI udah update data
    notifyListeners();
  }

  // setter
  void updateTirkah(int val) {
    nTirkah = val;
    calculateIrts();
  }

  void updateHutang(int val) {
    nHutang = val;
    calculateIrts();
  }

  void updateTajhiz(int val) {
    nTajhiz = val;
    calculateIrts();
  }

  String? updateWasiat(int val) {
    nWasiat = val;

    int sisaHarta = nTirkah - nHutang - nTajhiz;
    int maxWasiat = sisaHarta > 0 ? sisaHarta ~/ 3 : 0;

    String? notip;

    if (nWasiat > maxWasiat) {
      nWasiat = maxWasiat;

      notip =
          "Wasiat tidak boleh lebih dari 1/3 sisa harta (${formatRupiah(nWasiat)}).";
    }
    calculateIrts();
    return notip;
  }

  void updateMuwarrits(String val) {
    muwarrits = val;
    notifyListeners();

    if (muwarrits == 'Perempuan') {
      nilaiIstri = 0;
      notifyListeners();
    }

    if (muwarrits == 'Laki-laki') {
      nilaiSuami = false;
      notifyListeners();
    }
  }

  String formatRupiah(int angka) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(angka);
  }

  void updateAyah(bool val) {
    nilaiAyah = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateIbu(bool val) {
    nilaiIbu = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateSuami(bool val) {
    nilaiSuami = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateIstri(int val) {
    nilaiIstri = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateAnakLaki(int val) {
    nilaiAnaklaki = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateAnakPerempuan(int val) {
    nilaiAnakPerempuan = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateCucuLaki(int val) {
    nilaiCuculaki = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateCucuPerempuan(int val) {
    nilaiCucuperempuan = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateKakek(bool val) {
    nilaiKakek = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateNenekAyah(bool val) {
    nilaiNenekAyah = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateNenekIbu(bool val) {
    nilaiNenekIbu = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateSaudaraLakiKandung(int val) {
    nilaiSaudaraLakiKandung = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateSaudaraPerempuanKandung(int val) {
    nilaiSaudaraPerempuanKandung = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateSaudaraLakiSeayah(int val) {
    nilaiSaudaraLakiSeayah = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateSaudaraPerempuanSeayah(int val) {
    nilaiSaudaraPerempuanSeayah = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateSaudaraLakiSeibu(int val) {
    nilaiSaudaraLakiSeibu = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateSaudaraPerempuanSeibu(int val) {
    nilaiSaudaraPerempuanSeibu = val;
    sinkronisasiHajb();
    notifyListeners();
  }
}
