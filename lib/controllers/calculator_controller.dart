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
  late int totalWarisan = nIrst;
  late int sisaWarisan = totalWarisan;
  String muwarrits = '';
  List<Map<String, dynamic>> results = [];
  List<int> masalah = [];
  int hasilKPK = 0;
  int totalRatio = 0;
  int totalAshabah = 0;
  String kasus = '';
  int nilaiAyah = 0;
  int nilaiIbu = 0;
  int nilaiSuami = 0;
  int nilaiIstri = 0;
  int nilaiAnakLaki = 0;
  int nilaiAnakPerempuan = 0;
  int nilaiCucuLaki = 0;
  int nilaiCucuPerempuan = 0;
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
  int rAyah = 0;
  int rIbu = 0;
  int rSuami = 0;
  int rIstri = 0;
  int rAnakLaki = 0;
  int rAnakPerempuan = 0;
  int rCucuLaki = 0;
  int rCucuPerempuan = 0;
  int rKakek = 0;
  int rNenekAyah = 0;
  int rNenekIbu = 0;
  int rNenek2 = 0;
  int rSaudaraLakiKandung = 0;
  int rSaudaraPerempuanKandung = 0;
  int rSaudaraLakiSeayah = 0;
  int rSaudaraPerempuanSeayah = 0;
  int rSaudaraLakiSeibu = 0;
  int rSaudaraPerempuanSeibu = 0;
  int rSaudaraSeibu = 0;
  int rAnakLakiSaudaraKandung = 0;
  int rAnakLakiSaudaraSeayah = 0;
  int rPamanKandung = 0;
  int rPamanSekakek = 0;
  int rAnakLakiPamanKandung = 0;
  int rAnakLakiPamanSekakek = 0;

  int get keturunan =>
      nilaiAnakLaki + nilaiAnakPerempuan + nilaiCucuLaki + nilaiCucuPerempuan;
  int get keturunanLaki => nilaiAnakLaki + nilaiCucuLaki;
  int get keturunanPerempuan => nilaiAnakPerempuan + nilaiCucuPerempuan;
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
    nilaiAnakLaki = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateAnakPerempuan(int val) {
    nilaiAnakPerempuan = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateCucuLaki(int val) {
    nilaiCucuLaki = val;
    sinkronisasiHajb();
    notifyListeners();
  }

  void updateCucuPerempuan(int val) {
    nilaiCucuPerempuan = val;
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

  void resetData() {
    nTirkah = 0;
    nHutang = 0;
    nWasiat = 0;
    nTajhiz = 0;
    nIrst = 0;
    totalWarisan = 0;
    sisaWarisan = 0;
    muwarrits = '';
    results.clear();
    masalah.clear();
    hasilKPK = 0;
    totalRatio = 0;
    totalAshabah = 0;
    kasus = '';
    nilaiAyah = 0;
    nilaiIbu = 0;
    nilaiSuami = 0;
    nilaiIstri = 0;
    nilaiAnakLaki = 0;
    nilaiAnakPerempuan = 0;
    nilaiCucuLaki = 0;
    nilaiCucuPerempuan = 0;
    nilaiKakek = 0;
    nilaiNenekAyah = 0;
    nilaiNenekIbu = 0;
    nilaiSaudaraLakiKandung = 0;
    nilaiSaudaraPerempuanKandung = 0;
    nilaiSaudaraLakiSeayah = 0;
    nilaiSaudaraPerempuanSeayah = 0;
    nilaiSaudaraLakiSeibu = 0;
    nilaiSaudaraPerempuanSeibu = 0;
    nilaiAnakLakiSaudaraKandung = 0;
    nilaiAnakLakiSaudaraSeayah = 0;
    nilaiPamanKandung = 0;
    nilaiPamanSekakek = 0;
    nilaiAnakLakiPamanKandung = 0;
    nilaiAnakLakiPamanSekakek = 0;

    notifyListeners();
  }
}
