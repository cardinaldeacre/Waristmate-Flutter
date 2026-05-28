part of 'main_calculator.dart';

extension CalculateRaddPasutri on CalculatorController {
  void calculateRaddPasutri() {
    hasilKPK = totalRatio;
    print("calculate radd pasutri");
    print("hasilKPK: $hasilKPK");
    if (nilaiAyah > 0) {
      int bagianAyah = sisaWarisan * rAyah ~/ hasilKPK;
      results.add({
        'jumlah': nilaiAyah,
        'ahli_waris': 'Ayah',
        'porsi': '$rAyah / $hasilKPK (sisa)',
        'nominal': bagianAyah,
      });
    }

    if (nilaiIbu > 0) {
      int bagianIbu = sisaWarisan * rIbu ~/ hasilKPK;
      results.add({
        'jumlah': nilaiIbu,
        'ahli_waris': 'Ibu',
        'porsi': '$rIbu / $hasilKPK (sisa)',
        'nominal': bagianIbu,
      });
    }

    if (nilaiKakek > 0) {
      int bagianKakek = sisaWarisan * rKakek ~/ hasilKPK;
      results.add({
        'jumlah': nilaiKakek,
        'ahli_waris': 'Kakek',
        'porsi': '$rKakek / $hasilKPK (sisa)',
        'nominal': bagianKakek,
      });
    }

    if (nilaiNenekAyah > 0 && nilaiNenekIbu > 0) {
      int bagianNenek2 = sisaWarisan * rNenek2 ~/ hasilKPK ~/ nilaiNenek2;
      results.add({
        'jumlah': nilaiNenekAyah,
        'ahli_waris': 'Nenek Ayah',
        'porsi': '$rNenek2 / $hasilKPK Bersama (sisa)',
        'nominal': bagianNenek2,
      });
      results.add({
        'jumlah': nilaiNenekIbu,
        'ahli_waris': 'Nenek Ibu',
        'porsi': '$rNenek2 / $hasilKPK Bersama (sisa)',
        'nominal': bagianNenek2,
      });
    } else {
      if (nilaiNenekAyah > 0 && nilaiNenekIbu == 0) {
        int bagianNenekAyah = sisaWarisan * rNenekAyah ~/ hasilKPK;
        results.add({
          'jumlah': nilaiNenekAyah,
          'ahli_waris': 'Nenek Ayah',
          'porsi': '$rNenekAyah / $hasilKPK (sisa)',
          'nominal': bagianNenekAyah,
        });
      }
      if (nilaiNenekIbu > 0 && nilaiNenekAyah == 0) {
        int bagianNenekIbu = sisaWarisan * rNenekIbu ~/ hasilKPK;
        results.add({
          'jumlah': nilaiNenekIbu,
          'ahli_waris': 'Nenek Ibu',
          'porsi': '$rNenekIbu / $hasilKPK (sisa)',
          'nominal': bagianNenekIbu,
        });
      }
    }

    if (nilaiAnakPerempuan > 0) {
      if (nilaiAnakPerempuan == 1) {
        int bagianAnakPerempuan =
            sisaWarisan * rAnakPerempuan ~/ hasilKPK ~/ nilaiAnakPerempuan;
        results.add({
          'jumlah': nilaiAnakPerempuan,
          'ahli_waris': 'Anak Perempuan',
          'porsi': '$rAnakPerempuan / $hasilKPK (sisa)',
          'nominal': bagianAnakPerempuan,
        });
      } else {
        int bagianAnakPerempuan =
            sisaWarisan * rAnakPerempuan ~/ hasilKPK ~/ nilaiAnakPerempuan;
        results.add({
          'jumlah': nilaiAnakPerempuan,
          'ahli_waris': 'Anak Perempuan',
          'porsi': '$rAnakPerempuan / $hasilKPK (sisa)',
          'nominal': bagianAnakPerempuan,
        });
      }
    }

    if (nilaiCucuPerempuan > 0) {
      if (nilaiAnakPerempuan == 1) {
        int bagianCucuPerempuan =
            sisaWarisan * rCucuPerempuan ~/ hasilKPK ~/ nilaiCucuPerempuan;
        results.add({
          'jumlah': nilaiCucuPerempuan,
          'ahli_waris': 'Cucu Perempuan',
          'porsi': '$rCucuPerempuan / $hasilKPK (sisa)',
          'nominal': bagianCucuPerempuan,
        });
      } else if (nilaiCucuPerempuan == 1) {
        int bagianCucuPerempuan = sisaWarisan * rCucuPerempuan ~/ hasilKPK;
        results.add({
          'jumlah': nilaiCucuPerempuan,
          'ahli_waris': 'Cucu Perempuan',
          'porsi': '$rCucuPerempuan / $hasilKPK (sisa)',
          'nominal': bagianCucuPerempuan,
        });
      } else {
        int bagianCucuPerempuan =
            sisaWarisan * rCucuPerempuan ~/ hasilKPK ~/ nilaiCucuPerempuan;
        results.add({
          'jumlah': nilaiCucuPerempuan,
          'ahli_waris': 'Cucu Perempuan',
          'porsi': '$rCucuPerempuan / $hasilKPK (sisa)',
          'nominal': bagianCucuPerempuan,
        });
      }
    }

    if (nilaiSaudaraPerempuanKandung > 0) {
      if (nilaiSaudaraPerempuanKandung == 1) {
        int bagianSaudaraPerempuanKandung =
            sisaWarisan * rSaudaraPerempuanKandung ~/ hasilKPK;
        results.add({
          'jumlah': nilaiSaudaraPerempuanKandung,
          'ahli_waris': 'Saudara Perempuan Kandung',
          'porsi': '$rSaudaraPerempuanKandung / $hasilKPK (sisa)',
          'nominal': bagianSaudaraPerempuanKandung,
        });
      } else {
        int bagianSaudaraPerempuanKandung =
            sisaWarisan *
            rSaudaraPerempuanKandung ~/
            hasilKPK ~/
            nilaiSaudaraPerempuanKandung;
        results.add({
          'jumlah': nilaiSaudaraPerempuanKandung,
          'ahli_waris': 'Saudara Perempuan Kandung',
          'porsi': '$rSaudaraPerempuanKandung / $hasilKPK (sisa)',
          'nominal': bagianSaudaraPerempuanKandung,
        });
      }
    }

    if (nilaiSaudaraPerempuanSeayah > 0) {
      if (nilaiSaudaraPerempuanSeayah == 1) {
        int bagianSaudaraPerempuanSeayah =
            sisaWarisan * rSaudaraPerempuanSeayah ~/ hasilKPK;
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeayah,
          'ahli_waris': 'Saudara Perempuan Seayah',
          'porsi': '$rSaudaraPerempuanSeayah / $hasilKPK (sisa)',
          'nominal': bagianSaudaraPerempuanSeayah,
        });
      } else {
        int bagianSaudaraPerempuanSeayah =
            sisaWarisan *
            rSaudaraPerempuanSeayah ~/
            hasilKPK ~/
            nilaiSaudaraPerempuanSeayah;
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeayah,
          'ahli_waris': 'Saudara Perempuan Seayah',
          'porsi': '$rSaudaraPerempuanSeayah / $hasilKPK (sisa)',
          'nominal': bagianSaudaraPerempuanSeayah,
        });
      }
    }

    if (saudaraSeibu > 0) {
      if (nilaiSaudaraLakiSeibu > 0 && nilaiSaudaraPerempuanSeibu > 0) {
        int bagianSaudaraSeibu =
            sisaWarisan * rSaudaraSeibu ~/ hasilKPK ~/ saudaraSeibu;
        results.add({
          'jumlah': nilaiSaudaraLakiSeibu,
          'ahli_waris': 'Saudara Laki Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK Bersama (sisa)',
          'nominal': bagianSaudaraSeibu,
        });
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeibu,
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK Bersama (sisa)',
          'nominal': bagianSaudaraSeibu,
        });
      } else if (nilaiSaudaraLakiSeibu == 1) {
        int bagianSaudaraSeibu = sisaWarisan * rSaudaraSeibu ~/ hasilKPK;
        results.add({
          'jumlah': nilaiSaudaraLakiSeibu,
          'ahli_waris': 'Saudara Laki Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK (sisa)',
          'nominal': bagianSaudaraSeibu,
        });
      } else if (nilaiSaudaraPerempuanSeibu == 1) {
        int bagianSaudaraSeibu = sisaWarisan * rSaudaraSeibu ~/ hasilKPK;
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeibu,
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK (sisa)',
          'nominal': bagianSaudaraSeibu,
        });
      } else if (nilaiSaudaraLakiSeibu > 1) {
        int bagianSaudaraSeibu =
            sisaWarisan * rSaudaraSeibu ~/ hasilKPK ~/ saudaraSeibu;
        results.add({
          'jumlah': nilaiSaudaraLakiSeibu,
          'ahli_waris': 'Saudara Laki Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK (sisa)',
          'nominal': bagianSaudaraSeibu,
        });
      } else if (nilaiSaudaraPerempuanSeibu > 1) {
        int bagianSaudaraSeibu =
            sisaWarisan * rSaudaraSeibu ~/ hasilKPK ~/ saudaraSeibu;
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeibu,
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK (sisa)',
          'nominal': bagianSaudaraSeibu,
        });
      }
    }
  }
}
