import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:waristmate_app/logic/hajb_validator.dart';

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
  bool nilaiKakek = false;
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

  void updateMuwarrits(String val) {
    muwarrits = val;
    notifyListeners();
  }

  String get formattedIrst {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(nIrst);
  }

  // penghalang
  // kakek
  String? get penghalangKakek {
    return HajbValidator.penghalangKakek(adaAyah: nilaiAyah);
  }

  // nenek
  String? get penghalangNenek {
    return HajbValidator.penghalangNenek(adaIbu: nilaiIbu);
  }

  // cucu laki-laki
  String? get penghalangCucuLaki {
    return HajbValidator.penghalangCucuLaki(jmlAnakLaki: nilaiAnaklaki);
  }

  // cucu perempuan
  String? get penghalangCucuPerempuan {
    return HajbValidator.penghalangCucuPerempuan(
      jmlAnakLaki: nilaiAnaklaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
    );
  }

  // saudara kandung
  String? get penghalangSaudaraKandung {
    return HajbValidator.penghalangSaudaraKandung(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
    );
  }

  // saudari kandung
  String? get penghalangSaudaraPerempuan {
    return HajbValidator.penghalangSaudaraPerempuanKandung(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    );
  }

  // saudara seayah
  String? get penghalangSaudaraSeayah {
    return HajbValidator.penghalangSaudaraSeayah(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    );
  }

  // saudara seayah
  String? get penghalangSaudariSeayah {
    return HajbValidator.penghalangSaudaraSeayah(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    );
  }

  // saudara seibu
  String? get penghalangSaudaraSeibu {
    return HajbValidator.penghalangSaudaraSeibu(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    );
  }

  // anak laki saudara kandung
  String? get penghalangAnakLakiSaudaraKandung {
    return HajbValidator.penghalangAnakLakiSaudaraKandung(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
    );
  }

  // anak laki saudara seayah
  String? get penghalangAnakLakiSaudaraSeayah {
    return HajbValidator.penghalangAnakLakiSaudaraSeayah(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
    );
  }

  // paman sekandung
  String? get penghalangPamanSekandung {
    return HajbValidator.penghalangPamanSekandung(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
    );
  }

  // paman sekakek
  String? get penghalangPamanSekakek {
    return HajbValidator.penghalangPamanSekakek(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanSekandung: nilaiPamanKandungAyah,
    );
  }

  // anak laki paman sekandung
  String? get penghalangAnakLakiPamanSekandung {
    return HajbValidator.penghalangAnakLakiPamanKandung(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanSekandung: nilaiPamanKandungAyah,
      jmlPamanSekakek: nilaiPamanSekakekAyah,
    );
  }

  // anak laki paman sekakek
  String? get penghalangAnakLakiPamanSekakek {
    return HajbValidator.penghalangAnakLakiPamanSekakek(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanSekandung: nilaiPamanKandungAyah,
      jmlPamanSekakek: nilaiPamanSekakekAyah,
      jmlAnakLakiPamanSekandung: nilaiAnakLakiPamanKandung,
    );
  }
}
