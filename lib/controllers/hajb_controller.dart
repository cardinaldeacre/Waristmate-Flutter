import 'package:waristmate_app/logic/hajb_validator.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';

extension HajbController on CalculatorController {
  void sinkronisasiHajb() {
    // kakek
    if (HajbValidator.kakekTerhalang(nilaiAyah: nilaiAyah)) {
      if (nilaiKakek > 0) {
        results.add({
          'jumlah': nilaiKakek,
          'ahli_waris': 'Kakek',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiKakek = 0;
      }
    }

    if (HajbValidator.nenekTerhalang(nilaiIbu: nilaiIbu)) {
      if (nilaiNenekAyah > 0) {
        results.add({
          'jumlah': nilaiNenekAyah,
          'ahli_waris': 'Nenek Ayah',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiNenekAyah = 0;
      }
      if (nilaiNenekIbu > 0) {
        results.add({
          'jumlah': nilaiNenekIbu,
          'ahli_waris': 'Nenek Ibu',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiNenekIbu = 0;
      }
    }

    if (HajbValidator.cucuLakiTerhalang(jmlAnakLaki: nilaiAnakLaki)) {
      if (nilaiCucuLaki > 0) {
        results.add({
          'jumlah': nilaiCucuLaki,
          'ahli_waris': 'Cucu Laki-laki',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiCucuLaki = 0;
      }
    }

    if (HajbValidator.cucuPerempuanTerhalang(
      jmlAnakLaki: nilaiAnakLaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
    )) {
      if (nilaiCucuPerempuan > 0) {
        results.add({
          'jumlah': nilaiCucuPerempuan,
          'ahli_waris': 'Cucu Perempuan',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiCucuPerempuan = 0;
      }
    }

    if (HajbValidator.saudaraLakiKandungTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
    )) {
      if (nilaiSaudaraLakiKandung > 0) {
        results.add({
          'jumlah': nilaiSaudaraLakiKandung,
          'ahli_waris': 'Saudara Laki Kandung',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiSaudaraLakiKandung = 0;
      }
    }

    if (HajbValidator.saudaraPerempuanKandungTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
    )) {
      if (nilaiSaudaraPerempuanKandung > 0) {
        results.add({
          'jumlah': nilaiSaudaraPerempuanKandung,
          'ahli_waris': 'Saudara Perempuan Kandung',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiSaudaraPerempuanKandung = 0;
      }
    }

    if (HajbValidator.saudaraLakiSeayahTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
    )) {
      if (nilaiSaudaraLakiSeayah > 0) {
        results.add({
          'jumlah': nilaiSaudaraLakiSeayah,
          'ahli_waris': 'Saudara Laki Seayah',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiSaudaraLakiSeayah = 0;
      }
    }

    if (HajbValidator.saudaraPerempuanSeayahTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
    )) {
      if (nilaiSaudaraPerempuanSeayah > 0) {
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeayah,
          'ahli_waris': 'Saudara Perempuan Seayah',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiSaudaraPerempuanSeayah = 0;
      }
    }

    if (HajbValidator.saudaraLakiSeibuTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
    )) {
      if (nilaiSaudaraLakiSeibu > 0) {
        results.add({
          'jumlah': nilaiSaudaraLakiSeibu,
          'ahli_waris': 'Saudara Laki Seibu',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiSaudaraLakiSeibu = 0;
      }
    }

    if (HajbValidator.saudaraPerempuanSeibuTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
    )) {
      if (nilaiSaudaraPerempuanSeibu > 0) {
        results.add({
          'jumlah': nilaiSaudaraPerempuanSeibu,
          'ahli_waris': 'Saudara Perempuan Seibu',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiSaudaraPerempuanSeibu = 0;
      }
    }

    if (HajbValidator.anakLakiSaudaraKandungTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
    )) {
      if (nilaiAnakLakiSaudaraKandung > 0) {
        results.add({
          'jumlah': nilaiAnakLakiSaudaraKandung,
          'ahli_waris': 'Anak Laki Saudara Kandung',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiAnakLakiSaudaraKandung = 0;
      }
    }

    if (HajbValidator.anakLakiSaudaraSeayahTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
    )) {
      if (nilaiAnakLakiSaudaraSeayah > 0) {
        results.add({
          'jumlah': nilaiAnakLakiSaudaraSeayah,
          'ahli_waris': 'Anak Laki Saudara Seayah',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiAnakLakiSaudaraSeayah = 0;
      }
    }

    if (HajbValidator.pamanKandungTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
    )) {
      if (nilaiPamanKandung > 0) {
        results.add({
          'jumlah': nilaiPamanKandung,
          'ahli_waris': 'Paman Kandung',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiPamanKandung = 0;
      }
    }

    if (HajbValidator.pamanSekakekTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanKandung: nilaiPamanKandung,
    )) {
      if (nilaiPamanSekakek > 0) {
        results.add({
          'jumlah': nilaiPamanSekakek,
          'ahli_waris': 'Paman Sekakek',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiPamanSekakek = 0;
      }
    }

    if (HajbValidator.anakLakiPamanKandungTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanKandung: nilaiPamanKandung,
      jmlPamanSekakek: nilaiPamanSekakek,
    )) {
      if (nilaiAnakLakiPamanKandung > 0) {
        results.add({
          'jumlah': nilaiAnakLakiPamanKandung,
          'ahli_waris': 'Anak Laki Paman Kandung',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiAnakLakiPamanKandung = 0;
      }
    }

    if (HajbValidator.anakLakiPamanSekakekTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanKandung: nilaiPamanKandung,
      jmlPamanSekakek: nilaiPamanSekakek,
      jmlAnakLakiPamanSekandung: nilaiAnakLakiPamanKandung,
    )) {
      if (nilaiAnakLakiPamanSekakek > 0) {
        results.add({
          'jumlah': nilaiAnakLakiPamanSekakek,
          'ahli_waris': 'Anak Laki Paman Sekakek',
          'porsi': 'Mahjub',
          'nominal_total': 0,
          'nominal': 0,
        });
        nilaiAnakLakiPamanSekakek = 0;
      }
    }
  }

  // kakek
  String? get penghalangKakek {
    return HajbValidator.penghalangKakek(nilaiAyah: nilaiAyah);
  }

  String? get penghalangNenek {
    return HajbValidator.penghalangNenek(nilaiIbu: nilaiIbu);
  }

  // cucu laki-laki
  String? get penghalangCucuLaki {
    return HajbValidator.penghalangCucuLaki(jmlAnakLaki: nilaiAnakLaki);
  }

  // cucu perempuan
  String? get penghalangCucuPerempuan {
    return HajbValidator.penghalangCucuPerempuan(
      jmlAnakLaki: nilaiAnakLaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
    );
  }

  // saudara kandung
  String? get penghalangSaudaraLakiKandung {
    return HajbValidator.penghalangSaudaraLakiKandung(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
    );
  }

  // saudari kandung
  String? get penghalangSaudaraPerempuanKandung {
    return HajbValidator.penghalangSaudaraPerempuanKandung(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
    );
  }

  // saudara seayah
  String? get penghalangSaudaraLakiSeayah {
    return HajbValidator.penghalangSaudaraLakiSeayah(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
    );
  }

  // saudari seayah
  String? get penghalangSaudaraPerempuanSeayah {
    return HajbValidator.penghalangSaudaraPerempuanSeayah(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
    );
  }

  // saudara seibu
  String? get penghalangSaudaraLakiSeibu {
    return HajbValidator.penghalangSaudaraLakiSeibu(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
    );
  }

  // anak laki saudara kandung
  String? get penghalangAnakLakiSaudaraKandung {
    return HajbValidator.penghalangAnakLakiSaudaraKandung(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
    );
  }

  // anak laki saudara seayah
  String? get penghalangAnakLakiSaudaraSeayah {
    return HajbValidator.penghalangAnakLakiSaudaraSeayah(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
    );
  }

  // paman sekandung
  String? get penghalangPamanSekandung {
    return HajbValidator.penghalangPamanKandung(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
    );
  }

  // paman sekakek
  String? get penghalangPamanSekakek {
    return HajbValidator.penghalangPamanSekakek(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanKandung: nilaiPamanKandung,
    );
  }

  // anak laki paman sekandung
  String? get penghalangAnakLakiPamanKandung {
    return HajbValidator.penghalangAnakLakiPamanKandung(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanKandung: nilaiPamanKandung,
      jmlPamanSekakek: nilaiPamanSekakek,
    );
  }

  // anak laki paman sekakek
  String? get penghalangAnakLakiPamanSekakek {
    return HajbValidator.penghalangAnakLakiPamanSekakek(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCucuLaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuPerempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanKandung: nilaiPamanKandung,
      jmlPamanSekakek: nilaiPamanSekakek,
      jmlAnakLakiPamanSekandung: nilaiAnakLakiPamanKandung,
    );
  }
}
