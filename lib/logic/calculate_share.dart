part of 'main_calculator.dart';

extension CalculateShare on CalculatorController {
  void calculateShare() {
    print("share");
    print("hasilKPK: $hasilKPK");
    print("irst: $nIrst");
    print("totalWarisan: $totalWarisan");
    if (nilaiSuami > 0) {
      int bagianSuami = totalWarisan * rSuami ~/ hasilKPK;
      sisaWarisan -= bagianSuami;
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
      sisaWarisan -= bagianIstri;
      results.add({
        'jumlah': nilaiIstri,
        'ahli_waris': 'Istri',
        'porsi': '$rIstri / $hasilKPK',
        'nominal_total': bagianIstri,
        'nominal': bagianIstriPerOrang,
      });
    }

    if (nilaiAyah > 0) {
      if (keturunanLaki > 0) {
        int bagianAyah = totalWarisan * rAyah ~/ hasilKPK;
        sisaWarisan -= bagianAyah;
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
      sisaWarisan -= bagianIbu;
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
        sisaWarisan -= bagianKakek;
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
      int bagianNenek2 = totalWarisan * rNenek2 ~/ hasilKPK;
      int bagianNenekPerOrang = bagianNenek2 ~/ 2;
      sisaWarisan -= bagianNenek2;
      results.add({
        'jumlah': nilaiNenekAyah,
        'ahli_waris': 'Nenek Ayah',
        'porsi': '$rNenek2 / $hasilKPK',
        'nominal_total': bagianNenek2,
        'nominal': bagianNenekPerOrang,
      });
      results.add({
        'jumlah': nilaiNenekIbu,
        'ahli_waris': 'Nenek Ibu',
        'porsi': '$rNenek2 / $hasilKPK',
        'nominal_total': bagianNenek2,
        'nominal': bagianNenekPerOrang,
      });
    } else {
      if (nilaiNenekAyah > 0 && nilaiNenekIbu == 0) {
        int bagianNenekAyah = totalWarisan * rNenekAyah ~/ hasilKPK;
        sisaWarisan -= bagianNenekAyah;
        results.add({
          'jumlah': nilaiNenekAyah,
          'ahli_waris': 'Nenek Ayah',
          'porsi': '$rNenekAyah / $hasilKPK',
          'nominal_total': bagianNenekAyah,
          'nominal': bagianNenekAyah,
        });
      }
      if (nilaiNenekIbu > 0 && nilaiNenekAyah == 0) {
        int bagianNenekIbu = totalWarisan * rNenekIbu ~/ hasilKPK;
        sisaWarisan -= bagianNenekIbu;
        results.add({
          'jumlah': nilaiNenekIbu,
          'ahli_waris': 'Nenek Ibu',
          'porsi': '$rNenekIbu / $hasilKPK',
          'nominal_total': bagianNenekIbu,
          'nominal': bagianNenekIbu,
        });
      }
    }

    if (nilaiAnakPerempuan > 0) {
      if (nilaiAnakLaki == 0) {
        int bagianAnakPerempuan = totalWarisan * rAnakPerempuan ~/ hasilKPK;
        int bagianAnakPerempuanPerOrang =
            bagianAnakPerempuan ~/ nilaiAnakPerempuan;
        sisaWarisan -= bagianAnakPerempuan;
        results.add({
          'jumlah': nilaiAnakPerempuan,
          'ahli_waris': 'Anak Perempuan',
          'porsi': '$rAnakPerempuan / $hasilKPK',
          'nominal_total': bagianAnakPerempuan,
          'nominal': bagianAnakPerempuanPerOrang,
        });
      }
    }

    if (nilaiCucuPerempuan > 0) {
      if (nilaiCucuLaki == 0) {
        int bagianCucuPerempuan = totalWarisan * rCucuPerempuan ~/ hasilKPK;
        int bagianCucuPerempuanPerOrang =
            bagianCucuPerempuan ~/ nilaiCucuPerempuan;
        sisaWarisan -= bagianCucuPerempuan;
        results.add({
          'jumlah': nilaiCucuPerempuan,
          'ahli_waris': 'Cucu Perempuan',
          'porsi': '$rCucuPerempuan / $hasilKPK',
          'nominal_total': bagianCucuPerempuan,
          'nominal': bagianCucuPerempuanPerOrang,
        });
      }
    }

    if (nilaiSaudaraPerempuanKandung > 0) {
      if (nilaiSaudaraLakiKandung == 0 &&
          nilaiAnakPerempuan == 0 &&
          nilaiCucuPerempuan == 0) {
        int bagianSaudaraPerempuanKandung =
            totalWarisan * rSaudaraPerempuanKandung ~/ hasilKPK;
        int bagianSaudaraPerempuanKandungPerOrang =
            bagianSaudaraPerempuanKandung ~/ nilaiSaudaraPerempuanKandung;
        sisaWarisan -= bagianSaudaraPerempuanKandung;
        results.add({
          'jumlah': nilaiSaudaraPerempuanKandung,
          'ahli_waris': 'Saudara Perempuan Kandung',
          'porsi': '$rSaudaraPerempuanKandung / $hasilKPK',
          'nominal_total': bagianSaudaraPerempuanKandung,
          'nominal': bagianSaudaraPerempuanKandungPerOrang,
        });
      }
    }

    if (nilaiSaudaraPerempuanSeayah > 0) {
      if (nilaiSaudaraLakiSeayah == 0) {
        int bagianSaudaraPerempuanSeayah =
            totalWarisan * rSaudaraPerempuanSeayah ~/ hasilKPK;
        int bagianSaudaraPerempuanSeayahPerOrang =
            bagianSaudaraPerempuanSeayah ~/ nilaiSaudaraPerempuanSeayah;
        sisaWarisan -= bagianSaudaraPerempuanSeayah;
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeayah,
          'ahli_waris': 'Saudara Perempuan Seayah',
          'porsi': '$rSaudaraPerempuanSeayah / $hasilKPK',
          'nominal_total': bagianSaudaraPerempuanSeayah,
          'nominal': bagianSaudaraPerempuanSeayahPerOrang,
        });
      }
    }

    if (saudaraSeibu > 0) {
      if (nilaiSaudaraLakiSeibu > 0 && nilaiSaudaraPerempuanSeibu > 0) {
        int bagianSaudaraSeibu = totalWarisan * rSaudaraSeibu ~/ hasilKPK;
        int bagianSaudaraSeibuPerOrang = bagianSaudaraSeibu ~/ saudaraSeibu;
        sisaWarisan -= bagianSaudaraSeibu;
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
        int bagianSaudaraLakiSeibu = totalWarisan * rSaudaraSeibu ~/ hasilKPK;
        int bagianSaudaraLakiSeibuPerOrang =
            bagianSaudaraLakiSeibu ~/ nilaiSaudaraLakiSeibu;
        sisaWarisan -= bagianSaudaraLakiSeibu;
        results.add({
          'jumlah': nilaiSaudaraLakiSeibu,
          'ahli_waris': 'Saudara Laki-Laki Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK',
          'nominal_total': bagianSaudaraLakiSeibu,
          'nominal': bagianSaudaraLakiSeibuPerOrang,
        });
      } else if (nilaiSaudaraPerempuanSeibu > 0) {
        int bagianSaudaraPerempuanSeibu =
            totalWarisan * rSaudaraSeibu ~/ hasilKPK;
        int bagianSaudaraPerempuanSeibuPerOrang =
            bagianSaudaraPerempuanSeibu ~/ nilaiSaudaraPerempuanSeibu;
        sisaWarisan -= bagianSaudaraPerempuanSeibu;
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeibu,
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK',
          'nominal_total': bagianSaudaraPerempuanSeibu,
          'nominal': bagianSaudaraPerempuanSeibuPerOrang,
        });
      }
    }

    print("sisaWarisan: $sisaWarisan");
    if (sisaWarisan > 0) {
      if (totalAshabah == 0) return;
      calculateAshabah();
    }
  }
}
