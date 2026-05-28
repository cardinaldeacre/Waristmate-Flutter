part of 'main_calculator.dart';

extension CalculateAshabah on CalculatorController {
  void calculateAshabah() {
    print("calculate ashabah");
    print("sisaWarisan: $sisaWarisan");
    print("totalAshabah: $totalAshabah");
    late int nominalAshabah = sisaWarisan ~/ totalAshabah;
    if (nilaiAyah > 0 && keturunanLaki == 0) {
      if (keturunanPerempuan > 0) {
        int bagianAyah = totalWarisan * 1 ~/ 6 + nominalAshabah * 2;
        results.add({
          'jumlah': nilaiAyah,
          'ahli_waris': 'Ayah',
          'porsi': '$rAyah / $hasilKPK + Ashabah',
          'nominal': bagianAyah,
        });
      } else if (keturunanPerempuan == 0) {
        int bagianAyah = nominalAshabah * 2;
        results.add({
          'jumlah': nilaiAyah,
          'ahli_waris': 'Ayah',
          'porsi': 'Ashabah',
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
          'nominal': bagianKakek,
        });
      } else if (keturunanPerempuan == 0) {
        int bagianKakek = nominalAshabah * 2;
        results.add({
          'jumlah': nilaiKakek,
          'ahli_waris': 'Kakek',
          'porsi': 'Ashabah',
          'nominal': bagianKakek,
        });
      }
    }

    if (nilaiAnakLaki > 0) {
      int bagianAnakLaki = nominalAshabah * 2 ~/ nilaiAnakLaki;
      results.add({
        'jumlah': nilaiAnakLaki,
        'ahli_waris': 'Anak Laki-laki',
        'porsi': 'Ashabah',
        'nominal': bagianAnakLaki,
      });
    }

    if (nilaiAnakPerempuan > 0) {
      if (nilaiAnakLaki > 0) {
        int bagianAnakPerempuan = nominalAshabah ~/ nilaiAnakPerempuan;
        results.add({
          'jumlah': nilaiAnakPerempuan,
          'ahli_waris': 'Anak Perempuan',
          'porsi': 'Ashabah',
          'nominal': bagianAnakPerempuan,
        });
      }
    }

    if (nilaiCucuLaki > 0) {
      int bagianCucuLaki = nominalAshabah * 2 ~/ nilaiCucuLaki;
      results.add({
        'jumlah': nilaiCucuLaki,
        'ahli_waris': 'Cucu Laki-laki',
        'porsi': 'Ashabah',
        'nominal': bagianCucuLaki,
      });
    }

    if (nilaiCucuPerempuan > 0) {
      if (nilaiCucuLaki > 0) {
        int bagianCucuPerempuan = nominalAshabah ~/ nilaiCucuPerempuan;
        results.add({
          'jumlah': nilaiCucuPerempuan,
          'ahli_waris': 'Cucu Perempuan',
          'porsi': 'Ashabah',
          'nominal': bagianCucuPerempuan,
        });
      }
    }

    if (nilaiSaudaraLakiKandung > 0) {
      int bagianSaudaraLakiKandung =
          nominalAshabah * 2 ~/ nilaiSaudaraLakiKandung;
      results.add({
        'jumlah': nilaiSaudaraLakiKandung,
        'ahli_waris': 'Saudara Laki-laki Kandung',
        'porsi': 'Ashabah',
        'nominal': bagianSaudaraLakiKandung,
      });
    }

    if (nilaiSaudaraPerempuanKandung > 0) {
      if (nilaiSaudaraLakiKandung > 0 ||
          nilaiAnakPerempuan > 0 ||
          nilaiCucuPerempuan > 0) {
        int bagianSaudaraPerempuanKandung =
            nominalAshabah ~/ nilaiSaudaraPerempuanKandung;
        results.add({
          'jumlah': nilaiSaudaraPerempuanKandung,
          'ahli_waris': 'Saudara Perempuan Kandung',
          'porsi': 'Ashabah',
          'nominal': bagianSaudaraPerempuanKandung,
        });
      }
    }

    if (nilaiSaudaraLakiSeayah > 0) {
      int bagianSaudaraLakiSeayah =
          nominalAshabah * 2 ~/ nilaiSaudaraLakiSeayah;
      results.add({
        'jumlah': nilaiSaudaraLakiSeayah,
        'ahli_waris': 'Saudara Laki-laki Seayah',
        'porsi': 'Ashabah',
        'nominal': bagianSaudaraLakiSeayah,
      });
    }

    if (nilaiSaudaraPerempuanSeayah > 0) {
      if (nilaiAnakPerempuan > 0 ||
          nilaiCucuPerempuan > 0 ||
          nilaiSaudaraLakiSeayah > 0) {
        int bagianSaudaraPerempuanSeayah =
            nominalAshabah ~/ nilaiSaudaraPerempuanSeayah;
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeayah,
          'ahli_waris': 'Saudara Perempuan Seayah',
          'porsi': 'Ashabah',
          'nominal': bagianSaudaraPerempuanSeayah,
        });
      }
    }

    if (nilaiAnakLakiSaudaraKandung > 0) {
      int bagianAnakLakiSaudaraKandung =
          nominalAshabah * 2 ~/ nilaiAnakLakiSaudaraKandung;
      results.add({
        'jumlah': nilaiAnakLakiSaudaraKandung,
        'ahli_waris': 'Anak Laki-laki Saudara Kandung',
        'porsi': 'Ashabah',
        'nominal': bagianAnakLakiSaudaraKandung,
      });
    }

    if (nilaiAnakLakiSaudaraSeayah > 0) {
      int bagianAnakLakiSaudaraSeayah =
          nominalAshabah * 2 ~/ nilaiAnakLakiSaudaraSeayah;
      results.add({
        'jumlah': nilaiAnakLakiSaudaraSeayah,
        'ahli_waris': 'Anak Laki-laki Saudara Seayah',
        'porsi': 'Ashabah',
        'nominal': bagianAnakLakiSaudaraSeayah,
      });
    }

    if (nilaiPamanKandung > 0) {
      int bagianPamanKandung = nominalAshabah * 2 ~/ nilaiPamanKandung;
      results.add({
        'jumlah': nilaiPamanKandung,
        'ahli_waris': 'Paman Kandung',
        'porsi': 'Ashabah',
        'nominal': bagianPamanKandung,
      });
    }

    if (nilaiPamanSekakek > 0) {
      int bagianPamanSekakek = nominalAshabah * 2 ~/ nilaiPamanSekakek;
      results.add({
        'jumlah': nilaiPamanSekakek,
        'ahli_waris': 'Paman Sekakek',
        'porsi': 'Ashabah',
        'nominal': bagianPamanSekakek,
      });
    }

    if (nilaiAnakLakiPamanKandung > 0) {
      int bagianAnakLakiPamanKandung =
          nominalAshabah * 2 ~/ nilaiAnakLakiPamanKandung;
      results.add({
        'jumlah': nilaiAnakLakiPamanKandung,
        'ahli_waris': 'Anak Laki-laki Paman Kandung',
        'porsi': 'Ashabah',
        'nominal': bagianAnakLakiPamanKandung,
      });
    }

    if (nilaiAnakLakiPamanSekakek > 0) {
      int bagianAnakLakiPamanSekakek =
          nominalAshabah * 2 ~/ nilaiAnakLakiPamanSekakek;
      results.add({
        'jumlah': nilaiAnakLakiPamanSekakek,
        'ahli_waris': 'Anak Laki-laki Paman Sekakek ',
        'porsi': 'Ashabah',
        'nominal': bagianAnakLakiPamanSekakek,
      });
    }
  }
}
