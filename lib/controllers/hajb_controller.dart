import 'package:waristmate_app/logic/hajb_validator.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';

extension HajbController on CalculatorController {
  void sinkronisasiHajb() {
    // kakek
    if (HajbValidator.kakekTerhalang(nilaiAyah: nilaiAyah)) {
      if (nilaiKakek > 0) {
        penghalang.add({'pewaris': 'Kakek', 'penghalang': penghalangKakek});
        nilaiKakek = 0;
      }
    }

    if (HajbValidator.nenekTerhalang(nilaiIbu: nilaiIbu)) {
      if (nilaiNenekAyah > 0) {
        penghalang.add({
          'pewaris': 'Nenek Ayah',
          'penghalang': penghalangNenek,
        });
        nilaiNenekAyah = 0;
      }
      if (nilaiNenekIbu > 0) {
        penghalang.add({'pewaris': 'Nenek Ibu', 'penghalang': penghalangNenek});
        nilaiNenekIbu = 0;
      }
    }

    if (HajbValidator.cucuLakiTerhalang(jmlAnakLaki: nilaiAnakLaki)) {
      if (nilaiCucuLaki > 0) {
        penghalang.add({
          'pewaris': 'Cucu Laki-laki',
          'penghalang': penghalangCucuLaki,
        });
        nilaiCucuLaki = 0;
      }
    }

    if (HajbValidator.cucuPerempuanTerhalang(
      jmlAnakLaki: nilaiAnakLaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
    )) {
      if (nilaiCucuPerempuan > 0) {
        penghalang.add({
          'pewaris': 'Cucu Perempuan',
          'penghalang': penghalangCucuPerempuan,
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
        penghalang.add({
          'pewaris': 'Saudara Laki Kandung',
          'penghalang': penghalangSaudaraLakiKandung,
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
        penghalang.add({
          'pewaris': 'Saudara Perempuan Kandung',
          'penghalang': penghalangSaudaraPerempuanKandung,
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
        penghalang.add({
          'pewaris': 'Saudara Laki Seayah',
          'penghalang': penghalangSaudaraLakiSeayah,
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
        penghalang.add({
          'pewaris': 'Saudara Perempuan Seayah',
          'penghalang': penghalangSaudaraPerempuanSeayah,
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
        penghalang.add({
          'pewaris': 'Saudara Laki Seibu',
          'penghalang': penghalangSaudaraLakiSeibu,
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
        penghalang.add({
          'pewaris': 'Saudara Perempuan Seibu',
          'penghalang': penghalangSaudaraPerempuanSeibu,
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
        penghalang.add({
          'pewaris': 'Anak Laki Saudara Kandung',
          'penghalang': penghalangAnakLakiSaudaraKandung,
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
        penghalang.add({
          'pewaris': 'Anak Laki Saudara Seayah',
          'penghalang': penghalangAnakLakiSaudaraSeayah,
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
        penghalang.add({
          'pewaris': 'Paman Kandung',
          'penghalang': penghalangPamanSekakek,
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
        penghalang.add({
          'pewaris': 'Paman Sekakek',
          'penghalang': penghalangPamanSekakek,
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
        penghalang.add({
          'pewaris': 'Anak Laki Paman Kandung',
          'penghalang': penghalangAnakLakiPamanKandung,
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
        penghalang.add({
          'pewaris': 'Anak Laki Paman Sekakek',
          'penghalang': penghalangAnakLakiPamanSekakek,
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

  String? get penghalangSaudaraPerempuanSeibu {
    return HajbValidator.penghalangSaudaraPerempuanSeibu(
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
