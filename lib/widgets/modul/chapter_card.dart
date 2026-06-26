import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/screen/modul/materi_screen.dart';

class ChapterCard extends StatelessWidget {
  final Map<String, String> chapter;

  const ChapterCard({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    const double cardRadius = 20;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.backgroundClean,
        borderRadius: BorderRadius.circular(cardRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: AppColors.primaryGreen.withValues(alpha: 0.2),
          width: 1,
        ),
      ),

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(cardRadius),
          splashColor: AppColors.primaryGreen.withValues(alpha: 0.1),
          highlightColor: AppColors.primaryGreen.withValues(alpha: 0.05),
          onTap: () {
            String dummyHtml = '''
            <div id="bab-1">
              <div id="header-bab">
                <h1>BAB 1</h1>
                <h1>PENGENALAN ILMU FARAIDH</h1>
              </div>

              <div class="materi1">
                <h3>Definisi</h3>
                <table class="definisi">
                  <tr>
                    <td>Bahasa</td>
                    <td>:</td>
                    <td>jamak dari kata <i>fardhu</i>, artinya kebijakan.</td>
                  </tr>
                  <tr>
                    <td>Istilah</td>
                    <td>:</td>
                    <td>ilmu yang mempelajari bagaimana cara membagi warisan diantara para ahli waris.</td>
                  </tr>
                  <tr>
                    <td>Subjek</td>
                    <td>:</td>
                    <td>Warisan.</td>
                  </tr>
                  <tr>
                    <td>Tujuan</td>
                    <td>:</td>
                    <td>Menyampaikan hak-hak kepada mereka yang berhak.</td>
                  </tr>
                  <tr>
                    <td>Landasan</td>
                    <td>:</td>
                    <td>Al-Quran, Hadits, dan Ijma'.</td>
                  </tr>
                  <tr>
                    <td>Hukum mempelajarinya</td>
                    <td>:</td>
                    <td>
                      <i>Fardhu Kifayah</i>, jika sebagian orang telah memenuhinya, maka beban tersebut menjadi tanggungan yang lain.
                    </td>
                  </tr>
                  <tr>
                    <td>Hukum Pelaksanaannya</td>
                    <td>:</td>
                    <td><i>Wajib</i>, ketika membagi harta warisan.</td>
                  </tr>
                </table>

                <div class="dalil">
                  <h2>Dalil Hukum</h2>
                  <div class="content-ayat">
                    <p dir="rtl">
                      لِلرِّجَالِ نَصِيْبٌ مِّمَّا تَرَكَ الْوَالِدٰنِ وَالْاَقْرَبُوْنَۖ وَلِلنِّسَاۤءِ
                      نَصِيْبٌ مِّمَّا تَرَكَ الْوَالِدٰنِ وَالْاَقْرَبُوْنَ مِمَّا قَلَّ مِنْهُ اَوْ كَثُرَ ۗ
                      نَصِيْبًا مَّفْرُوْضًا
                    </p>
                    <p>
                      Bagi laki-laki ada hak bagian dari harta peninggalan kedua orang tua dan kerabatnya, dan
                      bagi perempuan ada hak bagian (pula) dari harta peninggalan kedua orang tua dan
                      kerabatnya, baik sedikit atau banyak menurut bagian yang telah ditetapkan. [Q.S 4:
                      An-Nisa’ (7)].
                    </p>

                    <p dir="rtl">
                      ۚيُوْصِيْكُمُ اللّٰهُ فِيْٓ اَوْلَادِكُمْ لِلذَّكَرِ مِثْلُ حَظِّ الْاُنْثَيَيْنِ
                    </p>
                    <p>
                      Allah mensyariatkan (mewajibkan) kepadamu tentang (pembagian warisan untuk) anak-anakmu,
                      (yaitu) bagian seorang anak laki-laki sama dengan bagian dua orang anak perempuan. [Q.S 4:
                      An-Nisa’ (11)].
                    </p>
                  </div>

                  <div class="content-hadits">
                    <p dir="rtl">
                      يَا أَبَا هُرَيْرَةَ تَعَلَّمُوا الْفَرَائِضَ وَعَلِّمُوهَا، فَإِنَّهُ نِصْفُ الْعِلْمِ
                      وَهُوَ يُنْسَى، وَهُوَ أَوَّلُ شَيْءٍ يُنْزَعُ مِنْ أُمَّتِي
                      <br />
                      رواه ابن ماجه
                    </p>
                    <p>
                      "Wahai Abu Hurairah, belajarlah ilmu faraidh dan ajarkanlah, karena sesungguhnya ia adalah
                      setengah dari ilmu. Dan ilmu itu akan dilupakan dan dia adalah ilmu yang pertama kali
                      dicabut dari umatku.” (HR. Ibnu Majah).
                    </p>

                    <p dir="rtl">
                      عَنِ ابْنِ عَبَّاسٍ رَضِيَ اللهُ عَنْهُمَا قَالَ: قَالَ رَسُوْلُ اللهِ صَلَّى اللهُ
                      عَلَيْهِ وَسَلَّمَ:
                      <span>
                        أَلْحِقُوا الفَرائِضَ بأَهْلِها، فَمَا أَبْقَتِ الفَرائِضُ فَلِأَوْلى رَجُلٍ ذَكَرٍ. </span
                      ><br />
                      رواه البُخَارِيُّ وَمُسْلِمٌ
                    </p>
                    <p>
                      Dari Ibnu Abbas radhiyallahu ‘anhuma, ia berkata: Rasulullah shallallahu ‘alaihi wa sallam
                      bersabda: "Bagikanlah harta warisan kepada yang berhak (sesuai dengan bagian yang telah
                      ditentukan), maka jika masih tersisa setelah pembagian warisan tersebut, serahkanlah
                      kepada kerabat laki-laki terdekat." (HR. Bukhari dan Muslim).
                    </p>

                    <p dir="rtl">
                      :عَنْ أَبِي أُمَامَةَ رَضِيَ اللهُ عَنْهُ قَالَ: سَمِعْتُ رَسُولَ اللَّهِ صَلَّى اللَّهُ
                      عَلَيْهِ وَسَلَّمَ يَقُولُ
                      <br />
                      <span>
                        إِنَّ اللَّهَ قَدْ أَعْطَى كُلَّ ذِي حَقٍّ حَقَّهُ، فَلَا وَصِيَّةَ لِوَارِثٍ </span
                      ><br />
                      رواه أبو داود وابن ماجه
                    </p>

                    <p>
                      Dari Abu Umamah radhiyallahu 'anhu, ia berkata: Aku mendengar Rasulullah shallallahu
                      'alaihi wa sallam bersabda: "Sesungguhnya Allah telah memberikan setiap orang yang berhak
                      akan haknya, maka tidak ada wasiat untuk ahli waris." (HR. Abu Dawud dan Ibnu Majah).
                    </p>
                  </div>
                </div>

                <div class="tirkah">
                  <h3>Tirkah</h3>
                  <table class="tabel-tirkah">
                    <tr>
                      <td>Bahasa</td>
                      <td>:</td>
                      <td>sumber kata dari <i>Taraka</i>, berarti yang ditinggalkan.</td>
                    </tr>
                    <tr>
                      <td>Istilah</td>
                      <td>:</td>
                      <td>
                        Harta yang tidak boleh diberikan kepada ahli waris sebelum hak-hak yang berkaitan dengan harta peninggalan telah terurus seluruhnya.
                      </td>
                    </tr>
                  </table>
                </div>

                <div class="hak">
                  <h2>Hak-Hak Yang Berkaitan Dengan Tirkah</h2>
                  <p>Ada 4 hak yang Berkaitan dengan harta peninggalan si mayit :</p>
                  <div class="list-hak">
                    <ol>
                      <li>Biaya penyelenggaraan jenazah.</li>
                      <li>Hutang.</li>
                      <li>Sepertiga Wasiat atau Kurang kepada anggota keluarga bukan ahli waris.</li>
                      <li>Pembagian Harta Warisan.</li>
                    </ol>
                  </div>
                </div>
              </div>
            </div>
            ''';

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MateriScreen(
                  bab: chapter['bab'] ?? '',
                  title: chapter['title'] ?? '',
                  contentHtml: dummyHtml,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.import_contacts_rounded,
                    color: AppColors.primaryGreen,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chapter['bab'] ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryGreen,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        chapter['title'] ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.primaryGreen,
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
