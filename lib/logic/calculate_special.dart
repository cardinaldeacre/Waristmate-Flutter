part of 'main_calculator.dart';

extension CalculateSpecial on CalculatorController {
  bool isCalculateSpecial() {
    late int totalWarisan = nIrst;
    int hasilKPK = 0;

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

    bool isMusyatarakahIbu =
        (nilaiIbu > 0 &&
        nilaiSuami > 0 &&
        saudaraSeibu > 1 &&
        nilaiSaudaraLakiKandung > 0 &&
        nilaiSaudaraPerempuanKandung > 0 &&
        keturunan == 0 &&
        saudaraSeayah == 0 &&
        pojok == 0);

    bool isMusyatarakahNenek =
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
      results.add({'kasus': 'Akdariyah'});

      return true;
    }

    return false;
  }
}
