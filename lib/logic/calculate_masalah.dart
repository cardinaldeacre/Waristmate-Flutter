part of 'main_calculator.dart';

extension CalculateMasalah on CalculatorController {
  void calculateMasalah() {
    masalah.clear();

    if (nilaiSuami > 0) {
      if (keturunan > 0) {
        masalah.add(4);
      } else {
        masalah.add(2);
      }
    }

    if (nilaiIstri > 0) {
      if (keturunan > 0) {
        masalah.add(8);
      } else {
        masalah.add(4);
      }
    }

    if (nilaiAyah > 0) {
      if (nilaiAnakLaki > 0 || nilaiCucuLaki > 0) {
        masalah.add(6);
      } else if (keturunanPerempuan > 0) {
        totalAshabah = totalAshabah + 2;
        masalah.add(6);
      } else {
        totalAshabah = totalAshabah + 2;
      }
    }

    if (nilaiIbu > 0) {
      if (keturunan > 0 || saudara > 1) {
        masalah.add(6);
      } else {
        masalah.add(3);
      }
    }

    if (nilaiKakek > 0) {
      if (keturunanLaki > 0) {
        masalah.add(6);
      } else if (keturunanPerempuan > 0) {
        totalAshabah = totalAshabah + 2;
        masalah.add(6);
      } else {
        totalAshabah = totalAshabah + 2;
      }
    }

    if (nilaiNenekAyah > 0 && nilaiNenekIbu > 0) {
      masalah.add(12);
    } else {
      if (nilaiNenekAyah > 0 && nilaiNenekIbu == 0) {
        masalah.add(6);
      }
      if (nilaiNenekIbu > 0 && nilaiNenekAyah == 0) {
        masalah.add(6);
      }
    }

    if (nilaiAnakLaki > 0) {
      totalAshabah = totalAshabah + 2 * nilaiAnakLaki;
    }

    if (nilaiAnakPerempuan > 0) {
      if (nilaiAnakLaki > 0) {
        totalAshabah = totalAshabah + nilaiAnakPerempuan;
      } else if (nilaiAnakPerempuan > 1 && nilaiAnakLaki == 0) {
        masalah.add(3);
      } else if (nilaiAnakPerempuan == 1 && nilaiAnakLaki == 0) {
        masalah.add(2);
      }
    }

    if (nilaiCucuLaki > 0) {
      totalAshabah = totalAshabah + 2 * nilaiCucuLaki;
    }

    if (nilaiCucuPerempuan > 0) {
      if (nilaiAnakPerempuan > 0) {
        masalah.add(6);
      } else if (nilaiCucuLaki > 0) {
        totalAshabah = totalAshabah + nilaiCucuPerempuan;
      } else if (nilaiCucuPerempuan == 1) {
        masalah.add(2);
      } else if (nilaiCucuPerempuan > 1) {
        masalah.add(3);
      }
    }

    if (nilaiSaudaraLakiKandung > 0) {
      totalAshabah = totalAshabah + 2 * nilaiSaudaraLakiKandung;
    }

    if (nilaiSaudaraPerempuanKandung > 0) {
      if (nilaiSaudaraLakiKandung > 0 ||
          nilaiAnakPerempuan > 0 ||
          nilaiCucuPerempuan > 0) {
        totalAshabah = totalAshabah + nilaiSaudaraPerempuanKandung;
      } else if (nilaiSaudaraPerempuanKandung == 1) {
        masalah.add(2);
      } else if (nilaiSaudaraPerempuanKandung > 1) {
        masalah.add(3);
      }
    }

    if (nilaiSaudaraLakiSeayah > 0) {
      totalAshabah = totalAshabah + 2 * nilaiSaudaraLakiSeayah;
    }

    if (nilaiSaudaraPerempuanSeayah > 0) {
      if (nilaiAnakPerempuan > 0 ||
          nilaiCucuPerempuan > 0 ||
          nilaiSaudaraLakiSeayah > 0) {
        totalAshabah = totalAshabah + nilaiSaudaraPerempuanSeayah;
      } else if (nilaiSaudaraPerempuanSeayah == 0) {
        masalah.add(2);
      } else if (nilaiSaudaraPerempuanSeayah > 1) {
        masalah.add(3);
      }
    }

    if (nilaiSaudaraLakiSeibu > 0) {
      if (nilaiSaudaraLakiSeibu == 1 && nilaiSaudaraPerempuanSeibu == 0) {
        masalah.add(6);
      } else if (nilaiSaudaraLakiSeibu > 1 || nilaiSaudaraPerempuanSeibu > 0) {
        masalah.add(3);
      }
    }

    if (nilaiSaudaraPerempuanSeibu > 0) {
      if (nilaiSaudaraPerempuanSeibu == 1 && nilaiSaudaraLakiSeibu == 0) {
        masalah.add(6);
      } else if (nilaiSaudaraPerempuanSeibu > 1 || nilaiSaudaraLakiSeibu > 0) {
        masalah.add(3);
      }
    }

    if (nilaiAnakLakiSaudaraKandung > 0) {
      totalAshabah = totalAshabah + 2 * nilaiAnakLakiSaudaraKandung;
    }

    if (nilaiAnakLakiSaudaraSeayah > 0) {
      totalAshabah = totalAshabah + 2 * nilaiAnakLakiSaudaraSeayah;
    }

    if (nilaiPamanKandung > 0) {
      totalAshabah = totalAshabah + 2 * nilaiPamanKandung;
    }

    if (nilaiPamanSekakek > 0) {
      totalAshabah = totalAshabah + 2 * nilaiPamanSekakek;
    }

    if (nilaiAnakLakiPamanKandung > 0) {
      totalAshabah = totalAshabah + 2 * nilaiAnakLakiPamanKandung;
    }

    if (nilaiAnakLakiPamanSekakek > 0) {
      totalAshabah = totalAshabah + 2 * nilaiAnakLakiPamanSekakek;
    }

    if (masalah.isNotEmpty) {
      calculateKPK();
      calculateRatio();
    } else {
      calculateAshabah();
    }
  }
}
