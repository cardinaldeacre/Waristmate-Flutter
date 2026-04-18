class SimpleInheritance {
  static Map<String, double> hitungSederhana(
    double totalharta,
    bool adaIstri,
    int jmlAnakLaki,
  ) {
    Map<String, double> hasil = {};
    double sisa = totalharta;

    if (adaIstri) {
      double bagianIstri = totalharta * (1 / 8);
      hasil['Istri (1/8)'] = bagianIstri;
      sisa -= bagianIstri;
    }

    if (jmlAnakLaki > 0) {
      double bagianAnakLaki = sisa / jmlAnakLaki;
      hasil['Tiap Anak Laki-laki'] = bagianAnakLaki;
    }

    return hasil;
  }
}
