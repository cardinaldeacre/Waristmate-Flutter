part of 'main_calculator.dart';

extension CalculateRatio2 on CalculatorController {
  void calculateRatio2() {
    totalRatio = 0;

    if (nilaiAyah > 0) {
      rAyah = hasilKPK * 1 ~/ 6;
      totalRatio += rAyah;
    }

    if (nilaiIbu > 0) {
      if (keturunan > 0 || saudara > 1) {
        rIbu = hasilKPK * 1 ~/ 6;
        totalRatio += rIbu;
      } else {
        rIbu = hasilKPK * 1 ~/ 3;
        totalRatio += rIbu;
      }
    }

    if (nilaiKakek > 0) {
      rKakek = hasilKPK * 1 ~/ 6;
      totalRatio += rKakek;
    }

    if (nilaiNenekAyah > 0 && nilaiNenekIbu > 0) {
      rNenek2 = hasilKPK * 1 ~/ 6;
      totalRatio += rNenek2;
    } else {
      if (nilaiNenekAyah > 0 && nilaiNenekIbu == 0) {
        rNenekAyah = hasilKPK * 1 ~/ 6;
        totalRatio += rNenekAyah;
      }
      if (nilaiNenekIbu > 0 && nilaiNenekAyah == 0) {
        rNenekIbu = hasilKPK * 1 ~/ 6;
        totalRatio += rNenekIbu;
      }
    }

    if (nilaiAnakPerempuan > 0) {
      if (nilaiAnakPerempuan == 1) {
        rAnakPerempuan = hasilKPK * 1 ~/ 2;
        totalRatio += rAnakPerempuan;
      } else {
        rAnakPerempuan = hasilKPK * 2 ~/ 3;
        totalRatio += rAnakPerempuan;
      }
    }

    if (nilaiCucuPerempuan > 0) {
      if (nilaiAnakPerempuan == 1) {
        rCucuPerempuan = hasilKPK * 1 ~/ 6;
        totalRatio += rCucuPerempuan;
      } else if (nilaiCucuPerempuan == 1) {
        rCucuPerempuan = hasilKPK * 1 ~/ 2;
        totalRatio += rCucuPerempuan;
      } else {
        rCucuPerempuan = hasilKPK * 2 ~/ 3;
        totalRatio += rCucuPerempuan;
      }
    }

    if (nilaiSaudaraPerempuanKandung > 0) {
      if (nilaiSaudaraPerempuanKandung == 1) {
        rSaudaraPerempuanKandung = hasilKPK * 1 ~/ 2;
        totalRatio += rSaudaraPerempuanKandung;
      } else {
        rSaudaraPerempuanKandung = hasilKPK * 2 ~/ 3;
        totalRatio += rSaudaraPerempuanKandung;
      }
    }

    if (nilaiSaudaraPerempuanSeayah > 0) {
      if (nilaiSaudaraPerempuanSeayah == 1) {
        rSaudaraPerempuanSeayah = hasilKPK * 1 ~/ 2;
        totalRatio += rSaudaraPerempuanSeayah;
      } else {
        rSaudaraPerempuanSeayah = hasilKPK * 2 ~/ 3;
        totalRatio += rSaudaraPerempuanSeayah;
      }
    }

    if (saudaraSeibu > 0) {
      if (saudaraSeibu == 1) {
        rSaudaraSeibu = hasilKPK * 1 ~/ 6;
        totalRatio += rSaudaraSeibu;
      } else {
        rSaudaraSeibu = hasilKPK * 1 ~/ 3;
        totalRatio += rSaudaraSeibu;
      }
    }

    calculateRaddPasutri();
  }
}
