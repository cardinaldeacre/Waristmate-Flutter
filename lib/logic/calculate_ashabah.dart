part of 'main_calculator.dart';

extension CalculateAshabah on CalculatorController {
  void calculateAshabah() {
    print("calculate ashabah");
    print("sisaWarisan: $sisaWarisan");
    print("totalAshabah: $totalAshabah");
    late int nilaiAshabah = sisaWarisan ~/ totalAshabah;
    if (nilaiAyah > 0 && keturunanLaki == 0) {
      if (keturunanPerempuan > 0) {
        int bagianAyah = totalWarisan * 1 ~/ 6 + nilaiAshabah * 2;
        results.add({
          'ahli_waris': 'Ayah',
          'porsi': '$rAyah / $hasilKPK + Ashabah',
          'nominal': bagianAyah,
        });
      } else if (keturunanPerempuan == 0) {
        int bagianAyah = nilaiAshabah * 2;
        results.add({
          'ahli_waris': 'Ayah',
          'porsi': 'Ashabah',
          'nominal': bagianAyah,
        });
      }
    }

    if (nilaiKakek > 0 && keturunanLaki == 0) {
      if (keturunanPerempuan > 0) {
        int bagianKakek = totalWarisan * 1 ~/ 6 + nilaiAshabah * 2;
        results.add({
          'ahli_waris': 'Kakek',
          'porsi': '$rKakek / $hasilKPK + Ashabah',
          'nominal': bagianKakek,
        });
      } else if (keturunanPerempuan == 0) {
        int bagianKakek = nilaiAshabah * 2;
        results.add({
          'ahli_waris': 'Kakek',
          'porsi': 'Ashabah',
          'nominal': bagianKakek,
        });
      }
    }

    if (nilaiAnakLaki > 0) {
      int bagianAnakLaki = nilaiAshabah * 2;
      results.add({
        'ahli_waris': 'Anak Laki-laki',
        'porsi': 'Ashabah',
        'nominal': bagianAnakLaki,
      });
    }

    if (nilaiAnakPerempuan > 0) {
      if (nilaiAnakLaki > 0) {
        int bagianAnakPerempuan = nilaiAshabah;
        results.add({
          'ahli_waris': 'Anak Perempuan',
          'porsi': 'Ashabah',
          'nominal': bagianAnakPerempuan,
        });
      }
    }

    if (nilaiCucuLaki > 0) {
      int bagianCucuLaki = nilaiAshabah * 2;
      results.add({
        'ahli_waris': 'Cucu Laki-laki',
        'porsi': 'Ashabah',
        'nominal': bagianCucuLaki,
      });
    }

    if (nilaiCucuPerempuan > 0) {
      if (nilaiCucuLaki > 0) {
        int bagianCucuPerempuan = nilaiAshabah;
        results.add({
          'ahli_waris': 'Cucu Perempuan',
          'porsi': 'Ashabah',
          'nominal': bagianCucuPerempuan,
        });
      }
    }

    if (nilaiSaudaraLakiKandung > 0) {
      int bagianSaudaraLakiKandung = nilaiAshabah * 2;
      results.add({
        'ahli_waris': 'Saudara Laki-laki Kandung',
        'porsi': 'Ashabah',
        'nominal': bagianSaudaraLakiKandung,
      });
    }

    if (nilaiSaudaraPerempuanKandung > 0) {
      if (nilaiSaudaraLakiKandung > 0 ||
          nilaiAnakPerempuan > 0 ||
          nilaiCucuPerempuan > 0) {
        int bagianSaudaraPerempuanKandung = nilaiAshabah;
        results.add({
          'ahli_waris': 'Saudara Perempuan Kandung',
          'porsi': 'Ashabah',
          'nominal': bagianSaudaraPerempuanKandung,
        });
      }
    }

    if (nilaiSaudaraLakiSeayah > 0) {
      int bagianSaudaraLakiSeayah = nilaiAshabah * 2;
      results.add({
        'ahli_waris': 'Saudara Laki-laki Seayah',
        'porsi': 'Ashabah',
        'nominal': bagianSaudaraLakiSeayah,
      });
    }

    if (nilaiSaudaraPerempuanSeayah > 0) {
      if (nilaiAnakPerempuan > 0 ||
          nilaiCucuPerempuan > 0 ||
          nilaiSaudaraLakiSeayah > 0) {
        int bagianSaudaraPerempuanSeayah = nilaiAshabah;
        results.add({
          'ahli_waris': 'Saudara Perempuan Seayah',
          'porsi': 'Ashabah',
          'nominal': bagianSaudaraPerempuanSeayah,
        });
      }
    }

    if (nilaiAnakLakiSaudaraKandung > 0) {
      int bagianAnakLakiSaudaraKandung = nilaiAshabah * 2;
      results.add({
        'ahli_waris': 'Anak Laki-laki Saudara Kandung',
        'porsi': 'Ashabah',
        'nominal': bagianAnakLakiSaudaraKandung,
      });
    }

    if (nilaiAnakLakiSaudaraSeayah > 0) {
      int bagianAnakLakiSaudaraSeayah = nilaiAshabah * 2;
      results.add({
        'ahli_waris': 'Anak Laki-laki Saudara Seayah',
        'porsi': 'Ashabah',
        'nominal': bagianAnakLakiSaudaraSeayah,
      });
    }

    if (nilaiPamanKandung > 0) {
      int bagianPamanKandung = nilaiAshabah * 2;
      results.add({
        'ahli_waris': 'Paman Kandung',
        'porsi': 'Ashabah',
        'nominal': bagianPamanKandung,
      });
    }

    if (nilaiPamanSekakek > 0) {
      int bagianPamanSekakek = nilaiAshabah * 2;
      results.add({
        'ahli_waris': 'Paman Sekakek',
        'porsi': 'Ashabah',
        'nominal': bagianPamanSekakek,
      });
    }

    if (nilaiAnakLakiPamanKandung > 0) {
      int bagianAnakLakiPamanKandung = nilaiAshabah * 2;
      results.add({
        'ahli_waris': 'Anak Laki-laki Paman Kandung',
        'porsi': 'Ashabah',
        'nominal': bagianAnakLakiPamanKandung,
      });
    }

    if (nilaiAnakLakiPamanSekakek > 0) {
      int bagianAnakLakiPamanSekakek = nilaiAshabah * 2;
      results.add({
        'ahli_waris': 'Anak Laki-laki Paman Sekakek ',
        'porsi': 'Ashabah',
        'nominal': bagianAnakLakiPamanSekakek,
      });
    }
  }
}
