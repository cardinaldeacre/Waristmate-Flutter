class HajbValidator {
  // kakek
  static String? penghalangKakek({required bool adaAyah}) {
    if (adaAyah) {
      return "Ayah";
    }
    return null;
  }

  // nenek
  static String? penghalangNenek({required bool adaIbu}) {
    if (adaIbu) {
      return "Ibu";
    }
    return null;
  }

  // cucu laki
  static String? penghalangCucuLaki({required int jmlAnakLaki}) {
    if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    }
    return null;
  }

  // cucu perempuan
  static String? penghalangCucuPerempuan({
    required int jmlAnakLaki,
    required int jmlAnakPerempuan,
  }) {
    if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlAnakPerempuan > 1) {
      return "Anak Perempuan";
    }
    return null;
  }

  // saudara kandung
  static String? penghalangSaudaraKandung({
    required bool adaAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
    required bool adaKakek,
  }) {
    if (adaAyah) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (adaKakek) {
      return "Kakek";
    }
    return null;
  }

  // saudari kandung
  static String? penghalangSaudaraPerempuanKandung({
    required bool adaAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
    required bool adaKakek,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
  }) {
    if (adaAyah) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (adaKakek) {
      return "Kakek";
    } else if (jmlAnakPerempuan > 1) {
      return "Anak Perempuan";
    } else if (jmlCucuPerempuan > 1) {
      return "Cucu Perempuan";
    }
    return null;
  }

  // saudara seayah
  static String? penghalangSaudaraSeayah({
    required bool adaAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
    required bool adaKakek,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
  }) {
    if (adaAyah) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (adaKakek) {
      return "Kakek";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Saudara Perempuan Kandung & Anak Perempuan Ashabah";
    }
    return null;
  }

  // saudari seayah
  static String? penghalangSaudariSeayah({
    required bool adaAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
    required bool adaKakek,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
  }) {
    if (adaAyah) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (adaKakek) {
      return "Kakek";
    } else if (jmlAnakPerempuan > 1) {
      return "2 atau lebih Anak Perempuan";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (jmlCucuPerempuan > 1) {
      return "2 atau lebih Cucu Perempuan";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Saudara Perempuan Kandung & Keturunan Perempuan Ashabah";
    } else if (jmlSaudaraPerempuanKandung > 1) {
      return "2 atau lebih Saudara Perempuan Kandung";
    }
    return null;
  }

  // saudara seibu
  static String? penghalangSaudaraSeibu({
    required bool adaAyah,
    required int jmlAnakLaki,
    required int jmlAnakPerempuan,
    required bool adaKakek,
    required int jmlCucuLaki,
    required int jmlCucuPerempuan,
  }) {
    if (adaAyah) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlAnakPerempuan > 0) {
      return "Anak Perempuan";
    } else if (adaKakek) {
      return "Kakek";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (jmlCucuPerempuan > 0) {
      return "Cucu Perempuan";
    }
    return null;
  }

  // putra saudara kandung
  static String? penghalangAnakLakiSaudaraKandung({
    required bool adaAyah,
    required int jmlAnakLaki,
    required bool adaKakek,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
    required int jmlSaudaraLakiSeayah,
    required int jmlSaudaraPerempuanSeayah,
  }) {
    if (adaAyah) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (adaKakek) {
      return "Kakek";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Saudara Perempuan Kandung & Keturunan Perempuan Ashabah";
    } else if (jmlSaudaraLakiSeayah > 0) {
      return "Saudara Laki-Laki Seayah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Saudara Perempuan Seayah & Keturunan Perempuan Ashabah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        jmlSaudaraPerempuanKandung > 0) {
      return "Saudara Perempuan Seayah & Saudara Perempuan Kandung Ashabah";
    }
    return null;
  }

  // putra saudara seayah
  static String? penghalangAnakLakiSaudaraSeayah({
    required bool adaAyah,
    required int jmlAnakLaki,
    required bool adaKakek,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
    required int jmlSaudaraLakiSeayah,
    required int jmlSaudaraPerempuanSeayah,
    required int jmlAnakLakiSaudaraKandung,
  }) {
    if (adaAyah) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (adaKakek) {
      return "Kakek";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Saudara Perempuan Kandung & Keturunan Perempuan Ashabah";
    } else if (jmlSaudaraLakiSeayah > 0) {
      return "Saudara Laki-Laki Seayah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Saudara Perempuan Seayah & Keturunan Perempuan Ashabah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        jmlSaudaraPerempuanKandung > 0) {
      return "Saudara Perempuan Seayah & Saudara Perempuan Kandung Ashabah";
    } else if (jmlAnakLakiSaudaraKandung > 0) {
      return "AnakLaki Saudara Laki-Laki Kandung";
    }
    return null;
  }

  // paman sekandung
  static String? penghalangPamanSekandung({
    required bool adaAyah,
    required int jmlAnakLaki,
    required bool adaKakek,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
    required int jmlSaudaraLakiSeayah,
    required int jmlSaudaraPerempuanSeayah,
    required int jmlAnakLakiSaudaraKandung,
    required int jmlAnakLakiSaudaraSeayah,
  }) {
    if (adaAyah) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (adaKakek) {
      return "Kakek";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Saudara Perempuan Kandung & Keturunan Perempuan Ashabah";
    } else if (jmlSaudaraLakiSeayah > 0) {
      return "Saudara Laki-Laki Seayah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Saudara Perempuan Seayah & Keturunan Perempuan Ashabah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        jmlSaudaraPerempuanKandung > 0) {
      return "Saudara Perempuan Seayah & Saudara Perempuan Kandung Ashabah";
    } else if (jmlAnakLakiSaudaraKandung > 0) {
      return "Anak Laki Saudara Laki-Laki Kandung";
    } else if (jmlAnakLakiSaudaraSeayah > 0) {
      return "Anak Laki Saudara Laki-Laki Seayah";
    }
    return null;
  }

  // paman sekakek
  static String? penghalangPamanSekakek({
    required bool adaAyah,
    required int jmlAnakLaki,
    required bool adaKakek,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
    required int jmlSaudaraLakiSeayah,
    required int jmlSaudaraPerempuanSeayah,
    required int jmlAnakLakiSaudaraKandung,
    required int jmlAnakLakiSaudaraSeayah,
    required int jmlPamanSekandung,
  }) {
    if (adaAyah) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (adaKakek) {
      return "Kakek";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Saudara Perempuan Kandung & Keturunan Perempuan Ashabah";
    } else if (jmlSaudaraLakiSeayah > 0) {
      return "Saudara Laki-Laki Seayah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Saudara Perempuan Seayah & Keturunan Perempuan Ashabah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        jmlSaudaraPerempuanKandung > 0) {
      return "Saudara Perempuan Seayah & Saudara Perempuan Kandung Ashabah";
    } else if (jmlAnakLakiSaudaraKandung > 0) {
      return "Anak Laki Saudara Laki-Laki Kandung";
    } else if (jmlAnakLakiSaudaraSeayah > 0) {
      return "Anak Laki Saudara Laki-Laki Seayah";
    } else if (jmlPamanSekandung > 0) {
      return "Paman Sekandung";
    }
    return null;
  }

  // putra paman kandung
  static String? penghalangAnakLakiPamanKandung({
    required bool adaAyah,
    required int jmlAnakLaki,
    required bool adaKakek,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
    required int jmlSaudaraLakiSeayah,
    required int jmlSaudaraPerempuanSeayah,
    required int jmlAnakLakiSaudaraKandung,
    required int jmlAnakLakiSaudaraSeayah,
    required int jmlPamanSekandung,
    required int jmlPamanSekakek,
  }) {
    if (adaAyah) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (adaKakek) {
      return "Kakek";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Saudara Perempuan Kandung & Keturunan Perempuan Ashabah";
    } else if (jmlSaudaraLakiSeayah > 0) {
      return "Saudara Laki-Laki Seayah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Saudara Perempuan Seayah & Keturunan Perempuan Ashabah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        jmlSaudaraPerempuanKandung > 0) {
      return "Saudara Perempuan Seayah & Saudara Perempuan Kandung Ashabah";
    } else if (jmlAnakLakiSaudaraKandung > 0) {
      return "Anak Laki Saudara Laki-Laki Kandung";
    } else if (jmlAnakLakiSaudaraSeayah > 0) {
      return "Anak Laki Saudara Laki-Laki Seayah";
    } else if (jmlPamanSekandung > 0) {
      return "Paman Sekandung";
    } else if (jmlPamanSekakek > 0) {
      return "Paman Sekakek";
    }
    return null;
  }

  // putra paman sekakek
  static String? penghalangAnakLakiPamanSekakek({
    required bool adaAyah,
    required int jmlAnakLaki,
    required bool adaKakek,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
    required int jmlSaudaraLakiSeayah,
    required int jmlSaudaraPerempuanSeayah,
    required int jmlAnakLakiSaudaraKandung,
    required int jmlAnakLakiSaudaraSeayah,
    required int jmlPamanSekandung,
    required int jmlPamanSekakek,
    required int jmlAnakLakiPamanSekandung,
  }) {
    if (adaAyah) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (adaKakek) {
      return "Kakek";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Saudara Perempuan Kandung & Keturunan Perempuan Ashabah";
    } else if (jmlSaudaraLakiSeayah > 0) {
      return "Saudara Laki-Laki Seayah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Saudara Perempuan Seayah & Keturunan Perempuan Ashabah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        jmlSaudaraPerempuanKandung > 0) {
      return "Saudara Perempuan Seayah & Saudara Perempuan Kandung Ashabah";
    } else if (jmlAnakLakiSaudaraKandung > 0) {
      return "Anak Laki Saudara Laki-Laki Kandung";
    } else if (jmlAnakLakiSaudaraSeayah > 0) {
      return "Anak Laki Saudara Laki-Laki Seayah";
    } else if (jmlPamanSekandung > 0) {
      return "Paman Sekandung";
    } else if (jmlPamanSekakek > 0) {
      return "Paman Sekakek";
    } else if (jmlAnakLakiPamanSekandung > 0) {
      return "Anak Laki Paman Sekandung";
    }
    return null;
  }
}
