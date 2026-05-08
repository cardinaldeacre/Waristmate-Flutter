import 'package:waristmate_app/logic/hajb_validator.dart';
import 'package:waristmate_app/controllers/calculator_controller.dart';

extension HajbController on CalculatorController {
  // kakek
  String? get penghalangKakek {
    return HajbValidator.penghalangKakek(adaAyah: nilaiAyah);
  }

  // nenek
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
  String? get penghalangSaudaraKandung {
    return HajbValidator.penghalangSaudaraKandung(
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
      adaKakek: nilaiKakek,
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
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
      jmlSaudaraPerempuanKandung: nilaiSaudaraPerempuanKandung,
      jmlAnakPerempuan: nilaiAnakPerempuan,
      jmlCucuPerempuan: nilaiCucuperempuan,
    );
  }

  // saudara seayah
  String? get penghalangSaudariSeayah {
    return HajbValidator.penghalangSaudaraSeayah(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
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
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
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
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
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
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
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
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
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
    return HajbValidator.penghalangAnakLakiPamanKandung(
      adaAyah: nilaiAyah,
      jmlAnakLaki: nilaiAnaklaki,
      jmlCucuLaki: nilaiCuculaki,
      adaKakek: nilaiKakek,
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
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
      jmlSaudaraLakiKandung: nilaiSaudaraLakiKKandung,
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
