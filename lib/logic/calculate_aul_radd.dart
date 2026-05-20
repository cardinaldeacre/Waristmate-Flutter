part of 'main_calculator.dart';

extension CalculateAulRadd on CalculatorController {
  void calculateAulRadd() {
    if (totalAshobah > 0 && totalRatio <= hasilKPK) {
      calculateAshabah();
    } else if (totalRatio > hasilKPK) {
      // aul
      hasilKPK = totalRatio;
    } else if (totalRatio < hasilKPK && (nilaiSuami > 0 || nilaiIstri > 0)) {
      // radd pasutri
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
            'porsi': '$rSuami / $hasilKPK',
            'nominal': bagianSuami,
          });
        }
      }
    } else if (totalRatio < hasilKPK && (nilaiSuami == 0 && nilaiIstri == 0)) {
      // radd biasa
      hasilKPK = totalRatio;

      if (nilaiAyah > 0) {
        if (nilaiAnakLaki > 0 || nilaiCucuLaki > 0) {
          int bagianAyah = totalWarisan * rAyah ~/ hasilKPK;
          results.add({
            'ahli_waris': 'Ayah',
            'porsi': '$rAyah / $hasilKPK',
            'nominal': bagianAyah,
          });
          sisaWarisan -= bagianAyah;
        }
      }

      if (nilaiIbu > 0) {
        if (keturunan > 0 || saudara > 1) {
          int bagianIbu = totalWarisan * rIbu ~/ hasilKPK;
          results.add({
            'ahli_waris': 'Ibu',
            'porsi': '$rIbu / $hasilKPK',
            'nominal': bagianIbu,
          });
          sisaWarisan -= bagianIbu;
        } else {
          int bagianIbu = totalWarisan * rIbu ~/ hasilKPK;
          results.add({
            'ahli_waris': 'Ibu',
            'porsi': '$rIbu / $hasilKPK',
            'nominal': bagianIbu,
          });
          sisaWarisan -= bagianIbu;
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
          sisaWarisan -= bagianKakek;
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
        sisaWarisan -= bagianNenek2;
      } else if (nilaiNenekAyah > 0 && nilaiNenekIbu == 0) {
        int bagianNenekAyah = totalWarisan * rNenekAyah ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Nenek Ayah',
          'porsi': '$rNenekAyah / $hasilKPK',
          'nominal': bagianNenekAyah,
        });
        sisaWarisan -= bagianNenekAyah;
      } else if (nilaiNenekIbu > 0 && nilaiNenekAyah == 0) {
        int bagianNenekIbu = totalWarisan * rNenekIbu ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Nenek Ibu',
          'porsi': '$rNenekIbu / $hasilKPK',
          'nominal': bagianNenekIbu,
        });
        sisaWarisan -= bagianNenekIbu;
      }

      if (nilaiAnakPerempuan > 0) {
        if (nilaiAnakPerempuan > 1 && nilaiAnakLaki == 0) {
          int bagianAnakPerempuan =
              totalWarisan * rAnakPerempuan ~/ hasilKPK ~/ nilaiAnakPerempuan;
          results.add({
            'ahli_waris': 'Anak Perempuan',
            'porsi': '$rAnakPerempuan / $hasilKPK',
            'nominal': bagianAnakPerempuan,
          });
          sisaWarisan -= bagianAnakPerempuan;
        } else if (nilaiAnakPerempuan == 1 && nilaiAnakLaki == 0) {
          int bagianAnakPerempuan = totalWarisan * rAnakPerempuan ~/ hasilKPK;
          results.add({
            'ahli_waris': 'Anak Perempuan',
            'porsi': '$rAnakPerempuan / $hasilKPK',
            'nominal': bagianAnakPerempuan,
          });
          sisaWarisan -= bagianAnakPerempuan;
        }
      }

      if (nilaiCucuPerempuan > 0) {
        if (nilaiAnakPerempuan == 1) {
          int bagianCucuPerempuan = totalWarisan * rCucuPerempuan ~/ hasilKPK;
          results.add({
            'ahli_waris': 'Cucu Perempuan',
            'porsi': '$rCucuPerempuan / $hasilKPK',
            'nominal': bagianCucuPerempuan,
          });
          sisaWarisan -= bagianCucuPerempuan;
        } else if (nilaiCucuPerempuan == 1) {
          int bagianCucuPerempuan = totalWarisan * rCucuPerempuan ~/ hasilKPK;
          results.add({
            'ahli_waris': 'Cucu Perempuan',
            'porsi': '$rCucuPerempuan / $hasilKPK',
            'nominal': bagianCucuPerempuan,
          });
          sisaWarisan -= bagianCucuPerempuan;
        } else if (nilaiCucuPerempuan > 1) {
          int bagianCucuPerempuan =
              totalWarisan * rCucuPerempuan ~/ hasilKPK ~/ nilaiCucuPerempuan;
          results.add({
            'ahli_waris': 'Cucu Perempuan',
            'porsi': '$rCucuPerempuan / $hasilKPK',
            'nominal': bagianCucuPerempuan,
          });
          sisaWarisan -= bagianCucuPerempuan;
        }
      }

      if (nilaiSaudaraPerempuanKandung > 0) {
        if (nilaiSaudaraPerempuanKandung == 1) {
          int bagianSaudaraPerempuanKandung =
              totalWarisan * rSaudaraPerempuanKandung ~/ hasilKPK;
          results.add({
            'ahli_waris': 'Saudara Perempuan Kandung',
            'porsi': '$rSaudaraPerempuanKandung / $hasilKPK',
            'nominal': bagianSaudaraPerempuanKandung,
          });
          sisaWarisan -= bagianSaudaraPerempuanKandung;
        } else if (nilaiSaudaraPerempuanKandung > 1) {
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
          sisaWarisan -= bagianSaudaraPerempuanKandung;
        }
      }

      if (nilaiSaudaraPerempuanSeayah > 0) {
        if (nilaiSaudaraPerempuanSeayah == 1) {
          int bagianSaudaraPerempuanSeayah =
              totalWarisan * rSaudaraPerempuanSeayah ~/ hasilKPK;
          results.add({
            'ahli_waris': 'Saudara Perempuan Seayah',
            'porsi': '$rSaudaraPerempuanSeayah / $hasilKPK',
            'nominal': bagianSaudaraPerempuanSeayah,
          });
          sisaWarisan -= bagianSaudaraPerempuanSeayah;
        } else if (nilaiSaudaraPerempuanSeayah > 1) {
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
          sisaWarisan -= bagianSaudaraPerempuanSeayah;
        }
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
            'porsi': '$rSaudaraLakiSeibu / $hasilKPK Bersama',
            'nominal': bagianSaudaraLakiSeibu,
          });
        } else if (nilaiSaudaraPerempuanSeibu == 1) {
          int bagianSaudaraPerempuanSeibu =
              totalWarisan * rSaudaraPerempuanSeibu ~/ hasilKPK;
          results.add({
            'ahli_waris': 'Saudara Perempuan Seibu',
            'porsi': '$rSaudaraPerempuanSeibu / $hasilKPK Bersama',
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
}
