part of 'main_calculator.dart';

extension CalculateAshabah on CalculatorController {
  void calculateAshabah() {
    debugPrint("calculate ashabah");
    debugPrint("sisaWarisan: $sisaWarisan");
    debugPrint("totalAshabah: $totalAshabah");
    nominalAshabah = sisaWarisan ~/ totalAshabah;
    if (nilaiAyah > 0 && keturunanLaki == 0) {
      if (keturunanPerempuan > 0) {
        int bagianAyah = totalWarisan * 1 ~/ 6 + nominalAshabah * 2;
        results.add({
          'jumlah': nilaiAyah,
          'ahli_waris': 'Ayah',
          'porsi': '$rAyah / $hasilKPK + Ashabah',
          'nominal_total': bagianAyah,
          'nominal': bagianAyah,
        });
      } else if (keturunanPerempuan == 0) {
        int bagianAyah = nominalAshabah * 2;
        results.add({
          'jumlah': nilaiAyah,
          'ahli_waris': 'Ayah',
          'porsi': 'Ashabah',
          'nominal_total': bagianAyah,
          'nominal': bagianAyah,
        });
      }
    }

    if (nilaiKakek > 0 && keturunanLaki == 0) {
      if (keturunanPerempuan > 0) {
        int bagianKakek = totalWarisan * 1 ~/ 6 + nominalAshabah * 2;
        results.add({
          'jumlah': nilaiKakek,
          'ahli_waris': 'Kakek',
          'porsi': '$rKakek / $hasilKPK + Ashabah',
          'nominal_total': bagianKakek,
          'nominal': bagianKakek,
        });
      } else if (keturunanPerempuan == 0) {
        int bagianKakek = nominalAshabah * 2;
        results.add({
          'jumlah': nilaiKakek,
          'ahli_waris': 'Kakek',
          'porsi': 'Ashabah',
          'nominal_total': bagianKakek,
          'nominal': bagianKakek,
        });
      }
    }

    if (nilaiAnakLaki > 0) {
      int bagianAnakLaki = nominalAshabah * 2 * nilaiAnakLaki;
      int bagianAnakLakiPerOrang = bagianAnakLaki ~/ nilaiAnakLaki;
      results.add({
        'jumlah': nilaiAnakLaki,
        'ahli_waris': 'Anak Laki-laki',
        'porsi': 'Ashabah',
        'nominal_total': bagianAnakLaki,
        'nominal': bagianAnakLakiPerOrang,
      });
    }

    if (nilaiAnakPerempuan > 0) {
      if (nilaiAnakLaki > 0) {
        int bagianAnakPerempuan = nominalAshabah * nilaiAnakPerempuan;
        int bagianAnakPerempuanPerOrang =
            bagianAnakPerempuan ~/ nilaiAnakPerempuan;
        results.add({
          'jumlah': nilaiAnakPerempuan,
          'ahli_waris': 'Anak Perempuan',
          'porsi': 'Ashabah',
          'nominal_total': bagianAnakPerempuan,
          'nominal': bagianAnakPerempuanPerOrang,
        });
      }
    }

    if (nilaiCucuLaki > 0) {
      int bagianCucuLaki = nominalAshabah * 2 * nilaiCucuLaki;
      int bagianCucuLakiPerOrang = bagianCucuLaki ~/ nilaiCucuLaki;
      results.add({
        'jumlah': nilaiCucuLaki,
        'ahli_waris': 'Cucu Laki-laki',
        'porsi': 'Ashabah',
        'nominal_total': bagianCucuLaki,
        'nominal': bagianCucuLakiPerOrang,
      });
    }

    if (nilaiCucuPerempuan > 0) {
      if (nilaiCucuLaki > 0) {
        int bagianCucuPerempuan = nominalAshabah * nilaiCucuPerempuan;
        int bagianCucuPerempuanPerOrang =
            bagianCucuPerempuan ~/ nilaiCucuPerempuan;
        results.add({
          'jumlah': nilaiCucuPerempuan,
          'ahli_waris': 'Cucu Perempuan',
          'porsi': 'Ashabah',
          'nominal_total': bagianCucuPerempuan,
          'nominal': bagianCucuPerempuanPerOrang,
        });
      }
    }

    if (nilaiSaudaraLakiKandung > 0) {
      int bagianSaudaraLakiKandung =
          nominalAshabah * 2 * nilaiSaudaraLakiKandung;
      int bagianSaudaraLakiKandungPerOrang =
          bagianSaudaraLakiKandung ~/ nilaiSaudaraLakiKandung;

      results.add({
        'jumlah': nilaiSaudaraLakiKandung,
        'ahli_waris': 'Saudara Laki-laki Kandung',
        'porsi': 'Ashabah',
        'nominal_total': bagianSaudaraLakiKandung,
        'nominal': bagianSaudaraLakiKandungPerOrang,
      });
    }

    if (nilaiSaudaraPerempuanKandung > 0) {
      if (nilaiSaudaraLakiKandung > 0 ||
          nilaiAnakPerempuan > 0 ||
          nilaiCucuPerempuan > 0) {
        int bagianSaudaraPerempuanKandung =
            nominalAshabah * nilaiSaudaraPerempuanKandung;
        int bagianSaudaraPerempuanKandungPerOrang =
            bagianSaudaraPerempuanKandung ~/ nilaiSaudaraPerempuanKandung;
        results.add({
          'jumlah': nilaiSaudaraPerempuanKandung,
          'ahli_waris': 'Saudara Perempuan Kandung',
          'porsi': 'Ashabah',
          'nominal_total': bagianSaudaraPerempuanKandung,
          'nominal': bagianSaudaraPerempuanKandungPerOrang,
        });
      }
    }

    if (nilaiSaudaraLakiSeayah > 0) {
      int bagianSaudaraLakiSeayah = nominalAshabah * 2 * nilaiSaudaraLakiSeayah;
      int bagianSaudaraLakiSeayahPerOrang =
          bagianSaudaraLakiSeayah ~/ nilaiSaudaraLakiSeayah;
      results.add({
        'jumlah': nilaiSaudaraLakiSeayah,
        'ahli_waris': 'Saudara Laki-laki Seayah',
        'porsi': 'Ashabah',
        'nominal_total': bagianSaudaraLakiSeayah,
        'nominal': bagianSaudaraLakiSeayahPerOrang,
      });
    }

    if (nilaiSaudaraPerempuanSeayah > 0) {
      if (nilaiAnakPerempuan > 0 ||
          nilaiCucuPerempuan > 0 ||
          nilaiSaudaraLakiSeayah > 0) {
        int bagianSaudaraPerempuanSeayah =
            nominalAshabah * nilaiSaudaraPerempuanSeayah;
        int bagianSaudaraPerempuanSeayahPerOrang =
            bagianSaudaraPerempuanSeayah ~/ nilaiSaudaraPerempuanSeayah;
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeayah,
          'ahli_waris': 'Saudara Perempuan Seayah',
          'porsi': 'Ashabah',
          'nominal_total': bagianSaudaraPerempuanSeayah,
          'nominal': bagianSaudaraPerempuanSeayahPerOrang,
        });
      }
    }

    if (nilaiAnakLakiSaudaraKandung > 0) {
      int bagianAnakLakiSaudaraKandung =
          nominalAshabah * 2 * nilaiAnakLakiSaudaraKandung;
      int bagianAnakLakiSaudaraKandungPerOrang =
          bagianAnakLakiSaudaraKandung ~/ nilaiAnakLakiSaudaraKandung;
      results.add({
        'jumlah': nilaiAnakLakiSaudaraKandung,
        'ahli_waris': 'Anak Laki-laki Saudara Kandung',
        'porsi': 'Ashabah',
        'nominal_total': bagianAnakLakiSaudaraKandung,
        'nominal': bagianAnakLakiSaudaraKandungPerOrang,
      });
    }

    if (nilaiAnakLakiSaudaraSeayah > 0) {
      int bagianAnakLakiSaudaraSeayah =
          nominalAshabah * 2 * nilaiAnakLakiSaudaraSeayah;
      int bagianAnakLakiSaudaraSeayahPerOrang =
          bagianAnakLakiSaudaraSeayah ~/ nilaiAnakLakiSaudaraSeayah;
      results.add({
        'jumlah': nilaiAnakLakiSaudaraSeayah,
        'ahli_waris': 'Anak Laki-laki Saudara Seayah',
        'porsi': 'Ashabah',
        'nominal_total': bagianAnakLakiSaudaraSeayah,
        'nominal': bagianAnakLakiSaudaraSeayahPerOrang,
      });
    }

    if (nilaiPamanKandung > 0) {
      int bagianPamanKandung = nominalAshabah * 2 * nilaiPamanKandung;
      int bagianPamanKandungPerOrang = bagianPamanKandung ~/ nilaiPamanKandung;
      results.add({
        'jumlah': nilaiPamanKandung,
        'ahli_waris': 'Paman Kandung',
        'porsi': 'Ashabah',
        'nominal_total': bagianPamanKandung,
        'nominal': bagianPamanKandungPerOrang,
      });
    }

    if (nilaiPamanSekakek > 0) {
      int bagianPamanSekakek = nominalAshabah * 2 * nilaiPamanSekakek;
      int bagianPamanSekakekPerOrang = bagianPamanSekakek ~/ nilaiPamanSekakek;
      results.add({
        'jumlah': nilaiPamanSekakek,
        'ahli_waris': 'Paman Sekakek',
        'porsi': 'Ashabah',
        'nominal_total': bagianPamanSekakek,
        'nominal': bagianPamanSekakekPerOrang,
      });
    }

    if (nilaiAnakLakiPamanKandung > 0) {
      int bagianAnakLakiPamanKandung =
          nominalAshabah * 2 * nilaiAnakLakiPamanKandung;
      int bagianAnakLakiPamanKandungPerOrang =
          bagianAnakLakiPamanKandung ~/ nilaiAnakLakiPamanKandung;
      results.add({
        'jumlah': nilaiAnakLakiPamanKandung,
        'ahli_waris': 'Anak Laki-laki Paman Kandung',
        'porsi': 'Ashabah',
        'nominal_total': bagianAnakLakiPamanKandung,
        'nominal': bagianAnakLakiPamanKandungPerOrang,
      });
    }

    if (nilaiAnakLakiPamanSekakek > 0) {
      int bagianAnakLakiPamanSekakek =
          nominalAshabah * 2 * nilaiAnakLakiPamanSekakek;
      int bagianAnakLakiPamanSekakekPerOrang =
          bagianAnakLakiPamanSekakek ~/ nilaiAnakLakiPamanSekakek;
      results.add({
        'jumlah': nilaiAnakLakiPamanSekakek,
        'ahli_waris': 'Anak Laki-laki Paman Sekakek ',
        'porsi': 'Ashabah',
        'nominal_total': bagianAnakLakiPamanSekakek,
        'nominal': bagianAnakLakiPamanSekakekPerOrang,
      });
    }
  }
}
