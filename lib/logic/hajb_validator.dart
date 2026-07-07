class HajbValidator {
  // kakek
  static String? penghalangKakek({required int nilaiAyah}) {
    if (nilaiAyah > 0) {
      return "Ayah";
    }
    return null;
  }

  static bool kakekTerhalang({required int nilaiAyah}) {
    return penghalangKakek(nilaiAyah: nilaiAyah) != null;
  }

  // nenek
  static String? penghalangNenek({required int nilaiIbu}) {
    if (nilaiIbu > 0) {
      return "Ibu";
    }
    return null;
  }

  static bool nenekTerhalang({required int nilaiIbu}) {
    return penghalangNenek(nilaiIbu: nilaiIbu) != null;
  }

  // cucu laki
  static String? penghalangCucuLaki({required int jmlAnakLaki}) {
    if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    }
    return null;
  }

  static bool cucuLakiTerhalang({required int jmlAnakLaki}) {
    return penghalangCucuLaki(jmlAnakLaki: jmlAnakLaki) != null;
  }

  // cucu perempuan
  static String? penghalangCucuPerempuan({
    required int jmlAnakLaki,
    required int jmlAnakPerempuan,
  }) {
    if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlAnakPerempuan > 1) {
      return "Anak Perempuan Lebih dari 1";
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
  static String? penghalangSaudaraLakiKandung({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
  }) {
    if (nilaiAyah > 0) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    }
    return null;
  }

  static bool saudaraLakiKandungTerhalang({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
  }) {
    return penghalangSaudaraLakiKandung(
          nilaiAyah: nilaiAyah,
          jmlAnakLaki: jmlAnakLaki,
          jmlCucuLaki: jmlCucuLaki,
        ) !=
        null;
  }

  // saudari kandung
  static String? penghalangSaudaraPerempuanKandung({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
  }) {
    if (nilaiAyah > 0) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    }
    return null;
  }

  static bool saudaraPerempuanKandungTerhalang({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
  }) {
    return penghalangSaudaraPerempuanKandung(
          nilaiAyah: nilaiAyah,
          jmlAnakLaki: jmlAnakLaki,
          jmlCucuLaki: jmlCucuLaki,
        ) !=
        null;
  }

  // saudara seayah
  static String? penghalangSaudaraLakiSeayah({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
  }) {
    if (nilaiAyah > 0) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Keturunan Perempuan & Saudara Perempuan Kandung Ashabah";
    }
    return null;
  }

  static bool saudaraLakiSeayahTerhalang({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
  }) {
    return penghalangSaudaraLakiSeayah(
          nilaiAyah: nilaiAyah,
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
  static String? penghalangSaudaraPerempuanSeayah({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
  }) {
    if (nilaiAyah > 0) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan == 1 || jmlCucuPerempuan == 1)) {
      return "Keturunan Perempuan & Saudara Perempuan Kandung Ashabah";
    } else if (jmlSaudaraPerempuanKandung > 1) {
      return "2 atau lebih Saudara Perempuan Kandung";
    }
    return null;
  }

  static bool saudaraPerempuanSeayahTerhalang({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
  }) {
    return penghalangSaudaraPerempuanSeayah(
          nilaiAyah: nilaiAyah,
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
  static String? penghalangSaudaraLakiSeibu({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int jmlAnakPerempuan,
    required int jmlCucuLaki,
    required int jmlCucuPerempuan,
  }) {
    if (nilaiAyah > 0) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlAnakPerempuan > 0) {
      return "Anak Perempuan";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (jmlCucuPerempuan > 0) {
      return "Cucu Perempuan";
    }
    return null;
  }

  static bool saudaraLakiSeibuTerhalang({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int jmlAnakPerempuan,
    required int jmlCucuLaki,
    required int jmlCucuPerempuan,
  }) {
    return penghalangSaudaraLakiSeibu(
          nilaiAyah: nilaiAyah,
          jmlAnakLaki: jmlAnakLaki,
          jmlAnakPerempuan: jmlAnakPerempuan,
          jmlCucuLaki: jmlCucuLaki,
          jmlCucuPerempuan: jmlCucuPerempuan,
        ) !=
        null;
  }

  // saudari seibu
  static String? penghalangSaudaraPerempuanSeibu({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int jmlAnakPerempuan,
    required int jmlCucuLaki,
    required int jmlCucuPerempuan,
  }) {
    if (nilaiAyah > 0) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlAnakPerempuan > 0) {
      return "Anak Perempuan";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (jmlCucuPerempuan > 0) {
      return "Cucu Perempuan";
    }
    return null;
  }

  static bool saudaraPerempuanSeibuTerhalang({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int jmlAnakPerempuan,
    required int jmlCucuLaki,
    required int jmlCucuPerempuan,
  }) {
    return penghalangSaudaraPerempuanSeibu(
          nilaiAyah: nilaiAyah,
          jmlAnakLaki: jmlAnakLaki,
          jmlAnakPerempuan: jmlAnakPerempuan,
          jmlCucuLaki: jmlCucuLaki,
          jmlCucuPerempuan: jmlCucuPerempuan,
        ) !=
        null;
  }

  // putra saudara kandung
  static String? penghalangAnakLakiSaudaraKandung({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int nilaiKakek,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
    required int jmlSaudaraLakiSeayah,
    required int jmlSaudaraPerempuanSeayah,
  }) {
    if (nilaiAyah > 0) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (nilaiKakek > 0) {
      return "Kakek";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Keturunan Perempuan & Saudara Perempuan Kandung Ashabah";
    } else if (jmlSaudaraLakiSeayah > 0) {
      return "Saudara Laki-Laki Seayah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Keturunan Perempuan & Saudara Perempuan Seayah Ashabah";
    }
    return null;
  }

  static bool anakLakiSaudaraKandungTerhalang({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int nilaiKakek,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
    required int jmlSaudaraLakiSeayah,
    required int jmlSaudaraPerempuanSeayah,
  }) {
    return penghalangAnakLakiSaudaraKandung(
          nilaiAyah: nilaiAyah,
          jmlAnakLaki: jmlAnakLaki,
          nilaiKakek: nilaiKakek,
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
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int nilaiKakek,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
    required int jmlSaudaraLakiSeayah,
    required int jmlSaudaraPerempuanSeayah,
    required int jmlAnakLakiSaudaraKandung,
  }) {
    if (nilaiAyah > 0) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (nilaiKakek > 0) {
      return "Kakek";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Keturunan Perempuan & Saudara Perempuan Kandung Ashabah";
    } else if (jmlSaudaraLakiSeayah > 0) {
      return "Saudara Laki-Laki Seayah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Keturunan Perempuan & Saudara Perempuan Seayah Ashabah";
    } else if (jmlAnakLakiSaudaraKandung > 0) {
      return "AnakLaki Saudara Laki-Laki Kandung";
    }
    return null;
  }

  static bool anakLakiSaudaraSeayahTerhalang({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int nilaiKakek,
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
          nilaiAyah: nilaiAyah,
          jmlAnakLaki: jmlAnakLaki,
          nilaiKakek: nilaiKakek,
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
  static String? penghalangPamanKandung({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int nilaiKakek,
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
    if (nilaiAyah > 0) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (nilaiKakek > 0) {
      return "Kakek";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Keturunan Perempuan & Saudara Perempuan Kandung  Ashabah";
    } else if (jmlSaudaraLakiSeayah > 0) {
      return "Saudara Laki-Laki Seayah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Keturunan Perempuan & Saudara Perempuan Seayah Ashabah";
    } else if (jmlAnakLakiSaudaraKandung > 0) {
      return "Anak Laki Saudara Laki-Laki Kandung";
    } else if (jmlAnakLakiSaudaraSeayah > 0) {
      return "Anak Laki Saudara Laki-Laki Seayah";
    }
    return null;
  }

  static bool pamanKandungTerhalang({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int nilaiKakek,
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
    return penghalangPamanKandung(
          nilaiAyah: nilaiAyah,
          jmlAnakLaki: jmlAnakLaki,
          nilaiKakek: nilaiKakek,
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
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int nilaiKakek,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
    required int jmlSaudaraLakiSeayah,
    required int jmlSaudaraPerempuanSeayah,
    required int jmlAnakLakiSaudaraKandung,
    required int jmlAnakLakiSaudaraSeayah,
    required int jmlPamanKandung,
  }) {
    if (nilaiAyah > 0) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (nilaiKakek > 0) {
      return "Kakek";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Keturunan Perempuan & Saudara Perempuan Kandung  Ashabah";
    } else if (jmlSaudaraLakiSeayah > 0) {
      return "Saudara Laki-Laki Seayah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Keturunan Perempuan & Saudara Perempuan Seayah Ashabah";
    } else if (jmlAnakLakiSaudaraKandung > 0) {
      return "Anak Laki Saudara Laki-Laki Kandung";
    } else if (jmlAnakLakiSaudaraSeayah > 0) {
      return "Anak Laki Saudara Laki-Laki Seayah";
    } else if (jmlPamanKandung > 0) {
      return "Paman Sekandung";
    }
    return null;
  }

  static bool pamanSekakekTerhalang({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int nilaiKakek,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
    required int jmlSaudaraLakiSeayah,
    required int jmlSaudaraPerempuanSeayah,
    required int jmlAnakLakiSaudaraKandung,
    required int jmlAnakLakiSaudaraSeayah,
    required int jmlPamanKandung,
  }) {
    return penghalangPamanSekakek(
          nilaiAyah: nilaiAyah,
          jmlAnakLaki: jmlAnakLaki,
          nilaiKakek: nilaiKakek,
          jmlCucuLaki: jmlCucuLaki,
          jmlSaudaraLakiKandung: jmlSaudaraLakiKandung,
          jmlSaudaraPerempuanKandung: jmlSaudaraPerempuanKandung,
          jmlAnakPerempuan: jmlAnakPerempuan,
          jmlCucuPerempuan: jmlCucuPerempuan,
          jmlSaudaraLakiSeayah: jmlSaudaraLakiSeayah,
          jmlSaudaraPerempuanSeayah: jmlSaudaraPerempuanSeayah,
          jmlAnakLakiSaudaraKandung: jmlAnakLakiSaudaraKandung,
          jmlAnakLakiSaudaraSeayah: jmlAnakLakiSaudaraSeayah,
          jmlPamanKandung: jmlPamanKandung,
        ) !=
        null;
  }

  // putra paman kandung
  static String? penghalangAnakLakiPamanKandung({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int nilaiKakek,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
    required int jmlSaudaraLakiSeayah,
    required int jmlSaudaraPerempuanSeayah,
    required int jmlAnakLakiSaudaraKandung,
    required int jmlAnakLakiSaudaraSeayah,
    required int jmlPamanKandung,
    required int jmlPamanSekakek,
  }) {
    if (nilaiAyah > 0) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (nilaiKakek > 0) {
      return "Kakek";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Keturunan Perempuan & Saudara Perempuan Kandung  Ashabah";
    } else if (jmlSaudaraLakiSeayah > 0) {
      return "Saudara Laki-Laki Seayah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Keturunan Perempuan & Saudara Perempuan Seayah Ashabah";
    } else if (jmlAnakLakiSaudaraKandung > 0) {
      return "Anak Laki Saudara Laki-Laki Kandung";
    } else if (jmlAnakLakiSaudaraSeayah > 0) {
      return "Anak Laki Saudara Laki-Laki Seayah";
    } else if (jmlPamanKandung > 0) {
      return "Paman Sekandung";
    } else if (jmlPamanSekakek > 0) {
      return "Paman Sekakek";
    }
    return null;
  }

  static bool anakLakiPamanKandungTerhalang({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int nilaiKakek,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
    required int jmlSaudaraLakiSeayah,
    required int jmlSaudaraPerempuanSeayah,
    required int jmlAnakLakiSaudaraKandung,
    required int jmlAnakLakiSaudaraSeayah,
    required int jmlPamanKandung,
    required int jmlPamanSekakek,
  }) {
    return penghalangAnakLakiPamanKandung(
          nilaiAyah: nilaiAyah,
          jmlAnakLaki: jmlAnakLaki,
          nilaiKakek: nilaiKakek,
          jmlCucuLaki: jmlCucuLaki,
          jmlSaudaraLakiKandung: jmlSaudaraLakiKandung,
          jmlSaudaraPerempuanKandung: jmlSaudaraPerempuanKandung,
          jmlAnakPerempuan: jmlAnakPerempuan,
          jmlCucuPerempuan: jmlCucuPerempuan,
          jmlSaudaraLakiSeayah: jmlSaudaraLakiSeayah,
          jmlSaudaraPerempuanSeayah: jmlSaudaraPerempuanSeayah,
          jmlAnakLakiSaudaraKandung: jmlAnakLakiSaudaraKandung,
          jmlAnakLakiSaudaraSeayah: jmlAnakLakiSaudaraSeayah,
          jmlPamanKandung: jmlPamanKandung,
          jmlPamanSekakek: jmlPamanSekakek,
        ) !=
        null;
  }

  // putra paman sekakek
  static String? penghalangAnakLakiPamanSekakek({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int nilaiKakek,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
    required int jmlSaudaraLakiSeayah,
    required int jmlSaudaraPerempuanSeayah,
    required int jmlAnakLakiSaudaraKandung,
    required int jmlAnakLakiSaudaraSeayah,
    required int jmlPamanKandung,
    required int jmlPamanSekakek,
    required int jmlAnakLakiPamanSekandung,
  }) {
    if (nilaiAyah > 0) {
      return "Ayah";
    } else if (jmlAnakLaki > 0) {
      return "Anak Laki-Laki";
    } else if (jmlCucuLaki > 0) {
      return "Cucu Laki-Laki";
    } else if (nilaiKakek > 0) {
      return "Kakek";
    } else if (jmlSaudaraLakiKandung > 0) {
      return "Saudara Laki-Laki Kandung";
    } else if (jmlSaudaraPerempuanKandung > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Keturunan Perempuan & Saudara Perempuan Kandung  Ashabah";
    } else if (jmlSaudaraLakiSeayah > 0) {
      return "Saudara Laki-Laki Seayah";
    } else if (jmlSaudaraPerempuanSeayah > 0 &&
        (jmlAnakPerempuan > 0 || jmlCucuPerempuan > 0)) {
      return "Keturunan Perempuan & Saudara Perempuan Seayah Ashabah";
    } else if (jmlAnakLakiSaudaraKandung > 0) {
      return "Anak Laki Saudara Laki-Laki Kandung";
    } else if (jmlAnakLakiSaudaraSeayah > 0) {
      return "Anak Laki Saudara Laki-Laki Seayah";
    } else if (jmlPamanKandung > 0) {
      return "Paman Sekandung";
    } else if (jmlPamanSekakek > 0) {
      return "Paman Sekakek";
    } else if (jmlAnakLakiPamanSekandung > 0) {
      return "Anak Laki Paman Sekandung";
    }
    return null;
  }

  static bool anakLakiPamanSekakekTerhalang({
    required int nilaiAyah,
    required int jmlAnakLaki,
    required int nilaiKakek,
    required int jmlCucuLaki,
    required int jmlSaudaraLakiKandung,
    required int jmlSaudaraPerempuanKandung,
    required int jmlAnakPerempuan,
    required int jmlCucuPerempuan,
    required int jmlSaudaraLakiSeayah,
    required int jmlSaudaraPerempuanSeayah,
    required int jmlAnakLakiSaudaraKandung,
    required int jmlAnakLakiSaudaraSeayah,
    required int jmlPamanKandung,
    required int jmlPamanSekakek,
    required int jmlAnakLakiPamanSekandung,
  }) {
    return penghalangAnakLakiPamanSekakek(
          nilaiAyah: nilaiAyah,
          jmlAnakLaki: jmlAnakLaki,
          nilaiKakek: nilaiKakek,
          jmlCucuLaki: jmlCucuLaki,
          jmlSaudaraLakiKandung: jmlSaudaraLakiKandung,
          jmlSaudaraPerempuanKandung: jmlSaudaraPerempuanKandung,
          jmlAnakPerempuan: jmlAnakPerempuan,
          jmlCucuPerempuan: jmlCucuPerempuan,
          jmlSaudaraLakiSeayah: jmlSaudaraLakiSeayah,
          jmlSaudaraPerempuanSeayah: jmlSaudaraPerempuanSeayah,
          jmlAnakLakiSaudaraKandung: jmlAnakLakiSaudaraKandung,
          jmlAnakLakiSaudaraSeayah: jmlAnakLakiSaudaraSeayah,
          jmlPamanKandung: jmlPamanKandung,
          jmlPamanSekakek: jmlPamanSekakek,
          jmlAnakLakiPamanSekandung: jmlAnakLakiPamanSekandung,
        ) !=
        null;
  }
}
