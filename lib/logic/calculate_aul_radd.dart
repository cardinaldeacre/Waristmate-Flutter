part of 'main_calculator.dart';

extension CalculateAulRadd on CalculatorController {
  void calculateAulRadd() {
    if (totalAshabah > 0 && totalRatio <= hasilKPK) {
      calculateAshabah();
    } else if (totalRatio > hasilKPK) {
      // aul
      hasilKPK = totalRatio;
      kasus = 'Aul';
      print("aul");

      if (nilaiSuami > 0) {
        int bagianSuami = totalWarisan * rSuami ~/ hasilKPK;
        results.add({
          'jumlah': nilaiSuami,
          'ahli_waris': 'Suami',
          'porsi': '$rSuami / $hasilKPK',
          'nominal_total': bagianSuami,
          'nominal': bagianSuami,
        });
      }

      if (nilaiIstri > 0) {
        int bagianIstri = totalWarisan * rIstri ~/ hasilKPK;
        int bagianIstriPerOrang = bagianIstri ~/ nilaiIstri;
        results.add({
          'jumlah': nilaiIstri,
          'ahli_waris': 'Istri',
          'porsi': '$rIstri / $hasilKPK',
          'nominal_total': bagianIstri,
          'nominal': bagianIstriPerOrang,
        });
      }

      if (nilaiAyah > 0) {
        int bagianAyah = totalWarisan * rAyah ~/ hasilKPK;
        results.add({
          'jumlah': nilaiAyah,
          'ahli_waris': 'Ayah',
          'porsi': '$rAyah / $hasilKPK',
          'nominal_total': bagianAyah,
          'nominal': bagianAyah,
        });
      }

      if (nilaiIbu > 0) {
        int bagianIbu = totalWarisan * rIbu ~/ hasilKPK;
        results.add({
          'jumlah': nilaiIbu,
          'ahli_waris': 'Ibu',
          'porsi': '$rIbu / $hasilKPK',
          'nominal_total': bagianIbu,
          'nominal': bagianIbu,
        });
      }

      if (nilaiKakek > 0) {
        int bagianKakek = totalWarisan * rKakek ~/ hasilKPK;
        results.add({
          'jumlah': nilaiKakek,
          'ahli_waris': 'Kakek',
          'porsi': '$rKakek / $hasilKPK',
          'nominal_total': bagianKakek,
          'nominal': bagianKakek,
        });
      }

      if (nilaiNenekAyah > 0 && nilaiNenekIbu > 0) {
        int bagianNenek2 = totalWarisan * rNenek2 ~/ hasilKPK;
        int bagianNenek2PerOrang = bagianNenek2 ~/ nilaiNenek2;
        results.add({
          'jumlah': nilaiNenekAyah,
          'ahli_waris': 'Nenek Ayah',
          'porsi': '$rNenek2 / $hasilKPK Bersama',
          'nominal_total': bagianNenek2,
          'nominal': bagianNenek2PerOrang,
        });
        results.add({
          'jumlah': nilaiNenekIbu,
          'ahli_waris': 'Nenek Ibu',
          'porsi': '$rNenek2 / $hasilKPK Bersama',
          'nominal_total': bagianNenek2,
          'nominal': bagianNenek2PerOrang,
        });
      } else if (nilaiNenekAyah > 0 && nilaiNenekIbu == 0) {
        int bagianNenekAyah = totalWarisan * rNenekAyah ~/ hasilKPK;
        results.add({
          'jumlah': nilaiNenekAyah,
          'ahli_waris': 'Nenek Ayah',
          'porsi': '$rNenekAyah / $hasilKPK',
          'nominal_total': bagianNenekAyah,
          'nominal': bagianNenekAyah,
        });
      } else if (nilaiNenekIbu > 0 && nilaiNenekAyah == 0) {
        int bagianNenekIbu = totalWarisan * rNenekIbu ~/ hasilKPK;
        results.add({
          'jumlah': nilaiNenekIbu,
          'ahli_waris': 'Nenek Ibu',
          'porsi': '$rNenekIbu / $hasilKPK',
          'nominal_total': bagianNenekIbu,
          'nominal': bagianNenekIbu,
        });
      }

      if (nilaiAnakPerempuan > 0) {
        int bagianAnakPerempuan = totalWarisan * rAnakPerempuan ~/ hasilKPK;
        int bagianAnakPerempuanPerOrang =
            bagianAnakPerempuan ~/ nilaiAnakPerempuan;
        results.add({
          'jumlah': nilaiAnakPerempuan,
          'ahli_waris': 'Anak Perempuan',
          'porsi': '$rAnakPerempuan / $hasilKPK',
          'nominal_total': bagianAnakPerempuan,
          'nominal': bagianAnakPerempuanPerOrang,
        });
      }

      if (nilaiCucuPerempuan > 0) {
        int bagianCucuPerempuan = totalWarisan * rCucuPerempuan ~/ hasilKPK;
        int bagianCucuPerempuanPerOrang =
            bagianCucuPerempuan ~/ nilaiCucuPerempuan;
        results.add({
          'jumlah': nilaiCucuPerempuan,
          'ahli_waris': 'Cucu Perempuan',
          'porsi': '$rCucuPerempuan / $hasilKPK',
          'nominal_total': bagianCucuPerempuan,
          'nominal': bagianCucuPerempuanPerOrang,
        });
      }

      if (nilaiSaudaraPerempuanKandung > 0) {
        int bagianSaudaraPerempuanKandung =
            totalWarisan * rSaudaraPerempuanKandung ~/ hasilKPK;
        int bagianSaudaraPerempuanKandungPerOrang =
            bagianSaudaraPerempuanKandung ~/ nilaiSaudaraPerempuanKandung;
        results.add({
          'jumlah': nilaiSaudaraPerempuanKandung,
          'ahli_waris': 'Saudara Perempuan Kandung',
          'porsi': '$rSaudaraPerempuanKandung / $hasilKPK',
          'nominal_total': bagianSaudaraPerempuanKandung,
          'nominal': bagianSaudaraPerempuanKandungPerOrang,
        });
      }

      if (nilaiSaudaraPerempuanSeayah > 0) {
        int bagianSaudaraPerempuanSeayah =
            totalWarisan * rSaudaraPerempuanSeayah ~/ hasilKPK;
        int bagianSaudaraPerempuanSeayahPerOrang =
            bagianSaudaraPerempuanSeayah ~/ nilaiSaudaraPerempuanSeayah;
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeayah,
          'ahli_waris': 'Saudara Perempuan Seayah',
          'porsi': '$rSaudaraPerempuanSeayah / $hasilKPK',
          'nominal_total': bagianSaudaraPerempuanSeayah,
          'nominal': bagianSaudaraPerempuanSeayahPerOrang,
        });
      }

      if (saudaraSeibu > 0) {
        if (nilaiSaudaraLakiSeibu > 0 && nilaiSaudaraPerempuanSeibu > 0) {
          int bagianSaudaraSeibu = totalWarisan * rSaudaraSeibu ~/ hasilKPK;
          int bagianSaudaraSeibuPerOrang = bagianSaudaraSeibu ~/ saudaraSeibu;
          results.add({
            'jumlah': nilaiSaudaraLakiSeibu,
            'ahli_waris': 'Saudara Laki-Laki Seibu',
            'porsi': '$rSaudaraSeibu / $hasilKPK Bersama',
            'nominal_total': bagianSaudaraSeibu,
            'nominal': bagianSaudaraSeibuPerOrang,
          });
          results.add({
            'jumlah': nilaiSaudaraPerempuanSeibu,
            'ahli_waris': 'Saudara Perempuan Seibu',
            'porsi': '$rSaudaraSeibu / $hasilKPK Bersama',
            'nominal_total': bagianSaudaraSeibu,
            'nominal': bagianSaudaraSeibuPerOrang,
          });
        } else if (nilaiSaudaraLakiSeibu > 0) {
          int bagianSaudaraLakiSeibu =
              totalWarisan * rSaudaraLakiSeibu ~/ hasilKPK;
          int bagianSaudaraLakiSeibuPerOrang =
              bagianSaudaraLakiSeibu ~/ nilaiSaudaraLakiSeibu;
          results.add({
            'jumlah': nilaiSaudaraLakiSeibu,
            'ahli_waris': 'Saudara Laki-Laki Seibu',
            'porsi': '$rSaudaraLakiSeibu / $hasilKPK',
            'nominal_total': bagianSaudaraLakiSeibu,
            'nominal': bagianSaudaraLakiSeibuPerOrang,
          });
        } else if (nilaiSaudaraPerempuanSeibu > 0) {
          int bagianSaudaraPerempuanSeibu =
              totalWarisan * rSaudaraPerempuanSeibu ~/ hasilKPK;
          int bagianSaudaraPerempuanSeibuPerOrang =
              bagianSaudaraPerempuanSeibu ~/ nilaiSaudaraPerempuanSeibu;
          results.add({
            'jumlah': nilaiSaudaraPerempuanSeibu,
            'ahli_waris': 'Saudara Perempuan Seibu',
            'porsi': '$rSaudaraPerempuanSeibu / $hasilKPK',
            'nominal_total': bagianSaudaraPerempuanSeibu,
            'nominal': bagianSaudaraPerempuanSeibuPerOrang,
          });
        }
      }
    } else if (totalRatio < hasilKPK &&
        (nilaiSuami > 0 || nilaiIstri > 0) &&
        totalAshabah == 0) {
      // radd pasutri
      kasus = 'Radd';
      print("radd pasutri");
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
            'jumlah': nilaiSuami,
            'ahli_waris': 'Suami',
            'porsi': '1 / 4 (total)',
            'nominal_total': bagianSuami,
            'nominal': bagianSuami,
          });
          sisaWarisan -= bagianSuami;
        } else {
          masalah.removeWhere((item) => item == 2);
          calculateKPK();
          int bagianSuami = totalWarisan * 1 ~/ 2;
          results.add({
            'jumlah': nilaiSuami,
            'ahli_waris': 'Suami',
            'porsi': '1 / 2 (total)',
            'nominal_total': bagianSuami,
            'nominal': bagianSuami,
          });
          sisaWarisan -= bagianSuami;
        }
      } else if (nilaiSuami > 0) {
        int bagianSuami = totalWarisan * 1;
        results.add({
          'jumlah': nilaiSuami,
          'ahli_waris': 'Suami',
          'porsi': '1 / 1',
          'nominal_total': bagianSuami,
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
          int bagianIstri = totalWarisan * 1 ~/ 8;
          int bagianIstriPerOrang = bagianIstri ~/ nilaiIstri;
          results.add({
            'jumlah': nilaiIstri,
            'ahli_waris': 'Istri',
            'porsi': '1 / 8 (total)',
            'nominal_total': bagianIstri,
            'nominal': bagianIstriPerOrang,
          });
          sisaWarisan -= bagianIstri;
        } else {
          masalah.removeWhere((item) => item == 4);
          calculateKPK();
          int bagianIstri = totalWarisan * 1 ~/ 4;
          int bagianIstriPerOrang = bagianIstri ~/ nilaiIstri;
          results.add({
            'jumlah': nilaiIstri,
            'ahli_waris': 'Istri',
            'porsi': '1 / 4 (total)',
            'nominal_total': bagianIstri,
            'nominal': bagianIstriPerOrang,
          });
          sisaWarisan -= bagianIstri;
        }
      } else if (nilaiIstri > 0) {
        int bagianIstri = totalWarisan * 1;
        int bagianIstriPerOrang = bagianIstri ~/ nilaiIstri;
        results.add({
          'jumlah': nilaiIstri,
          'ahli_waris': 'Istri',
          'porsi': '1 / 1',
          'nominal_total': bagianIstri,
          'nominal': bagianIstriPerOrang,
        });
      }

      calculateRatio2();
    } else if (totalRatio < hasilKPK &&
        (nilaiSuami == 0 && nilaiIstri == 0) &&
        totalAshabah == 0) {
      // radd biasa
      hasilKPK = totalRatio;
      kasus = 'Radd';
      print("radd biasa");

      if (nilaiAyah > 0) {
        if (nilaiAnakLaki > 0 || nilaiCucuLaki > 0) {
          int bagianAyah = totalWarisan * rAyah ~/ hasilKPK;
          results.add({
            'jumlah': nilaiAyah,
            'ahli_waris': 'Ayah',
            'porsi': '$rAyah / $hasilKPK',
            'nominal_total': bagianAyah,
            'nominal': bagianAyah,
          });
        }
      }

      if (nilaiIbu > 0) {
        int bagianIbu = totalWarisan * rIbu ~/ hasilKPK;
        results.add({
          'jumlah': nilaiIbu,
          'ahli_waris': 'Ibu',
          'porsi': '$rIbu / $hasilKPK',
          'nominal_total': bagianIbu,
          'nominal': bagianIbu,
        });
      }

      if (nilaiKakek > 0) {
        if (keturunanLaki > 0) {
          int bagianKakek = totalWarisan * rKakek ~/ hasilKPK;
          results.add({
            'jumlah': nilaiKakek,
            'ahli_waris': 'Kakek',
            'porsi': '$rKakek / $hasilKPK',
            'nominal_total': bagianKakek,
            'nominal': bagianKakek,
          });
        }
      }

      if (nilaiNenekAyah > 0 && nilaiNenekIbu > 0) {
        int bagianNenek = totalWarisan * rNenek2 ~/ hasilKPK;
        int bagianNenekPerOrang =
            totalWarisan * rNenek2 ~/ hasilKPK ~/ nilaiNenek2;
        results.add({
          'jumlah': nilaiNenekAyah,
          'ahli_waris': 'Nenek Ayah',
          'porsi': '$rNenek2 / $hasilKPK Bersama',
          'nominal_total': bagianNenek,
          'nominal': bagianNenekPerOrang,
        });
        results.add({
          'jumlah': nilaiNenekIbu,
          'ahli_waris': 'Nenek Ibu',
          'porsi': '$rNenek2 / $hasilKPK Bersama',
          'nominal_total': bagianNenek,
          'nominal': bagianNenekPerOrang,
        });
      } else if (nilaiNenekAyah > 0 && nilaiNenekIbu == 0) {
        int bagianNenekAyah = totalWarisan * rNenekAyah ~/ hasilKPK;
        results.add({
          'jumlah': nilaiNenekAyah,
          'ahli_waris': 'Nenek Ayah',
          'porsi': '$rNenekAyah / $hasilKPK',
          'nominal_total': bagianNenekAyah,
          'nominal': bagianNenekAyah,
        });
      } else if (nilaiNenekIbu > 0 && nilaiNenekAyah == 0) {
        int bagianNenekIbu = totalWarisan * rNenekIbu ~/ hasilKPK;
        results.add({
          'jumlah': nilaiNenekIbu,
          'ahli_waris': 'Nenek Ibu',
          'porsi': '$rNenekIbu / $hasilKPK',
          'nominal_total': bagianNenekIbu,
          'nominal': bagianNenekIbu,
        });
      }

      if (nilaiAnakPerempuan > 0) {
        int bagianAnakPerempuan = totalWarisan * rAnakPerempuan ~/ hasilKPK;
        int bagianAnakPerempuanPerOrang =
            bagianAnakPerempuan ~/ nilaiAnakPerempuan;
        results.add({
          'jumlah': nilaiAnakPerempuan,
          'ahli_waris': 'Anak Perempuan',
          'porsi': '$rAnakPerempuan / $hasilKPK',
          'nominal_total': bagianAnakPerempuan,
          'nominal': bagianAnakPerempuanPerOrang,
        });
      }

      if (nilaiCucuPerempuan > 0) {
        int bagianCucuPerempuan = totalWarisan * rCucuPerempuan ~/ hasilKPK;
        int bagianCucuPerempuanPerOrang =
            bagianCucuPerempuan ~/ nilaiCucuPerempuan;
        results.add({
          'jumlah': nilaiCucuPerempuan,
          'ahli_waris': 'Cucu Perempuan',
          'porsi': '$rCucuPerempuan / $hasilKPK',
          'nominal_total': bagianCucuPerempuan,
          'nominal': bagianCucuPerempuanPerOrang,
        });
      }

      if (nilaiSaudaraPerempuanKandung > 0) {
        int bagianSaudaraPerempuanKandung =
            totalWarisan * rSaudaraPerempuanKandung ~/ hasilKPK;
        int bagianSaudaraPerempuanKandungPerOrang =
            bagianSaudaraPerempuanKandung ~/ nilaiSaudaraPerempuanKandung;
        results.add({
          'jumlah': nilaiSaudaraPerempuanKandung,
          'ahli_waris': 'Saudara Perempuan Kandung',
          'porsi': '$rSaudaraPerempuanKandung / $hasilKPK',
          'nominal_total': bagianSaudaraPerempuanKandung,
          'nominal': bagianSaudaraPerempuanKandungPerOrang,
        });
      }

      if (nilaiSaudaraPerempuanSeayah > 0) {
        int bagianSaudaraPerempuanSeayah =
            totalWarisan * rSaudaraPerempuanSeayah ~/ hasilKPK;
        int bagianSaudaraPerempuanSeayahPerOrang =
            bagianSaudaraPerempuanSeayah ~/ nilaiSaudaraPerempuanSeayah;
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeayah,
          'ahli_waris': 'Saudara Perempuan Seayah',
          'porsi': '$rSaudaraPerempuanSeayah / $hasilKPK',
          'nominal_total': bagianSaudaraPerempuanSeayah,
          'nominal': bagianSaudaraPerempuanSeayahPerOrang,
        });
      }

      if (saudaraSeibu > 0) {
        if (nilaiSaudaraLakiSeibu > 0 && nilaiSaudaraPerempuanSeibu > 0) {
          int bagianSaudaraSeibu = totalWarisan * rSaudaraSeibu ~/ hasilKPK;
          int bagianSaudaraSeibuPerOrang = bagianSaudaraSeibu ~/ saudaraSeibu;
          results.add({
            'jumlah': saudaraSeibu,
            'ahli_waris': 'Saudara Laki-Laki Seibu',
            'porsi': '$rSaudaraSeibu / $hasilKPK Bersama',
            'nominal_total': bagianSaudaraSeibu,
            'nominal': bagianSaudaraSeibuPerOrang,
          });
          results.add({
            'jumlah': nilaiSaudaraPerempuanSeibu,
            'ahli_waris': 'Saudara Perempuan Seibu',
            'porsi': '$rSaudaraSeibu / $hasilKPK Bersama',
            'nominal_total': bagianSaudaraSeibu,
            'nominal': bagianSaudaraSeibuPerOrang,
          });
        } else if (nilaiSaudaraLakiSeibu == 1) {
          int bagianSaudaraLakiSeibu =
              totalWarisan * rSaudaraLakiSeibu ~/ hasilKPK;
          int bagianSaudaraLakiSeibuPerOrang =
              bagianSaudaraLakiSeibu ~/ nilaiSaudaraLakiSeibu;
          results.add({
            'jumlah': nilaiSaudaraLakiSeibu,
            'ahli_waris': 'Saudara Laki-Laki Seibu',
            'porsi': '$rSaudaraLakiSeibu / $hasilKPK',
            'nominal_total': bagianSaudaraLakiSeibu,
            'nominal': bagianSaudaraLakiSeibuPerOrang,
          });
        } else if (nilaiSaudaraPerempuanSeibu == 1) {
          int bagianSaudaraPerempuanSeibu =
              totalWarisan * rSaudaraPerempuanSeibu ~/ hasilKPK;
          int bagianSaudaraPerempuanSeibuPerOrang =
              bagianSaudaraPerempuanSeibu ~/ nilaiSaudaraPerempuanSeibu;
          results.add({
            'jumlah': nilaiSaudaraPerempuanSeibu,
            'ahli_waris': 'Saudara Perempuan Seibu',
            'porsi': '$rSaudaraPerempuanSeibu / $hasilKPK',
            'nominal_total': bagianSaudaraPerempuanSeibu,
            'nominal': bagianSaudaraPerempuanSeibuPerOrang,
          });
        } else if (nilaiSaudaraLakiSeibu > 1) {
          int bagianSaudaraLakiSeibu =
              totalWarisan * rSaudaraLakiSeibu ~/ hasilKPK;
          int bagianSaudaraLakiSeibuPerOrang =
              bagianSaudaraLakiSeibu ~/ nilaiSaudaraLakiSeibu;
          results.add({
            'jumlah': nilaiSaudaraLakiSeibu,
            'ahli_waris': 'Saudara Laki-Laki Seibu',
            'porsi': '$rSaudaraLakiSeibu / $hasilKPK',
            'nominal_total': bagianSaudaraLakiSeibu,
            'nominal': bagianSaudaraLakiSeibuPerOrang,
          });
        } else if (nilaiSaudaraPerempuanSeibu > 1) {
          int bagianSaudaraPerempuanSeibu =
              totalWarisan * rSaudaraPerempuanSeibu ~/ hasilKPK;
          int bagianSaudaraPerempuanSeibuPerOrang =
              bagianSaudaraPerempuanSeibu ~/ nilaiSaudaraPerempuanSeibu;
          results.add({
            'jumlah': nilaiSaudaraPerempuanSeibu,
            'ahli_waris': 'Saudara Perempuan Seibu',
            'porsi': '$rSaudaraPerempuanSeibu / $hasilKPK',
            'nominal_total': bagianSaudaraPerempuanSeibu,
            'nominal': bagianSaudaraPerempuanSeibuPerOrang,
          });
        }
      }
    }
  }
}
