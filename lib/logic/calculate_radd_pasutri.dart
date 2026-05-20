part of 'main_calculator.dart';

extension CalculateRaddPasutri on CalculatorController {
  void calculateRaddPasutri() {
    hasilKPK = totalRatio;

    if (nilaiAyah > 0) {
      int bagianAyah = sisaWarisan * rAyah ~/ hasilKPK;
      results.add({
        'ahli_waris': 'Ayah',
        'porsi': '$rAyah / $hasilKPK',
        'nominal': bagianAyah,
      });
    }

    if (nilaiIbu > 0) {
      int bagianIbu = sisaWarisan * rIbu ~/ hasilKPK;
      results.add({
        'ahli_waris': 'Ibu',
        'porsi': '$rIbu / $hasilKPK',
        'nominal': bagianIbu,
      });
    }

    if (nilaiKakek > 0) {
      int bagianKakek = sisaWarisan * rKakek ~/ hasilKPK;
      results.add({
        'ahli_waris': 'Kakek',
        'porsi': '$rKakek / $hasilKPK',
        'nominal': bagianKakek,
      });
    }

    if (nilaiNenekAyah > 0 && nilaiNenekIbu > 0) {
      int bagianNenek2 = sisaWarisan * rNenek2 ~/ hasilKPK ~/ nilaiNenek2;
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
    } else {
      if (nilaiNenekAyah > 0 && nilaiNenekIbu == 0) {
        int bagianNenekAyah = sisaWarisan * rNenekAyah ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Nenek Ayah',
          'porsi': '$rNenekAyah / $hasilKPK',
          'nominal': bagianNenekAyah,
        });
      }
      if (nilaiNenekIbu > 0 && nilaiNenekAyah == 0) {
        int bagianNenekIbu = sisaWarisan * rNenekIbu ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Nenek Ibu',
          'porsi': '$rNenekIbu / $hasilKPK',
          'nominal': bagianNenekIbu,
        });
      }
    }

    if (nilaiAnakPerempuan > 0) {
      if (nilaiAnakPerempuan == 1) {
        int bagianAnakPerempuan = sisaWarisan * rAnakPerempuan ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Anak Perempuan',
          'porsi': '$rAnakPerempuan / $hasilKPK',
          'nominal': bagianAnakPerempuan,
        });
      } else {
        int bagianAnakPerempuan =
            sisaWarisan * rAnakPerempuan ~/ hasilKPK ~/ nilaiAnakPerempuan;
        results.add({
          'ahli_waris': 'Anak Perempuan',
          'porsi': '$rAnakPerempuan / $hasilKPK',
          'nominal': bagianAnakPerempuan,
        });
      }
    }

    if (nilaiCucuPerempuan > 0) {
      if (nilaiAnakPerempuan == 1) {
        int bagianCucuPerempuan =
            sisaWarisan * rCucuPerempuan ~/ hasilKPK ~/ nilaiCucuPerempuan;
        results.add({
          'ahli_waris': 'Cucu Perempuan',
          'porsi': '$rCucuPerempuan / $hasilKPK',
          'nominal': bagianCucuPerempuan,
        });
      } else if (nilaiCucuPerempuan == 1) {
        int bagianCucuPerempuan = sisaWarisan * rCucuPerempuan ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Cucu Perempuan',
          'porsi': '$rCucuPerempuan / $hasilKPK',
          'nominal': bagianCucuPerempuan,
        });
      } else {
        int bagianCucuPerempuan =
            sisaWarisan * rCucuPerempuan ~/ hasilKPK ~/ nilaiCucuPerempuan;
        results.add({
          'ahli_waris': 'Cucu Perempuan',
          'porsi': '$rCucuPerempuan / $hasilKPK',
          'nominal': bagianCucuPerempuan,
        });
      }
    }

    if (nilaiSaudaraPerempuanKandung > 0) {
      if (nilaiSaudaraPerempuanKandung == 1) {
        int bagianSaudaraPerempuanKandung =
            sisaWarisan * rSaudaraPerempuanKandung ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Saudara Perempuan Kandung',
          'porsi': '$rSaudaraPerempuanKandung / $hasilKPK',
          'nominal': bagianSaudaraPerempuanKandung,
        });
      } else {
        int bagianSaudaraPerempuanKandung =
            sisaWarisan *
            rSaudaraPerempuanKandung ~/
            hasilKPK ~/
            nilaiSaudaraPerempuanKandung;
        results.add({
          'ahli_waris': 'Saudara Perempuan Kandung',
          'porsi': '$rSaudaraPerempuanKandung / $hasilKPK',
          'nominal': bagianSaudaraPerempuanKandung,
        });
      }
    }

    if (nilaiSaudaraPerempuanSeayah > 0) {
      if (nilaiSaudaraPerempuanSeayah == 1) {
        int bagianSaudaraPerempuanSeayah =
            sisaWarisan * rSaudaraPerempuanSeayah ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Saudara Perempuan Seayah',
          'porsi': '$rSaudaraPerempuanSeayah / $hasilKPK',
          'nominal': bagianSaudaraPerempuanSeayah,
        });
      } else {
        int bagianSaudaraPerempuanSeayah =
            sisaWarisan *
            rSaudaraPerempuanSeayah ~/
            hasilKPK ~/
            nilaiSaudaraPerempuanSeayah;
        results.add({
          'ahli_waris': 'Saudara Perempuan Seayah',
          'porsi': '$rSaudaraPerempuanSeayah / $hasilKPK',
          'nominal': bagianSaudaraPerempuanSeayah,
        });
      }
    }

    if (saudaraSeibu > 0) {
      if (nilaiSaudaraLakiSeibu > 0 && nilaiSaudaraPerempuanSeibu > 0) {
        int bagianSaudaraSeibu =
            sisaWarisan * rSaudaraSeibu ~/ hasilKPK ~/ saudaraSeibu;
        results.add({
          'ahli_waris': 'Saudara Laki Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK Bersama',
          'nominal': bagianSaudaraSeibu,
        });
        results.add({
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK Bersama',
          'nominal': bagianSaudaraSeibu,
        });
      } else if (nilaiSaudaraLakiSeibu == 1) {
        int bagianSaudaraSeibu = sisaWarisan * rSaudaraSeibu ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Saudara Laki Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK',
          'nominal': bagianSaudaraSeibu,
        });
      } else if (nilaiSaudaraPerempuanSeibu == 1) {
        int bagianSaudaraSeibu = sisaWarisan * rSaudaraSeibu ~/ hasilKPK;
        results.add({
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK',
          'nominal': bagianSaudaraSeibu,
        });
      } else if (nilaiSaudaraLakiSeibu > 1) {
        int bagianSaudaraSeibu =
            sisaWarisan * rSaudaraSeibu ~/ hasilKPK ~/ saudaraSeibu;
        results.add({
          'ahli_waris': 'Saudara Laki Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK',
          'nominal': bagianSaudaraSeibu,
        });
      } else if (nilaiSaudaraPerempuanSeibu > 1) {
        int bagianSaudaraSeibu =
            sisaWarisan * rSaudaraSeibu ~/ hasilKPK ~/ saudaraSeibu;
        results.add({
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK',
          'nominal': bagianSaudaraSeibu,
        });
      }
    }
  }
}
