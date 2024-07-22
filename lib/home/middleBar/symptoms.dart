import 'package:flutter/material.dart';

class SymptomsPage extends StatelessWidget {
  const SymptomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF2F9F1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black),
      ),
      child: SizedBox(
        height: 350,
        child: Scrollbar(
          thickness: 10,
          trackVisibility: true,
          radius: const Radius.circular(3),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: Text(
                    'Symptoms of Skin Cancer\n(Gejala Kanker Kulit)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LeagueSpartan',
                      color: Color(0xFF5C715E),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          'Gejala kanker kulit umumnya muncul pada bagian tubuh yang sering terpapar sinar matahari, seperti kulit kepala, wajah, telinga, leher, lengan, atau tungkai. Akan tetapi, kanker kulit juga dapat terjadi di bagian tubuh yang jarang terkena sinar matahari, seperti telapak tangan, kaki, atau bahkan area kelamin.\n\n'
                          'Berikut ini adalah gejala kanker kulit berdasarkan jenisnya :\n',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'Karsinoma Sel Basal\n',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          '• Karsinoma sel basal ditandai dengan benjolan lunak dan mengkilat di permukaan kulit berwana putih, merah, atau merah muda, atau lesi berbentuk datar yang berwarna gelap atau cokelat kemerahan seperti daging.\n'
                          '• Kulit kering dan kasar, mungkin berdarah dan sembuh berulang.\n'
                          '• Belang menonjol berwarna kemerahan atau merah muda, mungkin gatal atau bersisik, tetapi tidak terasa nyeri.\n',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'Karsinoma Sel Skuamosa\n',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          '• Karsinoma sel skuamosa ditandai dengan benjolan merah keras pada kulit, atau lesi yang berbentuk datar dan bersisik seperti kerak. Lesi dapat terasa gatal, berdarah, hingga menjadi kerak. Belang menonjol dengan permukaan yang kasar atau bersisik dan cekung di tengahnya;\n'
                          '• Tumbuh seperti kutil;\n'
                          '• Luka terbuka selama beberapa minggu;\n'
                          '• Titik merah bersisik yang tidak kunjung hilang, dengan pinggiran tidak rata dan mudah berdarah.\n',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'Kanker Kulit Melanoma\n',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          '• Bercak atau benjolan berwarna cokelat, hitam, atau biru, dengan pinggiran tidak rata dan mudah berdarah.\n'
                          '• Belang menonjol berwarna cokelat, hitam, atau biru, dengan permukaan yang kasar atau bersisik dan cekung di tengahnya;\n'
                          '• Luka terbuka selama beberapa minggu;\n'
                          '• Titik merah bersisik yang tidak kunjung hilang, dengan pinggiran tidak rata dan mudah berdarah.\n\n',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
