part of 'main_calculator.dart';

extension CalculateRaddPasutri on CalculatorController {
  void calculateRaddPasutri() {
    hasilKPK = totalRatio;
    debugPrint("calculate radd pasutri");
    debugPrint("hasilKPK: $hasilKPK");
    if (nilaiAyah > 0) {
      int bagianAyah = sisaWarisan * rAyah ~/ hasilKPK;
      results.add({
        'jumlah': nilaiAyah,
        'ahli_waris': 'Ayah',
        'porsi': '$rAyah / $hasilKPK (sisa)',
        'nominal_total': bagianAyah,
        'nominal': bagianAyah,
      });
    }

    if (nilaiIbu > 0) {
      int bagianIbu = sisaWarisan * rIbu ~/ hasilKPK;
      results.add({
        'jumlah': nilaiIbu,
        'ahli_waris': 'Ibu',
        'porsi': '$rIbu / $hasilKPK (sisa)',
        'nominal_total': bagianIbu,
        'nominal': bagianIbu,
      });
    }

    if (nilaiKakek > 0) {
      int bagianKakek = sisaWarisan * rKakek ~/ hasilKPK;
      results.add({
        'jumlah': nilaiKakek,
        'ahli_waris': 'Kakek',
        'porsi': '$rKakek / $hasilKPK (sisa)',
        'nominal_total': bagianKakek,
        'nominal': bagianKakek,
      });
    }

    if (nilaiNenekAyah > 0 && nilaiNenekIbu > 0) {
      int bagianNenek2 = sisaWarisan * rNenek2 ~/ hasilKPK;
      int bagianNenek2PerOrang = bagianNenek2 ~/ 2;
      results.add({
        'jumlah': nilaiNenekAyah,
        'ahli_waris': 'Nenek Ayah',
        'porsi': '$rNenek2 / $hasilKPK Bersama (sisa)',
        'nominal_total': bagianNenek2,
        'nominal': bagianNenek2PerOrang,
      });
      results.add({
        'jumlah': nilaiNenekIbu,
        'ahli_waris': 'Nenek Ibu',
        'porsi': '$rNenek2 / $hasilKPK Bersama (sisa)',
        'nominal_total': bagianNenek2,
        'nominal': bagianNenek2PerOrang,
      });
    } else {
      if (nilaiNenekAyah > 0 && nilaiNenekIbu == 0) {
        int bagianNenekAyah = sisaWarisan * rNenekAyah ~/ hasilKPK;
        results.add({
          'jumlah': nilaiNenekAyah,
          'ahli_waris': 'Nenek Ayah',
          'porsi': '$rNenekAyah / $hasilKPK (sisa)',
          'nominal_total': bagianNenekAyah,
          'nominal': bagianNenekAyah,
        });
      }
      if (nilaiNenekIbu > 0 && nilaiNenekAyah == 0) {
        int bagianNenekIbu = sisaWarisan * rNenekIbu ~/ hasilKPK;
        results.add({
          'jumlah': nilaiNenekIbu,
          'ahli_waris': 'Nenek Ibu',
          'porsi': '$rNenekIbu / $hasilKPK (sisa)',
          'nominal_total': bagianNenekIbu,
          'nominal': bagianNenekIbu,
        });
      }
    }

    if (nilaiAnakPerempuan > 0) {
      int bagianAnakPerempuan = sisaWarisan * rAnakPerempuan ~/ hasilKPK;
      int bagianAnakPerempuanPerOrang =
          bagianAnakPerempuan ~/ nilaiAnakPerempuan;
      results.add({
        'jumlah': nilaiAnakPerempuan,
        'ahli_waris': 'Anak Perempuan',
        'porsi': '$rAnakPerempuan / $hasilKPK (sisa)',
        'nominal_total': bagianAnakPerempuan,
        'nominal': bagianAnakPerempuanPerOrang,
      });
    }

    if (nilaiCucuPerempuan > 0) {
      int bagianCucuPerempuan = sisaWarisan * rCucuPerempuan ~/ hasilKPK;
      int bagianCucuPerempuanPerOrang =
          bagianCucuPerempuan ~/ nilaiCucuPerempuan;
      results.add({
        'jumlah': nilaiCucuPerempuan,
        'ahli_waris': 'Cucu Perempuan',
        'porsi': '$rCucuPerempuan / $hasilKPK (sisa)',
        'nominal_total': bagianCucuPerempuan,
        'nominal': bagianCucuPerempuanPerOrang,
      });
    }

    if (nilaiSaudaraPerempuanKandung > 0) {
      int bagianSaudaraPerempuanKandung =
          sisaWarisan * rSaudaraPerempuanKandung ~/ hasilKPK;
      int bagianSaudaraPerempuanKandungPerOrang =
          bagianSaudaraPerempuanKandung ~/ nilaiSaudaraPerempuanKandung;
      results.add({
        'jumlah': nilaiSaudaraPerempuanKandung,
        'ahli_waris': 'Saudara Perempuan Kandung',
        'porsi': '$rSaudaraPerempuanKandung / $hasilKPK (sisa)',
        'nominal_total': bagianSaudaraPerempuanKandung,
        'nominal': bagianSaudaraPerempuanKandungPerOrang,
      });
    }

    if (nilaiSaudaraPerempuanSeayah > 0 &&
        nilaiAnakPerempuan == 0 &&
        nilaiCucuPerempuan == 0) {
      int bagianSaudaraPerempuanSeayah =
          sisaWarisan * rSaudaraPerempuanSeayah ~/ hasilKPK;
      int bagianSaudaraPerempuanSeayahPerOrang =
          bagianSaudaraPerempuanSeayah ~/ nilaiSaudaraPerempuanSeayah;
      results.add({
        'jumlah': nilaiSaudaraPerempuanSeayah,
        'ahli_waris': 'Saudara Perempuan Seayah',
        'porsi': '$rSaudaraPerempuanSeayah / $hasilKPK (sisa)',
        'nominal_total': bagianSaudaraPerempuanSeayah,
        'nominal': bagianSaudaraPerempuanSeayahPerOrang,
      });
    }

    if (saudaraSeibu > 0) {
      if (nilaiSaudaraLakiSeibu > 0 && nilaiSaudaraPerempuanSeibu > 0) {
        int bagianSaudaraSeibu = sisaWarisan * rSaudaraSeibu ~/ hasilKPK;
        int bagianSaudaraSeibuPerOrang = bagianSaudaraSeibu ~/ saudaraSeibu;
        results.add({
          'jumlah': nilaiSaudaraLakiSeibu,
          'ahli_waris': 'Saudara Laki Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK Bersama (sisa)',
          'nominal_total': bagianSaudaraSeibu,
          'nominal': bagianSaudaraSeibuPerOrang,
        });
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeibu,
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK Bersama (sisa)',
          'nominal_total': bagianSaudaraSeibu,
          'nominal': bagianSaudaraSeibuPerOrang,
        });
      } else if (nilaiSaudaraLakiSeibu > 0) {
        int bagianSaudaraSeibu = sisaWarisan * rSaudaraSeibu ~/ hasilKPK;
        int bagianSaudaraSeibuPerOrang = bagianSaudaraSeibu ~/ saudaraSeibu;
        results.add({
          'jumlah': nilaiSaudaraLakiSeibu,
          'ahli_waris': 'Saudara Laki Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK (sisa)',
          'nominal_total': bagianSaudaraSeibu,
          'nominal': bagianSaudaraSeibuPerOrang,
        });
      } else if (nilaiSaudaraPerempuanSeibu > 0) {
        int bagianSaudaraSeibu =
            sisaWarisan * rSaudaraSeibu ~/ hasilKPK ~/ saudaraSeibu;
        int bagianSaudaraSeibuPerOrang = bagianSaudaraSeibu ~/ saudaraSeibu;
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeibu,
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '$rSaudaraSeibu / $hasilKPK (sisa)',
          'nominal_total': bagianSaudaraSeibu,
          'nominal': bagianSaudaraSeibuPerOrang,
        });
      }
    }
  }
}
