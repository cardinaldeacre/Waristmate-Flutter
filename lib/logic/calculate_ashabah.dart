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
          'ahli waris': 'Ayah',
          'bagian': '$rAyah / $hasilKPK + Ashabah',
          'nominal': bagianAyah,
        });
      } else if (keturunanPerempuan == 0) {
        int bagianAyah = nilaiAshabah * 2;
        results.add({
          'ahli waris': 'Ayah',
          'bagian': 'Ashabah',
          'nominal': bagianAyah,
        });
      }
    }

    if (nilaiKakek > 0 && keturunanLaki == 0) {
      if (keturunanPerempuan > 0) {
        int bagianKakek = totalWarisan * 1 ~/ 6 + nilaiAshabah * 2;
        results.add({
          'ahli waris': 'Kakek',
          'bagian': '$rKakek / $hasilKPK + Ashabah',
          'nominal': bagianKakek,
        });
      } else if (keturunanPerempuan == 0) {
        int bagianKakek = nilaiAshabah * 2;
        results.add({
          'ahli waris': 'Kakek',
          'bagian': 'Ashabah',
          'nominal': bagianKakek,
        });
      }
    }

    if (nilaiAnakLaki > 0) {
      int bagianAnakLaki = nilaiAshabah * 2;
      results.add({
        'ahli waris': 'Anak Laki-laki',
        'bagian': 'Ashabah',
        'nominal': bagianAnakLaki,
      });
    }

    if (nilaiAnakPerempuan > 0) {
      if (nilaiAnakLaki > 0) {
        int bagianAnakPerempuan = nilaiAshabah;
        results.add({
          'ahli waris': 'Anak Perempuan',
          'bagian': 'Ashabah',
          'nominal': bagianAnakPerempuan,
        });
      }
    }

    if (nilaiCucuLaki > 0) {
      int bagianCucuLaki = nilaiAshabah * 2;
      results.add({
        'ahli waris': 'Cucu Laki-laki',
        'bagian': 'Ashabah',
        'nominal': bagianCucuLaki,
      });
    }

    if (nilaiCucuPerempuan > 0) {
      if (nilaiCucuLaki > 0) {
        int bagianCucuPerempuan = nilaiAshabah;
        results.add({
          'ahli waris': 'Cucu Perempuan',
          'bagian': 'Ashabah',
          'nominal': bagianCucuPerempuan,
        });
      }
    }

    if (nilaiSaudaraLakiKandung > 0) {
      int bagianSaudaraLakiKandung = nilaiAshabah * 2;
      results.add({
        'ahli waris': 'Saudara Laki-laki Kandung',
        'bagian': 'Ashabah',
        'nominal': bagianSaudaraLakiKandung,
      });
    }

    if (nilaiSaudaraPerempuanKandung > 0) {
      if (nilaiSaudaraLakiKandung > 0 ||
          nilaiAnakPerempuan > 0 ||
          nilaiCucuPerempuan > 0) {
        int bagianSaudaraPerempuanKandung = nilaiAshabah;
        results.add({
          'ahli waris': 'Saudara Perempuan Kandung',
          'bagian': 'Ashabah',
          'nominal': bagianSaudaraPerempuanKandung,
        });
      }
    }

    if (nilaiSaudaraLakiSeayah > 0) {
      int bagianSaudaraLakiSeayah = nilaiAshabah * 2;
      results.add({
        'ahli waris': 'Saudara Laki-laki Seayah',
        'bagian': 'Ashabah',
        'nominal': bagianSaudaraLakiSeayah,
      });
    }

    if (nilaiSaudaraPerempuanSeayah > 0) {
      if (nilaiAnakPerempuan > 0 ||
          nilaiCucuPerempuan > 0 ||
          nilaiSaudaraLakiSeayah > 0) {
        int bagianSaudaraPerempuanSeayah = nilaiAshabah;
        results.add({
          'ahli waris': 'Saudara Perempuan Seayah',
          'bagian': 'Ashabah',
          'nominal': bagianSaudaraPerempuanSeayah,
        });
      }
    }

    if (nilaiAnakLakiSaudaraKandung > 0) {
      int bagianAnakLakiSaudaraKandung = nilaiAshabah * 2;
      results.add({
        'ahli waris': 'Anak Laki-laki Saudara Kandung',
        'bagian': 'Ashabah',
        'nominal': bagianAnakLakiSaudaraKandung,
      });
    }

    if (nilaiAnakLakiSaudaraSeayah > 0) {
      int bagianAnakLakiSaudaraSeayah = nilaiAshabah * 2;
      results.add({
        'ahli waris': 'Anak Laki-laki Saudara Seayah',
        'bagian': 'Ashabah',
        'nominal': bagianAnakLakiSaudaraSeayah,
      });
    }

    if (nilaiPamanKandung > 0) {
      int bagianPamanKandung = nilaiAshabah * 2;
      results.add({
        'ahli waris': 'Paman Kandung',
        'bagian': 'Ashabah',
        'nominal': bagianPamanKandung,
      });
    }

    if (nilaiPamanSekakek > 0) {
      int bagianPamanSekakek = nilaiAshabah * 2;
      results.add({
        'ahli waris': 'Paman Sekakek',
        'bagian': 'Ashabah',
        'nominal': bagianPamanSekakek,
      });
    }

    if (nilaiAnakLakiPamanKandung > 0) {
      int bagianAnakLakiPamanKandung = nilaiAshabah * 2;
      results.add({
        'ahli waris': 'Anak Laki-laki Paman Kandung',
        'bagian': 'Ashabah',
        'nominal': bagianAnakLakiPamanKandung,
      });
    }

    if (nilaiAnakLakiPamanSekakek > 0) {
      int bagianAnakLakiPamanSekakek = nilaiAshabah * 2;
      results.add({
        'ahli waris': 'Anak Laki-laki Paman Sekakek ',
        'bagian': 'Ashabah',
        'nominal': bagianAnakLakiPamanSekakek,
      });
    }
  }
}
