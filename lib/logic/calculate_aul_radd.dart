part of 'main_calculator.dart';

extension CalculateAulRadd on CalculatorController {
  void calculateAulRadd() {
    if (totalAshobah > 0 && totalRatio <= hasilKPK) {
      calculateAshabah();
    } else if (totalRatio > hasilKPK) {
      // aul
      hasilKPK = totalRatio;
      kasus = 'Aul';

      if (nilaiSuami > 0) {
        int bagianSuami = totalWarisan * rSuami ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Suami',
          'porsi': '$rSuami / $hasilKPK',
          'nominal': bagianSuami,
        });
      }

      if (nilaiIstri > 0) {
        int bagianIstri = totalWarisan * rIstri ~/ hasilKPK ~/ nilaiIstri;
        results.add({
          'ahli_waris': 'Istri',
          'porsi': '$rIstri / $hasilKPK',
          'nominal': bagianIstri,
        });
      }

      if (nilaiAyah > 0) {
        int bagianAyah = totalWarisan * rAyah ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Ayah',
          'porsi': '$rAyah / $hasilKPK',
          'nominal': bagianAyah,
        });
      }

      if (nilaiIbu > 0) {
        int bagianIbu = totalWarisan * rIbu ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Ibu',
          'porsi': '$rIbu / $hasilKPK',
          'nominal': bagianIbu,
        });
      }

      if (nilaiKakek > 0) {
        int bagianKakek = totalWarisan * rKakek ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Kakek',
          'porsi': '$rKakek / $hasilKPK',
          'nominal': bagianKakek,
        });
      }

      if (nilaiNenekAyah > 0 && nilaiNenekIbu > 0) {
        int bagianNenek2 = totalWarisan * rNenek2 ~/ hasilKPK ~/ nilaiNenek2;
        results.add({
          'ahli_waris': 'Nenek Ayah',
          'porsi': '$rNenek2 / $hasilKPK Bersama',
          'nominal': bagianNenek2,
        });
        results.add({
          'ahli_waris': 'Nenek Ibu',
          'porsi': '$rNenek2 / $hasilKPK Bersama',
          'nominal': bagianNenek2,
        });
      } else if (nilaiNenekAyah > 0 && nilaiNenekIbu == 0) {
        int bagianNenekAyah = totalWarisan * rNenekAyah ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Nenek Ayah',
          'porsi': '$rNenekAyah / $hasilKPK',
          'nominal': bagianNenekAyah,
        });
      } else if (nilaiNenekIbu > 0 && nilaiNenekAyah == 0) {
        int bagianNenekIbu = totalWarisan * rNenekIbu ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Nenek Ibu',
          'porsi': '$rNenekIbu / $hasilKPK',
          'nominal': bagianNenekIbu,
        });
      }

      if (nilaiAnakPerempuan > 0) {
        int bagianAnakPerempuan =
            totalWarisan * rAnakPerempuan ~/ hasilKPK ~/ nilaiAnakPerempuan;
        results.add({
          'ahli_waris': 'Anak Perempuan',
          'porsi': '$rAnakPerempuan / $hasilKPK',
          'nominal': bagianAnakPerempuan,
        });
      }

      if (nilaiCucuPerempuan > 0) {
        int bagianCucuPerempuan =
            totalWarisan * rCucuPerempuan ~/ hasilKPK ~/ nilaiCucuPerempuan;
        results.add({
          'ahli_waris': 'Cucu Perempuan',
          'porsi': '$rCucuPerempuan / $hasilKPK',
          'nominal': bagianCucuPerempuan,
        });
      }

      if (nilaiSaudaraPerempuanKandung > 0) {
        int bagianSaudaraPerempuanKandung =
            totalWarisan *
            rSaudaraPerempuanKandung ~/
            hasilKPK ~/
            nilaiSaudaraPerempuanKandung;
        results.add({
          'ahli_waris': 'Saudara Perempuan Kandung',
          'porsi': '$rSaudaraPerempuanKandung / $hasilKPK',
          'nominal': bagianSaudaraPerempuanKandung,
        });
      }

      if (nilaiSaudaraPerempuanSeayah > 0) {
        int bagianSaudaraPerempuanSeayah =
            totalWarisan *
            rSaudaraPerempuanSeayah ~/
            hasilKPK ~/
            nilaiSaudaraPerempuanSeayah;
        results.add({
          'ahli_waris': 'Saudara Perempuan Seayah',
          'porsi': '$rSaudaraPerempuanSeayah / $hasilKPK',
          'nominal': bagianSaudaraPerempuanSeayah,
        });
      }

      if (saudaraSeibu > 0) {
        if (nilaiSaudaraLakiSeibu > 0 && nilaiSaudaraPerempuanSeibu > 0) {
          int bagianSaudaraSeibu =
              totalWarisan * rSaudaraSeibu ~/ hasilKPK ~/ saudaraSeibu;
          results.add({
            'ahli_waris': 'Saudara Laki-Laki Seibu',
            'porsi': '$rSaudaraSeibu / $hasilKPK Bersama',
            'nominal': bagianSaudaraSeibu,
          });
          results.add({
            'ahli_waris': 'Saudara Perempuan Seibu',
            'porsi': '$rSaudaraSeibu / $hasilKPK Bersama',
            'nominal': bagianSaudaraSeibu,
          });
        } else if (nilaiSaudaraLakiSeibu == 1) {
          int bagianSaudaraLakiSeibu =
              totalWarisan * rSaudaraLakiSeibu ~/ hasilKPK;
          results.add({
            'ahli_waris': 'Saudara Laki-Laki Seibu',
            'porsi': '$rSaudaraLakiSeibu / $hasilKPK',
            'nominal': bagianSaudaraLakiSeibu,
          });
        } else if (nilaiSaudaraPerempuanSeibu == 1) {
          int bagianSaudaraPerempuanSeibu =
              totalWarisan * rSaudaraPerempuanSeibu ~/ hasilKPK;
          results.add({
            'ahli_waris': 'Saudara Perempuan Seibu',
            'porsi': '$rSaudaraPerempuanSeibu / $hasilKPK',
            'nominal': bagianSaudaraPerempuanSeibu,
          });
        } else if (nilaiSaudaraLakiSeibu > 1) {
          int bagianSaudaraLakiSeibu =
              totalWarisan *
              rSaudaraLakiSeibu ~/
              hasilKPK ~/
              nilaiSaudaraLakiSeibu;
          results.add({
            'ahli_waris': 'Saudara Laki-Laki Seibu',
            'porsi': '$rSaudaraLakiSeibu / $hasilKPK',
            'nominal': bagianSaudaraLakiSeibu,
          });
        }
      }
    } else if (totalRatio < hasilKPK && (nilaiSuami > 0 || nilaiIstri > 0)) {
      // radd pasutri
      kasus = 'Radd';
      if (nilaiSuami > 0 &&
          (nilaiAyah > 0 ||
              nilaiIbu > 0 ||
              keturunan > 0 ||
              saudara > 0 ||
              nilaiNenek2 > 0)) {
        if (keturunan > 0) {
          masalah.removeWhere((item) => item == 4);
          calculateKPK();
          int bagianSuami = totalWarisan * 1 ~/ 4;
          results.add({
            'ahli_waris': 'Suami',
            'porsi': '1/4 total',
            'nominal': bagianSuami,
          });
          sisaWarisan -= bagianSuami;
        } else {
          masalah.removeWhere((item) => item == 2);
          calculateKPK();
          int bagianSuami = totalWarisan * 1 ~/ 2;
          results.add({
            'ahli_waris': 'Suami',
            'porsi': '1/2 total',
            'nominal': bagianSuami,
          });
          sisaWarisan -= bagianSuami;
        }
      } else {
        int bagianSuami = totalWarisan * 1;
        results.add({
          'ahli_waris': 'Suami',
          'porsi': '1/1',
          'nominal': bagianSuami,
        });
      }

      if (nilaiIstri > 0 &&
          (nilaiAyah > 0 ||
              nilaiIbu > 0 ||
              keturunan > 0 ||
              saudara > 0 ||
              nilaiNenek2 > 0)) {
        if (keturunan > 0) {
          masalah.removeWhere((item) => item == 8);
          calculateKPK();
          int bagianIstri = totalWarisan * 1 ~/ 8 ~/ nilaiIstri;
          results.add({
            'ahli_waris': 'Istri',
            'porsi': '1/8 total',
            'nominal': bagianIstri,
          });
          sisaWarisan -= bagianIstri;
        } else {
          masalah.removeWhere((item) => item == 4);
          calculateKPK();
          int bagianIstri = totalWarisan * 1 ~/ 4 ~/ nilaiIstri;
          results.add({
            'ahli_waris': 'Istri',
            'porsi': '1/4 total',
            'nominal': bagianIstri,
          });
          sisaWarisan -= bagianIstri;
        }
      } else {
        int bagianIstri = totalWarisan * 1 ~/ nilaiIstri;
        results.add({
          'ahli_waris': 'Istri',
          'porsi': '1/1',
          'nominal': bagianIstri,
        });
      }
    } else if (totalRatio < hasilKPK && (nilaiSuami == 0 && nilaiIstri == 0)) {
      // radd biasa
      hasilKPK = totalRatio;
      kasus = 'Radd';

      if (nilaiAyah > 0) {
        if (nilaiAnakLaki > 0 || nilaiCucuLaki > 0) {
          int bagianAyah = totalWarisan * rAyah ~/ hasilKPK;
          results.add({
            'ahli_waris': 'Ayah',
            'porsi': '$rAyah / $hasilKPK',
            'nominal': bagianAyah,
          });
        }
      }

      if (nilaiIbu > 0) {
        int bagianIbu = totalWarisan * rIbu ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Ibu',
          'porsi': '$rIbu / $hasilKPK',
          'nominal': bagianIbu,
        });
      }
    }

    if (nilaiKakek > 0) {
      if (keturunanLaki > 0) {
        int bagianKakek = totalWarisan * rKakek ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Kakek',
          'porsi': '$rKakek / $hasilKPK',
          'nominal': bagianKakek,
        });
      }
    }

    if (nilaiNenekAyah > 0 && nilaiNenekIbu > 0) {
      int bagianNenek2 = totalWarisan * rNenek2 ~/ hasilKPK ~/ nilaiNenek2;
      results.add({
        'ahli_waris': 'Nenek Ayah',
        'porsi': '$rNenek2 / $hasilKPK Bersama',
        'nominal': bagianNenek2,
      });
      results.add({
        'ahli_waris': 'Nenek Ibu',
        'porsi': '$rNenek2 / $hasilKPK Bersama',
        'nominal': bagianNenek2,
      });
    } else if (nilaiNenekAyah > 0 && nilaiNenekIbu == 0) {
      int bagianNenekAyah = totalWarisan * rNenekAyah ~/ hasilKPK;
      results.add({
        'ahli_waris': 'Nenek Ayah',
        'porsi': '$rNenekAyah / $hasilKPK',
        'nominal': bagianNenekAyah,
      });
    } else if (nilaiNenekIbu > 0 && nilaiNenekAyah == 0) {
      int bagianNenekIbu = totalWarisan * rNenekIbu ~/ hasilKPK;
      results.add({
        'ahli_waris': 'Nenek Ibu',
        'porsi': '$rNenekIbu / $hasilKPK',
        'nominal': bagianNenekIbu,
      });
    }

    if (nilaiAnakPerempuan > 0) {
      int bagianAnakPerempuan =
          totalWarisan * rAnakPerempuan ~/ hasilKPK ~/ nilaiAnakPerempuan;
      results.add({
        'ahli_waris': 'Anak Perempuan',
        'porsi': '$rAnakPerempuan / $hasilKPK',
        'nominal': bagianAnakPerempuan,
      });
    }

    if (nilaiCucuPerempuan > 0) {
      int bagianCucuPerempuan =
          totalWarisan * rCucuPerempuan ~/ hasilKPK ~/ nilaiCucuPerempuan;
      results.add({
        'ahli_waris': 'Cucu Perempuan',
        'porsi': '$rCucuPerempuan / $hasilKPK',
        'nominal': bagianCucuPerempuan,
      });
    }

    if (nilaiSaudaraPerempuanKandung > 0) {
      int bagianSaudaraPerempuanKandung =
          totalWarisan *
          rSaudaraPerempuanKandung ~/
          hasilKPK ~/
          nilaiSaudaraPerempuanKandung;
      results.add({
        'ahli_waris': 'Saudara Perempuan Kandung',
        'porsi': '$rSaudaraPerempuanKandung / $hasilKPK',
        'nominal': bagianSaudaraPerempuanKandung,
      });
    }

    if (nilaiSaudaraPerempuanSeayah > 0) {
      int bagianSaudaraPerempuanSeayah =
          totalWarisan *
          rSaudaraPerempuanSeayah ~/
          hasilKPK ~/
          nilaiSaudaraPerempuanSeayah;
      results.add({
        'ahli_waris': 'Saudara Perempuan Seayah',
        'porsi': '$rSaudaraPerempuanSeayah / $hasilKPK',
        'nominal': bagianSaudaraPerempuanSeayah,
      });
    }

    if (saudaraSeibu > 0) {
      if (nilaiSaudaraLakiSeibu > 0 && nilaiSaudaraPerempuanSeibu > 0) {
        int bagianSaudaraSeibu =
            totalWarisan * rSaudaraSeibu ~/ hasilKPK ~/ saudaraSeibu;
        results.add({
          'ahli_waris': 'Saudara Laki-Laki Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK Bersama',
          'nominal': bagianSaudaraSeibu,
        });
        results.add({
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK Bersama',
          'nominal': bagianSaudaraSeibu,
        });
      } else if (nilaiSaudaraLakiSeibu == 1) {
        int bagianSaudaraLakiSeibu =
            totalWarisan * rSaudaraLakiSeibu ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Saudara Laki-Laki Seibu',
          'porsi': '$rSaudaraLakiSeibu / $hasilKPK',
          'nominal': bagianSaudaraLakiSeibu,
        });
      } else if (nilaiSaudaraPerempuanSeibu == 1) {
        int bagianSaudaraPerempuanSeibu =
            totalWarisan * rSaudaraPerempuanSeibu ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '$rSaudaraPerempuanSeibu / $hasilKPK',
          'nominal': bagianSaudaraPerempuanSeibu,
        });
      } else if (nilaiSaudaraLakiSeibu > 1) {
        int bagianSaudaraLakiSeibu =
            totalWarisan *
            rSaudaraLakiSeibu ~/
            hasilKPK ~/
            nilaiSaudaraLakiSeibu;
        results.add({
          'ahli_waris': 'Saudara Laki-Laki Seibu',
          'porsi': '$rSaudaraLakiSeibu / $hasilKPK',
          'nominal': bagianSaudaraLakiSeibu,
        });
      } else if (nilaiSaudaraPerempuanSeibu > 1) {
        int bagianSaudaraPerempuanSeibu =
            totalWarisan *
            rSaudaraPerempuanSeibu ~/
            hasilKPK ~/
            nilaiSaudaraPerempuanSeibu;
        results.add({
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '$rSaudaraPerempuanSeibu / $hasilKPK',
          'nominal': bagianSaudaraPerempuanSeibu,
        });
      }
    }
  }
}
