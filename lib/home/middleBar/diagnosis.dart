import 'package:flutter/material.dart';
import 'quisoner.dart';

class DiagnosisPage extends StatelessWidget {
  const DiagnosisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF2F9F1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black),
      ),
      child: SizedBox(
        height: 350, // Adjust the height as needed
        child: Scrollbar(
          thickness: 10,
          trackVisibility: true,
          radius: const Radius.circular(5),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        WidgetSpan(
                          child: Center(
                            child: Text(
                              'Diagnosis and Treatment\n(Diagnosa dan Pencegahan)',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'LeagueSpartan',
                                color: Color(0xFF5C715E),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          'Saat mendiagnosis kanker kulit, dokter memeriksa kulit untuk mengetahui kelainan yang ada. Memeriksa bentuk, ukuran, warna, dan tekstur kulit.\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          'Tes ini memungkinkan dokter menentukan apakah perubahan tersebut disebabkan oleh kanker atau penyakit lain. Untuk memastikan diagnosis, dokter akan melakukan biopsi kulit. Selama biopsi, sampel jaringan kulit diambil dan diuji di laboratorium\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          'Jika penyakit kulit disebabkan oleh kanker, dokter akan menentukan tingkat keparahan atau stadium kanker kulit.\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          'Dokter mungkin akan melakukan pemeriksaan lebih lanjut, seperti CT scan, MRI, atau biopsi kelenjar getah bening, untuk mendeteksi penyebaran sel kanker\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          'Berikut ini adalah stadium dari kanker kulit:\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '• Stadium 0',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'Sel kanker masih berada di tempat yang sama dan belum menyebar ke luar epidermis atau lapisan kulit terluar.\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '• Stadium 1',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'Kanker telah menyebar ke lapisan kulit di bawah epidermis atau disebut dermis, tetapi ukurannya tidak lebih dari 2 cm.\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '• Stadium 2',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'Kanker belum menyebar ke jaringan lain, tetapi ukurannya makin membesar hingga lebih dari 2 cm.\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '• Stadium 3',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'Kanker telah menyebar ke jaringan lain di sekitarnya, misalnya tulang, dan berukuran lebih dari 3 cm.\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '• Stadium 4',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          'Kanker telah menyebar ke jaringan lain yang jauh dari tempat asal kanker, seperti kelenjar getah bening, dan ukurannya lebih dari 3 cm.\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          'Pencegahan Kanker Kulit',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LeagueSpartan',
                            color: Color(0xFF5C715E),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          'Cara terbaik untuk mencegah kanker kulit adalah melindungi kulit dari paparan sinar matahari atau sumber sinar ultraviolet  (UV) yang lain, seperti alat penggelap (tanning) kulit.\n\nUpaya yang dapat dilakukan antara lain:\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '• Hindari sinar matahari pada siang hari, karena paparan terkuat sinar UV dari matahari berlangsung pada jam 10 pagi hingga 4 sore.\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '• Gunakan tabir surya secara rutin, untuk mencegah penyerapan sinar UV ke dalam kulit dan mengurangi risiko kerusakan kulit akibat sinar matahari.\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '• Kenakan pakaian yang menutupi tubuh, seperti baju lengan panjang dan celana panjang, untuk melindungi kulit dari sinar matahari.\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '• Gunakan pula topi dan kacamata hitam saat keluar rumah, untuk memberikan perlindungan lebih terhadap kepala dan mata dari radiasi sinar matahari.\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '• Hindari penggunaan tanning bed, yaitu alat untuk menggelapkan kulit, karena dapat memancarkan radiasi ultraviolet yang berbahaya bagi kulit.\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '• Hati-hati saat menggunakan obat yang menyebabkan efek samping pada kulit, seperti antibiotic. Agar aman, konsultasikan kepada dokter terlebih dulu.\n',
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
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Text(
                          '• Lakukan pemeriksaan kulit secara rutin dan segera konsultasikan kepada dokter jika Anda mencurigai adanya perubahan atau kelainan pada kulit.\n',
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
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for the button
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuisonerPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xFFF2F9F1),
                      backgroundColor: const Color(0xFF5C715E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                    ),
                    child: const Text(
                      'Click For Check',
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                      ),
                    ),
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
