class DalilItem {
  final String arabicText;
  final String translation;

  final String source;

  const DalilItem({
    required this.arabicText,
    required this.translation,
    required this.source,
  });
}

const List<DalilItem> kDalilList = [
  DalilItem(
    arabicText:
        'لِلرِّجَالِ نَصِيبٌ مِمَّا تَرَكَ الْوَالِدَانِ وَالْأَقْرَبُونَ وَلِلنِّسَاءِ نَصِيبٌ مِمَّا تَرَكَ الْوَالِدَانِ وَالْأَقْرَبُونَ مِمَّا قَلَّ مِنْهُ أَوْ كَثُرَ نَصِيبًا مَفْرُوضًا',
    translation:
        'Bagi laki-laki ada hak bagian dari harta peninggalan kedua orang tua dan kerabatnya, dan bagi perempuan ada hak bagian (pula) dari harta peninggalan kedua orang tua dan kerabatnya, baik sedikit atau banyak menurut bagian yang telah ditetapkan.',
    source: 'QS. An-Nisa: 7',
  ),
  DalilItem(
    arabicText:
        'يُوصِيكُمُ اللَّهُ فِي أَوْلَادِكُمْ لِلذَّكَرِ مِثْلُ حَظِّ الْأُنْثَيَيْنِ',
    translation:
        'Allah mensyariatkan (mewajibkan) kepadamu tentang (pembagian warisan untuk) anak-anakmu, yaitu bagian seorang anak laki-laki sama dengan bagian dua orang anak perempuan.',
    source: 'QS. An-Nisa: 11',
  ),
  DalilItem(
    arabicText:
        'يَا أَبَا هُرَيْرَةَ تَعَلَّمُوا الْفَرَائِضَ وَعَلِّمُوهَا فَإِنَّهُ نِصْفُ الْعِلْمِ',
    translation:
        'Wahai Abu Hurairah, belajarlah ilmu faraidh dan ajarkanlah, karena sesungguhnya ia adalah setengah dari ilmu.',
    source: 'HR. Ibnu Majah',
  ),
];
