part of 'main_calculator.dart';

extension CalculateSpecial on CalculatorController {
  bool isCalculateSpecial() {
    late int totalWarisan = nIrst;

    bool isAkdariyah =
        (nilaiKakek > 0 &&
        nilaiIbu > 0 &&
        nilaiSuami > 0 &&
        nilaiSaudaraPerempuanKandung == 1 &&
        nilaiSaudaraLakiKandung == 0 &&
        keturunan == 0 &&
        saudaraSeayah == 0 &&
        saudaraSeibu == 0 &&
        pojok == 0);

    bool isMusytarakahIbu =
        (nilaiIbu > 0 &&
        nilaiSuami > 0 &&
        saudaraSeibu > 1 &&
        nilaiSaudaraLakiKandung > 0 &&
        nilaiSaudaraPerempuanKandung > 0 &&
        keturunan == 0 &&
        saudaraSeayah == 0 &&
        pojok == 0);

    bool isMusytarakahNenek =
        (nilaiNenek2 > 0 &&
        nilaiSuami > 0 &&
        saudaraSeibu > 1 &&
        nilaiSaudaraLakiKandung > 0 &&
        nilaiSaudaraPerempuanKandung > 0 &&
        keturunan == 0 &&
        saudaraSeayah == 0 &&
        pojok == 0);

    bool isUmriyatainSuami =
        (nilaiSuami > 0 &&
        nilaiIbu > 0 &&
        nilaiAyah > 0 &&
        saudara == 0 &&
        keturunan == 0 &&
        pojok == 0);

    bool isUmriyatainIstri =
        (nilaiIstri > 0 &&
        nilaiIbu > 0 &&
        nilaiAyah > 0 &&
        saudara == 0 &&
        keturunan == 0 &&
        pojok == 0);

    if (isAkdariyah) {
      hasilKPK = 27;
      int bagianIbu = totalWarisan * 6 ~/ hasilKPK;
      int bagianSuami = totalWarisan * 9 ~/ hasilKPK;
      int bagianKakek = totalWarisan * 8 ~/ hasilKPK;
      int bagianSaudaraPerempuanKandung = totalWarisan * 4 ~/ hasilKPK;

      results.add({
        'jumlah': nilaiIbu,
        'ahli_waris': 'Ibu',
        'porsi': '6/27',
        'nominal_total': bagianIbu,
        'nominal': bagianIbu,
      });
      results.add({
        'jumlah': nilaiSuami,
        'ahli_waris': 'Suami',
        'porsi': '9/27',
        'nominal_total': bagianSuami,
        'nominal': bagianSuami,
      });
      results.add({
        'jumlah': nilaiKakek,
        'ahli_waris': 'Kakek',
        'porsi': '8/27',
        'nominal_total': bagianKakek,
        'nominal': bagianKakek,
      });
      results.add({
        'jumlah': nilaiSaudaraPerempuanKandung,
        'ahli_waris': 'Saudara Perempuan Kandung',
        'porsi': '4/27',
        'nominal_total': bagianSaudaraPerempuanKandung,
        'nominal': bagianSaudaraPerempuanKandung,
      });
      kasus = 'Akdariyah';

      return true;
    } else if (isMusytarakahIbu) {
      hasilKPK = 12;
      int bagianSuami = totalWarisan * 6 ~/ hasilKPK;
      int bagianIbu = totalWarisan * 2 ~/ hasilKPK;
      int bagianSaudaraLakiKandung = totalWarisan * 2 ~/ hasilKPK;
      int bagianSaudaraLakiKandungPerOrang =
          bagianSaudaraLakiKandung ~/ nilaiSaudaraLakiKandung;
      int bagianSaudaraPerempuanKandung = totalWarisan * 1 ~/ hasilKPK;
      int bagianSaudaraPerempuanKandungPerOrang =
          bagianSaudaraPerempuanKandung ~/ nilaiSaudaraPerempuanKandung;
      int bagianSaudaraSeibu = totalWarisan * 1 ~/ hasilKPK;
      int bagianSaudaraSeibuPerOrang = bagianSaudaraSeibu ~/ saudaraSeibu;

      results.add({
        'jumlah': nilaiSuami,
        'ahli_waris': 'Suami',
        'porsi': '6/12',
        'nominal_total': bagianSuami,
        'nominal': bagianSuami,
      });
      results.add({
        'jumlah': nilaiIbu,
        'ahli_waris': 'Ibu',
        'porsi': '2/12',
        'nominal_total': bagianIbu,
        'nominal': bagianIbu,
      });
      results.add({
        'jumlah': nilaiSaudaraLakiKandung,
        'ahli_waris': 'Saudara Laki-Kandung',
        'porsi': '2/12',
        'nominal_total': bagianSaudaraLakiKandung,
        'nominal': bagianSaudaraLakiKandungPerOrang,
      });
      results.add({
        'jumlah': nilaiSaudaraPerempuanKandung,
        'ahli_waris': 'Saudara Perempuan Kandung',
        'porsi': '1/12',
        'nominal_total': bagianSaudaraPerempuanKandung,
        'nominal': bagianSaudaraPerempuanKandungPerOrang,
      });
      if (nilaiSaudaraLakiSeibu > 0 && nilaiSaudaraPerempuanSeibu > 0) {
        results.add({
          'jumlah': nilaiSaudaraLakiSeibu,
          'ahli_waris': 'Saudara Laki Seibu',
          'porsi': '1/12 Bersama (sisa)',
          'nominal_total': bagianSaudaraSeibu,
          'nominal': bagianSaudaraSeibuPerOrang,
        });
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeibu,
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '1/12 Bersama (sisa)',
          'nominal_total': bagianSaudaraSeibu,
          'nominal': bagianSaudaraSeibuPerOrang,
        });
      } else if (nilaiSaudaraLakiSeibu > 0) {
        results.add({
          'jumlah': nilaiSaudaraLakiSeibu,
          'ahli_waris': 'Saudara Laki Seibu',
          'porsi': '1/12 (sisa)',
          'nominal_total': bagianSaudaraSeibu,
          'nominal': bagianSaudaraSeibuPerOrang,
        });
      } else if (nilaiSaudaraPerempuanSeibu > 0) {
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeibu,
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '1/12 (sisa)',
          'nominal_total': bagianSaudaraSeibu,
          'nominal': bagianSaudaraSeibuPerOrang,
        });
      }
      kasus = 'Musytarakah';

      return true;
    } else if (isMusytarakahNenek) {
      hasilKPK = 12;
      int bagianSuami = totalWarisan * 6 ~/ hasilKPK;
      int bagianNenek = totalWarisan * 2 ~/ hasilKPK;
      int bagianSaudaraLakiKandung = totalWarisan * 2 ~/ hasilKPK;
      int bagianSaudaraLakiKandungPerOrang =
          bagianSaudaraLakiKandung ~/ nilaiSaudaraLakiKandung;
      int bagianSaudaraPerempuanKandung = totalWarisan * 1 ~/ hasilKPK;
      int bagianSaudaraPerempuanKandungPerOrang =
          bagianSaudaraPerempuanKandung ~/ nilaiSaudaraPerempuanKandung;
      int bagianSaudaraSeibu = totalWarisan * 1 ~/ hasilKPK;
      int bagianSaudaraSeibuPerOrang = bagianSaudaraSeibu ~/ saudaraSeibu;

      results.add({
        'jumlah': nilaiSuami,
        'ahli_waris': 'Suami',
        'porsi': '6/12',
        'nominal_total': bagianSuami,
        'nominal': bagianSuami,
      });
      results.add({
        'jumlah': nilaiNenekAyah,
        'ahli_waris': 'Nenek',
        'porsi': '2/12',
        'nominal_total': bagianNenek,
        'nominal': bagianNenek,
      });
      results.add({
        'jumlah': nilaiSaudaraLakiKandung,
        'ahli_waris': 'Saudara Laki-Kandung',
        'porsi': '2/12',
        'nominal_total': bagianSaudaraLakiKandung,
        'nominal': bagianSaudaraLakiKandungPerOrang,
      });
      results.add({
        'jumlah': nilaiSaudaraPerempuanKandung,
        'ahli_waris': 'Saudara Perempuan Kandung',
        'porsi': '1/12',
        'nominal_total': bagianSaudaraPerempuanKandung,
        'nominal': bagianSaudaraPerempuanKandungPerOrang,
      });
      if (nilaiSaudaraLakiSeibu > 0 && nilaiSaudaraPerempuanSeibu > 0) {
        results.add({
          'jumlah': nilaiSaudaraLakiSeibu,
          'ahli_waris': 'Saudara Laki Seibu',
          'porsi': '1/12 Bersama (sisa)',
          'nominal_total': bagianSaudaraSeibu,
          'nominal': bagianSaudaraSeibuPerOrang,
        });
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeibu,
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '1/12 Bersama (sisa)',
          'nominal_total': bagianSaudaraSeibu,
          'nominal': bagianSaudaraSeibuPerOrang,
        });
      } else if (nilaiSaudaraLakiSeibu > 0) {
        results.add({
          'jumlah': nilaiSaudaraLakiSeibu,
          'ahli_waris': 'Saudara Laki Seibu',
          'porsi': '1/12 (sisa)',
          'nominal_total': bagianSaudaraSeibu,
          'nominal': bagianSaudaraSeibuPerOrang,
        });
      } else if (nilaiSaudaraPerempuanSeibu > 0) {
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeibu,
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': '1/12 (sisa)',
          'nominal_total': bagianSaudaraSeibu,
          'nominal': bagianSaudaraSeibuPerOrang,
        });
      }
      kasus = 'Musytarakah';

      return true;
    } else if (isUmriyatainSuami) {
      hasilKPK = 6;
      int bagianSuami = totalWarisan * 3 ~/ hasilKPK;
      int bagianAyah = totalWarisan * 2 ~/ hasilKPK;
      int bagianIbu = totalWarisan * 1 ~/ hasilKPK;

      results.add({
        'jumlah': nilaiSuami,
        'ahli_waris': 'Suami',
        'porsi': '3/6',
        'nominal_total': bagianSuami,
        'nominal': bagianSuami,
      });
      results.add({
        'jumlah': nilaiAyah,
        'ahli_waris': 'Ayah',
        'porsi': '2/6',
        'nominal_total': bagianAyah,
        'nominal': bagianAyah,
      });
      results.add({
        'jumlah': nilaiIbu,
        'ahli_waris': 'Ibu',
        'porsi': '1/6',
        'nominal_total': bagianIbu,
        'nominal': bagianIbu,
      });
      kasus = 'Umriyatain';

      return true;
    } else if (isUmriyatainIstri) {
      hasilKPK = 12;
      int bagianIstri = totalWarisan * 3 ~/ hasilKPK;
      int bagianIstriPerOrang = bagianIstri ~/ nilaiIstri;
      int bagianAyah = totalWarisan * 6 ~/ hasilKPK;
      int bagianIbu = totalWarisan * 3 ~/ hasilKPK;

      results.add({
        'jumlah': nilaiIstri,
        'ahli_waris': 'Istri',
        'porsi': '3/12',
        'nominal_total': bagianIstri,
        'nominal': bagianIstriPerOrang,
      });
      results.add({
        'jumlah': nilaiAyah,
        'ahli_waris': 'Ayah',
        'porsi': '6/12',
        'nominal_total': bagianAyah,
        'nominal': bagianAyah,
      });
      results.add({
        'jumlah': nilaiIbu,
        'ahli_waris': 'Ibu',
        'porsi': '3/12',
        'nominal_total': bagianIbu,
        'nominal': bagianIbu,
      });
      kasus = 'Umriyatain';

      return true;
    }
    return false;
  }
}
