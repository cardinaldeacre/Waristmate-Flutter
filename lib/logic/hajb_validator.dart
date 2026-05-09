class HajbValidator {
  // kakek
  static String? penghalangKakek({required bool adaAyah}) {
    if (adaAyah) {
      return "Ayah";
    }
    return null;
  }

  static bool kakekTerhalang({required bool adaAyah}) {
    return adaAyah;
  }

  // nenek
  static String? penghalangNenek({required bool adaIbu}) {
    if (adaIbu) {
      return "Ibu";
    }
    return null;
  }

  static bool nenekTerhalang({required bool adaIbu}) {
    return adaIbu;
  }

  // cucu laki
  static String? penghalangCucuLaki({required int jmlAnakLaki}) {
    if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    }
    return null;
  }

  static bool cucuLakiTerhalang({required int jmlAnakLaki}) {
    return jmlAnakLaki > 0;
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

  static bool cucuPerempuanTerhalang({
    required int jmlAnakLaki,
    required int jmlAnakPerempuan,
  }) {
    return penghalangCucuPerempuan(
          jmlAnakLaki: jmlAnakLaki,
          jmlAnakPerempuan: jmlAnakPerempuan,
        ) !=
        null;
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
    }
    return null;
  }

  static bool saudaraKandungTerhalang({
    required bool adaAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
    required bool adaKakek,
  }) {
    return penghalangSaudaraKandung(
          adaAyah: adaAyah,
          jmlAnakLaki: jmlAnakLaki,
          jmlCucuLaki: jmlCucuLaki,
          adaKakek: adaKakek,
        ) !=
        null;
  }

  // saudari kandung
  static String? penghalangSaudaraPerempuanKandung({
    required bool adaAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
  }) {
    if (adaAyah) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (jmlAnakPerempuan > 1) {
      return "Anak Perempuan";
    } else if (jmlCucuPerempuan > 1) {
      return "Cucu Perempuan";
    }
    return null;
  }

  static bool saudaraPerempuanKandungTerhalang({
    required bool adaAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
  }) {
    return penghalangSaudaraPerempuanKandung(
          adaAyah: adaAyah,
          jmlAnakLaki: jmlAnakLaki,
          jmlCucuLaki: jmlCucuLaki,
          jmlAnakPerempuan: jmlAnakPerempuan,
          jmlCucuPerempuan: jmlCucuPerempuan,
        ) !=
        null;
  }

  // saudara seayah
  static String? penghalangSaudaraSeayah({
    required bool adaAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
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
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Saudara Perempuan Kandung & Anak Perempuan Ashabah";
    }
    return null;
  }

  static bool saudaraSeayahTerhalang({
    required bool adaAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
  }) {
    return penghalangSaudaraSeayah(
          adaAyah: adaAyah,
          jmlAnakLaki: jmlAnakLaki,
          jmlCucuLaki: jmlCucuLaki,
          jmlSaudaraLakiKandung: jmlSaudaraLakiKandung,
          jmlSaudaraPerempuanKandung: jmlSaudaraPerempuanKandung,
          jmlAnakPerempuan: jmlAnakPerempuan,
          jmlCucuPerempuan: jmlCucuPerempuan,
        ) !=
        null;
  }

  // saudari seayah
  static String? penghalangSaudariSeayah({
    required bool adaAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
  }) {
    if (adaAyah) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
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

  static bool saudariSeayahTerhalang({
    required bool adaAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
    required bool adaKakek,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
  }) {
    return penghalangSaudariSeayah(
          adaAyah: adaAyah,
          jmlAnakLaki: jmlAnakLaki,
          jmlCucuLaki: jmlCucuLaki,
          jmlSaudaraLakiKandung: jmlSaudaraLakiKandung,
          jmlSaudaraPerempuanKandung: jmlSaudaraPerempuanKandung,
          jmlAnakPerempuan: jmlAnakPerempuan,
          jmlCucuPerempuan: jmlCucuPerempuan,
        ) !=
        null;
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

  static bool saudaraSeibuTerhalang({
    required bool adaAyah,
    required int jmlAnakLaki,
    required int jmlAnakPerempuan,
    required bool adaKakek,
    required int jmlCucuLaki,
    required int jmlCucuPerempuan,
  }) {
    return penghalangSaudaraSeibu(
          adaAyah: adaAyah,
          jmlAnakLaki: jmlAnakLaki,
          jmlAnakPerempuan: jmlAnakPerempuan,
          adaKakek: adaKakek,
          jmlCucuLaki: jmlCucuLaki,
          jmlCucuPerempuan: jmlCucuPerempuan,
        ) !=
        null;
  }

  // saudari seibu
  static String? penghalangSaudariSeibu({
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

  static bool saudariSeibuTerhalang({
    required bool adaAyah,
    required int jmlAnakLaki,
    required int jmlAnakPerempuan,
    required bool adaKakek,
    required int jmlCucuLaki,
    required int jmlCucuPerempuan,
  }) {
    return penghalangSaudariSeibu(
          adaAyah: adaAyah,
          jmlAnakLaki: jmlAnakLaki,
          jmlAnakPerempuan: jmlAnakPerempuan,
          adaKakek: adaKakek,
          jmlCucuLaki: jmlCucuLaki,
          jmlCucuPerempuan: jmlCucuPerempuan,
        ) !=
        null;
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

  static bool anakLakiSaudaraKandungTerhalang({
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
    return penghalangAnakLakiSaudaraKandung(
          adaAyah: adaAyah,
          jmlAnakLaki: jmlAnakLaki,
          adaKakek: adaKakek,
          jmlCucuLaki: jmlCucuLaki,
          jmlSaudaraLakiKandung: jmlSaudaraLakiKandung,
          jmlSaudaraPerempuanKandung: jmlSaudaraPerempuanKandung,
          jmlAnakPerempuan: jmlAnakPerempuan,
          jmlCucuPerempuan: jmlCucuPerempuan,
          jmlSaudaraLakiSeayah: jmlSaudaraLakiSeayah,
          jmlSaudaraPerempuanSeayah: jmlSaudaraPerempuanSeayah,
        ) !=
        null;
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

  static bool anakLakiSaudaraSeayahTerhalang({
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
    return penghalangAnakLakiSaudaraSeayah(
          adaAyah: adaAyah,
          jmlAnakLaki: jmlAnakLaki,
          adaKakek: adaKakek,
          jmlCucuLaki: jmlCucuLaki,
          jmlSaudaraLakiKandung: jmlSaudaraLakiKandung,
          jmlSaudaraPerempuanKandung: jmlSaudaraPerempuanKandung,
          jmlAnakPerempuan: jmlAnakPerempuan,
          jmlCucuPerempuan: jmlCucuPerempuan,
          jmlSaudaraLakiSeayah: jmlSaudaraLakiSeayah,
          jmlSaudaraPerempuanSeayah: jmlSaudaraPerempuanSeayah,
          jmlAnakLakiSaudaraKandung: jmlAnakLakiSaudaraKandung,
        ) !=
        null;
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

  static bool pamanSekandungTerhalang({
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
    return penghalangPamanSekandung(
          adaAyah: adaAyah,
          jmlAnakLaki: jmlAnakLaki,
          adaKakek: adaKakek,
          jmlCucuLaki: jmlCucuLaki,
          jmlSaudaraLakiKandung: jmlSaudaraLakiKandung,
          jmlSaudaraPerempuanKandung: jmlSaudaraPerempuanKandung,
          jmlAnakPerempuan: jmlAnakPerempuan,
          jmlCucuPerempuan: jmlCucuPerempuan,
          jmlSaudaraLakiSeayah: jmlSaudaraLakiSeayah,
          jmlSaudaraPerempuanSeayah: jmlSaudaraPerempuanSeayah,
          jmlAnakLakiSaudaraKandung: jmlAnakLakiSaudaraKandung,
          jmlAnakLakiSaudaraSeayah: jmlAnakLakiSaudaraSeayah,
        ) !=
        null;
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

  static bool pamanSekakekTerhalang({
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
    return penghalangPamanSekakek(
          adaAyah: adaAyah,
          jmlAnakLaki: jmlAnakLaki,
          adaKakek: adaKakek,
          jmlCucuLaki: jmlCucuLaki,
          jmlSaudaraLakiKandung: jmlSaudaraLakiKandung,
          jmlSaudaraPerempuanKandung: jmlSaudaraPerempuanKandung,
          jmlAnakPerempuan: jmlAnakPerempuan,
          jmlCucuPerempuan: jmlCucuPerempuan,
          jmlSaudaraLakiSeayah: jmlSaudaraLakiSeayah,
          jmlSaudaraPerempuanSeayah: jmlSaudaraPerempuanSeayah,
          jmlAnakLakiSaudaraKandung: jmlAnakLakiSaudaraKandung,
          jmlAnakLakiSaudaraSeayah: jmlAnakLakiSaudaraSeayah,
          jmlPamanSekandung: jmlPamanSekandung,
        ) !=
        null;
  }

  // putra paman kandung
  static String? penghalangAnakLakiPamanSeKandung({
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

  static bool anakLakiPamanSekandungTerhalang({
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
    return penghalangAnakLakiPamanSeKandung(
          adaAyah: adaAyah,
          jmlAnakLaki: jmlAnakLaki,
          adaKakek: adaKakek,
          jmlCucuLaki: jmlCucuLaki,
          jmlSaudaraLakiKandung: jmlSaudaraLakiKandung,
          jmlSaudaraPerempuanKandung: jmlSaudaraPerempuanKandung,
          jmlAnakPerempuan: jmlAnakPerempuan,
          jmlCucuPerempuan: jmlCucuPerempuan,
          jmlSaudaraLakiSeayah: jmlSaudaraLakiSeayah,
          jmlSaudaraPerempuanSeayah: jmlSaudaraPerempuanSeayah,
          jmlAnakLakiSaudaraKandung: jmlAnakLakiSaudaraKandung,
          jmlAnakLakiSaudaraSeayah: jmlAnakLakiSaudaraSeayah,
          jmlPamanSekandung: jmlPamanSekandung,
          jmlPamanSekakek: jmlPamanSekakek,
        ) !=
        null;
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

  static bool anakLakiPamanSekakekTerhalang({
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
    return penghalangAnakLakiPamanSekakek(
          adaAyah: adaAyah,
          jmlAnakLaki: jmlAnakLaki,
          adaKakek: adaKakek,
          jmlCucuLaki: jmlCucuLaki,
          jmlSaudaraLakiKandung: jmlSaudaraLakiKandung,
          jmlSaudaraPerempuanKandung: jmlSaudaraPerempuanKandung,
          jmlAnakPerempuan: jmlAnakPerempuan,
          jmlCucuPerempuan: jmlCucuPerempuan,
          jmlSaudaraLakiSeayah: jmlSaudaraLakiSeayah,
          jmlSaudaraPerempuanSeayah: jmlSaudaraPerempuanSeayah,
          jmlAnakLakiSaudaraKandung: jmlAnakLakiSaudaraKandung,
          jmlAnakLakiSaudaraSeayah: jmlAnakLakiSaudaraSeayah,
          jmlPamanSekandung: jmlPamanSekandung,
          jmlPamanSekakek: jmlPamanSekakek,
          jmlAnakLakiPamanSekandung: jmlAnakLakiPamanSekandung,
        ) !=
        null;
  }
}
