part of 'main_calculator.dart';

extension CalculateShare on CalculatorController {
  void calculateShare() {
    print("share");
    print("hasilKPK: $hasilKPK");
    if (nilaiSuami > 0) {
      int bagianSuami = totalWarisan * rSuami ~/ hasilKPK;
      sisaWarisan -= bagianSuami;
      results.add({
        'ahli_waris': 'Suami',
        'porsi': '$rSuami / $hasilKPK',
        'nominal': bagianSuami,
      });
    }

    if (nilaiIstri > 0) {
      int bagianIstri = totalWarisan * rIstri ~/ hasilKPK ~/ nilaiIstri;
      sisaWarisan -= bagianIstri;
      results.add({
        'ahli_waris': 'Istri',
        'porsi': '$rIstri / $hasilKPK',
        'nominal': bagianIstri,
      });
    }

    if (nilaiAyah > 0) {
      if (nilaiAnakLaki > 0 || nilaiCucuLaki > 0) {}
      int bagianAyah = totalWarisan * rAyah ~/ hasilKPK;
      sisaWarisan -= bagianAyah;
      results.add({
        'ahli_waris': 'Ayah',
        'porsi': '$rAyah / $hasilKPK',
        'nominal': bagianAyah,
      });
    }

    if (nilaiIbu > 0) {
      int bagianIbu = totalWarisan * rIbu ~/ hasilKPK;
      sisaWarisan -= bagianIbu;
      results.add({
        'ahli_waris': 'Ibu',
        'porsi': '$rIbu / $hasilKPK',
        'nominal': bagianIbu,
      });
    }

    if (nilaiKakek > 0) {
      if (nilaiAnakLaki > 0 || nilaiCucuLaki > 0) {
        int bagianKakek = totalWarisan * rKakek ~/ hasilKPK;
        sisaWarisan -= bagianKakek;
        results.add({
          'ahli_waris': 'Kakek',
          'porsi': '$rKakek / $hasilKPK',
          'nominal': bagianKakek,
        });
      }
    }

    if (nilaiNenekAyah > 0 && nilaiNenekIbu > 0) {
      int bagianNenek2 = totalWarisan * rNenek2 ~/ hasilKPK;
      sisaWarisan -= bagianNenek2;
      results.add({
        'ahli_waris': 'Nenek',
        'porsi': '$rNenek2 / $hasilKPK',
        'nominal': bagianNenek2,
      });
    } else {
      if (nilaiNenekAyah > 0 && nilaiNenekIbu == 0) {
        int bagianNenekAyah = totalWarisan * rNenekAyah ~/ hasilKPK;
        sisaWarisan -= bagianNenekAyah;
        results.add({
          'ahli_waris': 'Nenek Ayah',
          'porsi': '$rNenekAyah / $hasilKPK',
          'nominal': bagianNenekAyah,
        });
      }
      if (nilaiNenekIbu > 0 && nilaiNenekAyah == 0) {
        int bagianNenekIbu = totalWarisan * rNenekIbu ~/ hasilKPK;
        sisaWarisan -= bagianNenekIbu;
        results.add({
          'ahli_waris': 'Nenek Ibu',
          'porsi': '$rNenekIbu / $hasilKPK',
          'nominal': bagianNenekIbu,
        });
      }
    }

    if (nilaiAnakPerempuan > 0) {
      int bagianAnakPerempuan =
          totalWarisan * rAnakPerempuan ~/ hasilKPK ~/ nilaiAnakPerempuan;
      sisaWarisan -= bagianAnakPerempuan;
      results.add({
        'ahli_waris': 'Anak Perempuan',
        'porsi': '$rAnakPerempuan / $hasilKPK',
        'nominal': bagianAnakPerempuan,
      });
    }

    if (nilaiCucuPerempuan > 0) {
      int bagianCucuPerempuan =
          totalWarisan * rCucuPerempuan ~/ hasilKPK ~/ nilaiCucuPerempuan;
      sisaWarisan -= bagianCucuPerempuan;
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
      sisaWarisan -= bagianSaudaraPerempuanKandung;
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
      sisaWarisan -= bagianSaudaraPerempuanSeayah;
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
      } else if (nilaiSaudaraLakiSeibu > 0) {
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
      } else if (nilaiSaudaraPerempuanSeibu > 0) {
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

    print("sisaWarisan: $sisaWarisan");
    if (sisaWarisan > 0) {
      calculateAshabah();
    }
  }
}
