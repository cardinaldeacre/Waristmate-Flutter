import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:waristmate_app/controllers/hajb_controller.dart';
import 'package:waristmate_app/logic/main_calculator.dart';

class CalculatorController extends ChangeNotifier {
  int nTirkah = 0;
  int nHutang = 0;
  int nWasiat = 0;
  int nTajhiz = 0;
  int nIrst = 0;
  String muwarrits = '';
  int totalashobah = 0;
  List<dynamic> masalah = [];
  List<dynamic> results = [];
  String kasus = '';
  int nilaiAyah = 0;
  int nilaiIbu = 0;
  int nilaiSuami = 0;
  int nilaiIstri = 0;
  int nilaiAnaklaki = 0;
  int nilaiAnakPerempuan = 0;
  int nilaiCuculaki = 0;
  int nilaiCucuperempuan = 0;
  int nilaiKakek = 0;
  int nilaiNenekAyah = 0;
  int nilaiNenekIbu = 0;
  int nilaiSaudaraLakiKandung = 0;
  int nilaiSaudaraPerempuanKandung = 0;
  int nilaiSaudaraLakiSeayah = 0;
  int nilaiSaudaraPerempuanSeayah = 0;
  int nilaiSaudaraLakiSeibu = 0;
  int nilaiSaudaraPerempuanSeibu = 0;
  int nilaiAnakLakiSaudaraKandung = 0;
  int nilaiAnakLakiSaudaraSeayah = 0;
  int nilaiPamanKandung = 0;
  int nilaiPamanSekakek = 0;
  int nilaiAnakLakiPamanKandung = 0;
  int nilaiAnakLakiPamanSekakek = 0;

  int get keturunan =>
      nilaiAnaklaki + nilaiAnakPerempuan + nilaiCuculaki + nilaiCucuperempuan;
  int get keturunanLaki => nilaiAnaklaki + nilaiCuculaki;
  int get keturunanPerempuan => nilaiAnakPerempuan + nilaiCucuperempuan;
  int get nilaiNenek2 => nilaiNenekAyah + nilaiNenekIbu;
  int get saudara =>
      nilaiSaudaraLakiKandung +
      nilaiSaudaraPerempuanKandung +
      nilaiSaudaraLakiSeayah +
      nilaiSaudaraPerempuanSeayah +
      nilaiSaudaraLakiSeibu +
      nilaiSaudaraPerempuanSeibu;
  int get saudaraSeayah => nilaiSaudaraLakiSeayah + nilaiSaudaraPerempuanSeayah;
  int get saudaraSeibu => nilaiSaudaraLakiSeibu + nilaiSaudaraPerempuanSeibu;
  int get anakSaudara =>
      nilaiAnakLakiSaudaraKandung + nilaiAnakLakiSaudaraSeayah;
  int get paman => nilaiPamanKandung + nilaiPamanSekakek;
  int get anakPaman => nilaiAnakLakiPamanKandung + nilaiAnakLakiPamanSekakek;
  int get pojok => anakPaman + anakSaudara + paman;

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
      nilaiSuami = 0;
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
    nilaiAyah = val ? 1 : 0;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateIbu(bool val) {
    nilaiIbu = val ? 1 : 0;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateSuami(bool val) {
    nilaiSuami = val ? 1 : 0;
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
    nilaiKakek = val ? 1 : 0;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateNenekAyah(bool val) {
    nilaiNenekAyah = val ? 1 : 0;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateNenekIbu(bool val) {
    nilaiNenekIbu = val ? 1 : 0;
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

  void updateAnakLakiSaudaraKandung(int val) {
    nilaiAnakLakiSaudaraKandung = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateAnakLakiSaudaraSeayah(int val) {
    nilaiAnakLakiSaudaraSeayah = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updatePamanKandung(int val) {
    nilaiPamanKandung = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updatePamanSekakek(int val) {
    nilaiPamanSekakek = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateAnakLakiPamanKandung(int val) {
    nilaiAnakLakiPamanKandung = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateAnakLakiPamanSekakek(int val) {
    nilaiAnakLakiPamanSekakek = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void runEngine() {
    startCounting();

    notifyListeners();
  }
}
