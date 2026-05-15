import 'package:waristmate_app/logic/hajb_validator.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';

extension HajbController on CalculatorController {
  void sinkronisasiHajb() {
    // kakek
    if (HajbValidator.kakekTerhalang(nilaiAyah: nilaiAyah)) {
      nilaiKakek = 0;
    }

    if (HajbValidator.nenekTerhalang(nilaiIbu: nilaiIbu)) {
      nilaiNenekIbu = 0;
      nilaiNenekAyah = 0;
    }

    if (HajbValidator.cucuLakiTerhalang(jmlAnakLaki: nilaiAnakLaki)) {
      nilaiCuculaki = 0;
    }

    if (HajbValidator.cucuPerempuanTerhalang(
      jmlAnakLaki: nilaiAnakLaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
    )) {
      nilaiCucuperempuan = 0;
    }

    if (HajbValidator.saudaraLakiKandungTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
    )) {
      nilaiSaudaraLakiKandung = 0;
    }

    if (HajbValidator.saudaraPerempuanKandungTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    )) {
      nilaiSaudaraPerempuanKandung = 0;
    }

    if (HajbValidator.saudaraLakiSeayahTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    )) {
      nilaiSaudaraLakiSeayah = 0;
    }

    if (HajbValidator.saudaraPerempuanSeayahTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    )) {
      nilaiSaudaraPerempuanSeayah = 0;
    }

    if (HajbValidator.saudaraLakiSeibuTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    )) {
      nilaiSaudaraLakiSeibu = 0;
    }

    if (HajbValidator.saudaraPerempuanSeibuTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    )) {
      nilaiSaudaraPerempuanSeibu = 0;
    }

    if (HajbValidator.anakLakiSaudaraKandungTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
    )) {
      nilaiAnakLakiSaudaraKandung = 0;
    }

    if (HajbValidator.anakLakiSaudaraSeayahTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
    )) {
      nilaiAnakLakiSaudaraSeayah = 0;
    }

    if (HajbValidator.pamanKandungTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
    )) {
      nilaiPamanKandung = 0;
    }

    if (HajbValidator.pamanSekakekTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanKandung: nilaiPamanKandung,
    )) {
      nilaiPamanSekakek = 0;
    }

    if (HajbValidator.anakLakiPamanKandungTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanKandung: nilaiPamanKandung,
      jmlPamanSekakek: nilaiPamanSekakek,
    )) {
      nilaiAnakLakiPamanKandung = 0;
    }

    if (HajbValidator.anakLakiPamanSekakekTerhalang(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanKandung: nilaiPamanKandung,
      jmlPamanSekakek: nilaiPamanSekakek,
      jmlAnakLakiPamanSekandung: nilaiAnakLakiPamanKandung,
    )) {
      nilaiAnakLakiPamanSekakek = 0;
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
      jmlCucuLaki: nilaiCuculaki,
    );
  }

  // saudari kandung
  String? get penghalangSaudaraPerempuan {
    return HajbValidator.penghalangSaudaraPerempuanKandung(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    );
  }

  // saudara seayah
  String? get penghalangSaudaraLakiSeayah {
    return HajbValidator.penghalangSaudaraLakiSeayah(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    );
  }

  // saudari seayah
  String? get penghalangSaudaraPerempuanSeayah {
    return HajbValidator.penghalangSaudaraPerempuanSeayah(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    );
  }

  // saudara seibu
  String? get penghalangSaudaraLakiSeibu {
    return HajbValidator.penghalangSaudaraLakiSeibu(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    );
  }

  // anak laki saudara kandung
  String? get penghalangAnakLakiSaudaraKandung {
    return HajbValidator.penghalangAnakLakiSaudaraKandung(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
    );
  }

  // anak laki saudara seayah
  String? get penghalangAnakLakiSaudaraSeayah {
    return HajbValidator.penghalangAnakLakiSaudaraSeayah(
      nilaiAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnakLaki,
      jmlCucuLaki: nilaiCuculaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
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
      jmlCucuLaki: nilaiCuculaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
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
      jmlCucuLaki: nilaiCuculaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
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
      jmlCucuLaki: nilaiCuculaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
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
      jmlCucuLaki: nilaiCuculaki,
      nilaiKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
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
