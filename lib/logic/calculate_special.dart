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
        (nilaiIbu > 0 &&
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

      results.add({'ahli_waris': 'Ibu', 'porsi': '6/27', 'nominal': bagianIbu});
      results.add({
        'ahli_waris': 'Suami',
        'porsi': '9/27',
        'nominal': bagianSuami,
      });
      results.add({
        'ahli_waris': 'Kakek',
        'porsi': '8/27',
        'nominal': bagianKakek,
      });
      results.add({
        'ahli_waris': 'Saudara Perempuan Kandung',
        'porsi': '4/27',
        'nominal': bagianSaudaraPerempuanKandung,
      });
      kasus = 'Akdariyah';

      return true;
    } else if (isMusytarakahIbu) {
      hasilKPK = 12;
      int bagianSuami = totalWarisan * 6 ~/ hasilKPK;
      int bagianIbu = totalWarisan * 2 ~/ hasilKPK;
      int bagianSaudaraLakiKandung = totalWarisan * 2 ~/ hasilKPK;
      int bagianSaudaraPerempuanKandung = totalWarisan * 1 ~/ hasilKPK;
      int bagianSaudaraSeibu = totalWarisan * 1 ~/ hasilKPK ~/ saudaraSeibu;

      results.add({
        'ahli_waris': 'Suami',
        'porsi': '6/12',
        'nominal': bagianSuami,
      });
      results.add({'ahli_waris': 'Ibu', 'porsi': '2/12', 'nominal': bagianIbu});
      results.add({
        'ahli_waris': 'Saudara Laki-Kandung',
        'porsi': '2/12',
        'nominal': bagianSaudaraLakiKandung,
      });
      results.add({
        'ahli_waris': 'Saudara Perempuan Kandung',
        'porsi': '1/12',
        'nominal': bagianSaudaraPerempuanKandung,
      });
      results.add({
        'ahli_waris': 'Saudara Seibu',
        'porsi': '1/12',
        'nominal': bagianSaudaraSeibu,
      });
      kasus = 'Musytarakah';

      return true;
    } else if (isMusytarakahNenek) {
      hasilKPK = 12;
      int bagianSuami = totalWarisan * 6 ~/ hasilKPK;
      int bagianNenek = totalWarisan * 2 ~/ hasilKPK;
      int bagianSaudaraLakiKandung = totalWarisan * 2 ~/ hasilKPK;
      int bagianSaudaraPerempuanKandung = totalWarisan * 1 ~/ hasilKPK;
      int bagianSaudaraSeibu = totalWarisan * 1 ~/ hasilKPK ~/ saudaraSeibu;

      results.add({
        'ahli_waris': 'Suami',
        'porsi': '6/12',
        'nominal': bagianSuami,
      });
      results.add({
        'ahli_waris': 'Nenek',
        'porsi': '2/12',
        'nominal': bagianNenek,
      });
      results.add({
        'ahli_waris': 'Saudara Laki-Kandung',
        'porsi': '2/12',
        'nominal': bagianSaudaraLakiKandung,
      });
      results.add({
        'ahli_waris': 'Saudara Perempuan Kandung',
        'porsi': '1/12',
        'nominal': bagianSaudaraPerempuanKandung,
      });
      results.add({
        'ahli_waris': 'Saudara Seibu',
        'porsi': '1/12',
        'nominal': bagianSaudaraSeibu,
      });
      kasus = 'Musytarakah';

      return true;
    } else if (isUmriyatainSuami) {
      hasilKPK = 6;
      int bagianSuami = totalWarisan * 3 ~/ hasilKPK;
      int bagianAyah = totalWarisan * 2 ~/ hasilKPK;
      int bagianIbu = totalWarisan * 1 ~/ hasilKPK;

      results.add({
        'ahli_waris': 'Suami',
        'porsi': '3/6',
        'nominal': bagianSuami,
      });
      results.add({
        'ahli_waris': 'Ayah',
        'porsi': '2/6',
        'nominal': bagianAyah,
      });
      results.add({'ahli_waris': 'Ibu', 'porsi': '1/6', 'nominal': bagianIbu});
      kasus = 'Umriyatain';

      return true;
    } else if (isUmriyatainIstri) {
      hasilKPK = 12;
      int bagianIstri = totalWarisan * 3 ~/ hasilKPK;
      int bagianAyah = totalWarisan * 6 ~/ hasilKPK;
      int bagianIbu = totalWarisan * 3 ~/ hasilKPK;

      results.add({
        'ahli_waris': 'Istri',
        'porsi': '3/12',
        'nominal': bagianIstri,
      });
      results.add({
        'ahli_waris': 'Ayah',
        'porsi': '6/12',
        'nominal': bagianAyah,
      });
      results.add({'ahli_waris': 'Ibu', 'porsi': '3/12', 'nominal': bagianIbu});
      kasus = 'Umriyatain';

      return true;
    }
    return false;
  }
}
