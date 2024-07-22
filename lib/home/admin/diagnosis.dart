import 'package:flutter/material.dart';

class DiagnosisPage extends StatelessWidget {
  const DiagnosisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            color: const Color(0xFFF2F9F1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.black),
            ),
            child: Center(
              child: RichText(
                text: const TextSpan(
                  children: [
                    WidgetSpan(
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
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: const Color(0xFFF2F9F1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.black),
            ),
            child: const SizedBox(
              height: 350, // Adjust the height as needed
              child: Scrollbar(
                thickness: 10,
                trackVisibility: true,
                radius: Radius.circular(5),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saat mendiagnosis kanker kulit, dokter memeriksa kulit untuk mengetahui kelainan yang ada. Memeriksa bentuk, ukuran, warna, dan tekstur kulit.\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'Tes ini memungkinkan dokter menentukan apakah perubahan tersebut disebabkan oleh kanker atau penyakit lain. Untuk memastikan diagnosis, dokter akan melakukan biopsi kulit. Selama biopsi, sampel jaringan kulit diambil dan diuji di laboratorium\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'Jika penyakit kulit disebabkan oleh kanker, dokter akan menentukan tingkat keparahan atau stadium kanker kulit.\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'Dokter mungkin akan melakukan pemeriksaan lebih lanjut, seperti CT scan, MRI, atau biopsi kelenjar getah bening, untuk mendeteksi penyebaran sel kanker\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'Berikut ini adalah stadium dari kanker kulit:\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        '• Stadium 0',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                      ),
                      Text(
                        'Sel kanker masih berada di tempat yang sama dan belum menyebar ke luar epidermis atau lapisan kulit terluar.\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        '• Stadium 1',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                      ),
                      Text(
                        'Kanker telah menyebar ke lapisan kulit di bawah epidermis atau disebut dermis, tetapi ukurannya tidak lebih dari 2 cm.\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        '• Stadium 2',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                      ),
                      Text(
                        'Kanker belum menyebar ke jaringan lain, tetapi ukurannya makin membesar hingga lebih dari 2 cm.\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        '• Stadium 3',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                      ),
                      Text(
                        'Kanker telah menyebar ke jaringan lain di sekitarnya, misalnya tulang, dan berukuran lebih dari 3 cm.\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        '• Stadium 4',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                      ),
                      Text(
                        'Kanker telah menyebar ke jaringan lain yang jauh dari tempat asal kanker, seperti kelenjar getah bening, dan ukurannya lebih dari 3 cm.\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'Pencegahan Kanker Kulit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'Cara terbaik untuk mencegah kanker kulit adalah melindungi kulit dari paparan sinar matahari atau sumber sinar ultraviolet (UV) yang lain, seperti alat penggelap (tanning) kulit.\n\nUpaya yang dapat dilakukan antara lain:\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        '• Hindari sinar matahari pada siang hari, karena paparan terkuat sinar UV dari matahari berlangsung pada jam 10 pagi hingga 4 sore.\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        '• Gunakan tabir surya secara rutin, untuk mencegah penyerapan sinar UV ke dalam kulit dan mengurangi risiko kerusakan kulit akibat sinar matahari.\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        '• Kenakan pakaian yang menutupi tubuh, seperti baju lengan panjang dan celana panjang, untuk melindungi kulit dari sinar matahari.\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        '• Gunakan pula topi dan kacamata hitam saat keluar rumah, untuk memberikan perlindungan lebih terhadap kepala dan mata dari radiasi sinar matahari.\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        '• Hindari penggunaan tanning bed, yaitu alat untuk menggelapkan kulit, karena dapat memancarkan radiasi ultraviolet yang berbahaya bagi kulit.\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        '• Hati-hati saat menggunakan obat yang menyebabkan efek samping pada kulit, seperti antibiotic. Agar aman, konsultasikan kepada dokter terlebih dulu.\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        '• Lakukan pemeriksaan kulit secara rutin dan segera konsultasikan kepada dokter jika Anda mencurigai adanya perubahan atau kelainan pada kulit.\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'LeagueSpartan',
                          color: Color(0xFF5C715E),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF5C715E),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Color(0xFFF2F9F1),
                    ),
                    onPressed: () {
                      // handle edit button press
                    },
                    iconSize: 30.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF5C715E),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Color(0xFFF2F9F1),
                    ),
                    onPressed: () {
                      // handle delete button press
                    },
                    iconSize: 30.0,
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(140, 28),
                  foregroundColor: const Color(0xFFF2F9F1),
                  backgroundColor: const Color(0xFF5C715E),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ), // Reduce the vertical padding
                ),
                onPressed: () {
                  // handle save button press
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'LeagueSpartan',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
