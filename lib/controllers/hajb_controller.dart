import 'package:waristmate_app/logic/hajb_validator.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';

extension HajbController on CalculatorController {
  void sinkronisasiHajb() {
    // kakek
    if (HajbValidator.kakekTerhalang(adaAyah: nilaiAyah)) {
      nilaiKakek = false;
    }

    if (HajbValidator.nenekTerhalang(adaIbu: nilaiIbu)) {
      nilaiNenekIbu = false;
      nilaiNenekAyah = false;
    }

    if (HajbValidator.cucuLakiTerhalang(jmlAnakLaki: nilaiAnaklaki)) {
      nilaiCuculaki = 0;
    }

    if (HajbValidator.cucuPerempuanTerhalang(
      jmlAnakLaki: nilaiAnaklaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
    )) {
      nilaiCucuperempuan = 0;
    }

    if (HajbValidator.saudaraLakiKandungTerhalang(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
    )) {
      nilaiSaudaraLakiKandung = 0;
    }

    if (HajbValidator.saudaraPerempuanKandungTerhalang(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    )) {
      nilaiSaudaraPerempuanKandung = 0;
    }

    if (HajbValidator.saudaraSeayahTerhalang(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    )) {
      nilaiSaudaraLakiSeayah = 0;
    }

    if (HajbValidator.saudariSeayahTerhalang(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    )) {
      nilaiSaudaraPerempuanSeayah = 0;
    }

    if (HajbValidator.saudaraSeibuTerhalang(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    )) {
      nilaiSaudaraLakiSeibu = 0;
    }

    if (HajbValidator.saudariSeibuTerhalang(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    )) {
      nilaiSaudaraPerempuanSeibu = 0;
    }

    if (HajbValidator.anakLakiSaudaraKandungTerhalang(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
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
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
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

    if (HajbValidator.pamanSekandungTerhalang(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
    )) {
      nilaiPamanKandungAyah = 0;
    }

    if (HajbValidator.pamanSekakekTerhalang(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanSekandung: nilaiPamanKandungAyah,
    )) {
      nilaiPamanSekakekAyah = 0;
    }

    if (HajbValidator.anakLakiPamanSekandungTerhalang(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanSekandung: nilaiPamanKandungAyah,
      jmlPamanSekakek: nilaiPamanSekakekAyah,
    )) {
      nilaiAnakLakiPamanKandung = 0;
    }
  }

  // kakek
  String? get penghalangKakek {
    return HajbValidator.penghalangKakek(adaAyah: nilaiAyah);
  }

  String? get penghalangNenek {
    return HajbValidator.penghalangNenek(adaIbu: nilaiIbu);
  }

  // cucu laki-laki
  String? get penghalangCucuLaki {
    return HajbValidator.penghalangCucuLaki(jmlAnakLaki: nilaiAnaklaki);
  }

  // cucu perempuan
  String? get penghalangCucuPerempuan {
    return HajbValidator.penghalangCucuPerempuan(
      jmlAnakLaki: nilaiAnaklaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
    );
  }

  // saudara kandung
  String? get penghalangSaudaraLakiKandung {
    return HajbValidator.penghalangSaudaraLakiKandung(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
    );
  }

  // saudari kandung
  String? get penghalangSaudaraPerempuan {
    return HajbValidator.penghalangSaudaraPerempuanKandung(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    );
  }

  // saudara seayah
  String? get penghalangSaudaraSeayah {
    return HajbValidator.penghalangSaudaraSeayah(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    );
  }

  // saudari seayah
  String? get penghalangSaudariSeayah {
    return HajbValidator.penghalangSaudariSeayah(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    );
  }

  // saudara seibu
  String? get penghalangSaudaraSeibu {
    return HajbValidator.penghalangSaudaraSeibu(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    );
  }

  // anak laki saudara kandung
  String? get penghalangAnakLakiSaudaraKandung {
    return HajbValidator.penghalangAnakLakiSaudaraKandung(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
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
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
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
    return HajbValidator.penghalangPamanSekandung(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
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
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanSekandung: nilaiPamanKandungAyah,
    );
  }

  // anak laki paman sekandung
  String? get penghalangAnakLakiPamanSekandung {
    return HajbValidator.penghalangAnakLakiPamanSeKandung(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanSekandung: nilaiPamanKandungAyah,
      jmlPamanSekakek: nilaiPamanSekakekAyah,
    );
  }

  // anak laki paman sekakek
  String? get penghalangAnakLakiPamanSekakek {
    return HajbValidator.penghalangAnakLakiPamanSekakek(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
      jmlSaudaraLakiSeayah: nilaiSaudaraLakiSeayah,
      jmlSaudaraPerempuanSeayah: nilaiSaudaraPerempuanSeayah,
      jmlAnakLakiSaudaraKandung: nilaiAnakLakiSaudaraKandung,
      jmlAnakLakiSaudaraSeayah: nilaiAnakLakiSaudaraSeayah,
      jmlPamanSekandung: nilaiPamanKandungAyah,
      jmlPamanSekakek: nilaiPamanSekakekAyah,
      jmlAnakLakiPamanSekandung: nilaiAnakLakiPamanKandung,
    );
  }
}
