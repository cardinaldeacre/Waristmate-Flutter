part of 'main_calculator.dart';

extension CalculateRatio2 on CalculatorController {
  void calculateRatio2() {
    totalRatio = 0;

    debugPrint("calculate ratio 2");
    debugPrint("hasilKPK: $hasilKPK");

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
      if (nilaiAnakPerempuan > 1 && nilaiAnakLaki == 0) {
        rAnakPerempuan = hasilKPK * 2 ~/ 3;
        totalRatio += rAnakPerempuan;
      } else if (nilaiAnakPerempuan == 1 && nilaiAnakLaki == 0) {
        rAnakPerempuan = hasilKPK * 1 ~/ 2;
        totalRatio += rAnakPerempuan;
      }
    }

    if (nilaiCucuPerempuan > 0) {
      if (nilaiAnakPerempuan == 1 && nilaiCucuLaki == 0) {
        rCucuPerempuan = hasilKPK * 1 ~/ 6;
        totalRatio += rCucuPerempuan;
      } else if (nilaiCucuPerempuan == 1 && nilaiCucuLaki == 0) {
        rCucuPerempuan = hasilKPK * 1 ~/ 2;
        totalRatio += rCucuPerempuan;
      } else if (nilaiCucuPerempuan > 1 && nilaiCucuLaki == 0) {
        rCucuPerempuan = hasilKPK * 2 ~/ 3;
        totalRatio += rCucuPerempuan;
      }
    }

    if (nilaiSaudaraPerempuanKandung > 0) {
      if (nilaiSaudaraPerempuanKandung == 1 &&
          nilaiAnakPerempuan == 0 &&
          nilaiCucuPerempuan == 0 &&
          nilaiSaudaraLakiKandung == 0) {
        rSaudaraPerempuanKandung = hasilKPK * 1 ~/ 2;
        totalRatio += rSaudaraPerempuanKandung;
      } else if (nilaiSaudaraPerempuanKandung > 1 &&
          nilaiAnakPerempuan == 0 &&
          nilaiCucuPerempuan == 0 &&
          nilaiSaudaraLakiKandung == 0) {
        rSaudaraPerempuanKandung = hasilKPK * 2 ~/ 3;
        totalRatio += rSaudaraPerempuanKandung;
      }
    }

    if (nilaiSaudaraPerempuanSeayah > 0) {
      if (nilaiSaudaraPerempuanSeayah == 1 &&
          nilaiAnakPerempuan == 0 &&
          nilaiCucuPerempuan == 0 &&
          nilaiSaudaraLakiSeayah == 0) {
        rSaudaraPerempuanSeayah = hasilKPK * 1 ~/ 2;
        totalRatio += rSaudaraPerempuanSeayah;
      } else if (nilaiSaudaraPerempuanSeayah > 1 &&
          nilaiAnakPerempuan == 0 &&
          nilaiCucuPerempuan == 0 &&
          nilaiSaudaraLakiSeayah == 0) {
        rSaudaraPerempuanSeayah = hasilKPK * 2 ~/ 3;
        totalRatio += rSaudaraPerempuanSeayah;
      } else if (nilaiSaudaraPerempuanKandung == 1 &&
          nilaiAnakPerempuan == 0 &&
          nilaiCucuPerempuan == 0 &&
          nilaiSaudaraLakiSeayah == 0) {
        rSaudaraPerempuanSeayah = hasilKPK * 1 ~/ 6;
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
