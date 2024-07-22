import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skinalert/home/middleBar/result.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> _history = [];
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  User? _currentUser;
  String? _fullName;
  String? _image; // Add this line to hold the profile image URL

  @override
  void initState() {
    super.initState();
    _fetchHistory();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      _currentUser = user;
    });
    if (_currentUser != null) {
      final userDoc = await _usersCollection.doc(_currentUser!.uid).get();
      setState(() {
        _fullName = userDoc.get('fullName');
        _image = userDoc.get('image'); // Get the image URL from Firestore
      });
    }
  }

  Future<void> _fetchHistory() async {
    QuerySnapshot querySnapshot = await _firestore.collection('results').get();
    setState(() {
      _history = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  double? combinedCFPercentage;
  String? adviceText;
  double? userPoint;

  void setAdviceText() {
    List<String> text = [
      'Segera Konsultasi Spesialis: Temui ahli onkologi kulit untuk evaluasi mendalam.\nIkuti Rencana Pengobatan: Lakukan biopsi dan ikuti terapi sesuai rekomendasi dokter.\nPemantauan Intensif: Jadwalkan kunjungan ke dokter kulit setiap 3-6 bulan.',
      'Konsultasi Dokter: Jadwalkan kunjungan ke dokter kulit segera.\nPertimbangkan Biopsi: Ikuti saran dokter untuk pemeriksaan lebih lanjut.\nPemantauan: Lakukan pemeriksaan kulit sendiri setiap bulan.',
      'Pantau Perubahan: Amati bintik atau tahi lalat secara berkala.\nKunjungi Dokter Kulit: Lakukan pemeriksaan rutin setiap 1-2 tahun.\nGunakan Tabir Surya: Lindungi kulit dari sinar matahari dengan SPF 30.'
    ];

    if (userPoint != null) {
      if (userPoint! >= 0.0 && userPoint! <= 0.4) {
        setState(() {
          adviceText = text[2];
        });
      } else if (userPoint! > 0.4 && userPoint! <= 0.7) {
        setState(() {
          adviceText = text[1];
        });
      } else if (userPoint! > 0.7 && userPoint! <= 1.0) {
        setState(() {
          adviceText = text[0];
        });
      } else {
        setState(() {
          adviceText = 'error';
        });
      }
    }
  }

  void calculatePercentage() {
    setState(() {
      combinedCFPercentage = userPoint! * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F9F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                color: const Color(0xFFF2F9F1),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      foregroundImage: _image != null
                          ? NetworkImage(_image!)
                          : const AssetImage('assets/Icons/logo2.png')
                              as ImageProvider,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hi, Welcome Back',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF5C715E),
                            fontFamily: 'LeagueSpartan',
                          ),
                        ),
                        Text(
                          _fullName ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LeagueSpartan',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Card(
                  color: const Color(0xFFF2F9F1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'My History',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'LeagueSpartan',
                              color: Color(0xFF5C715E),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (_history.isEmpty)
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/Icons/logo3.png'),
                                const SizedBox(height: 20),
                                const Text(
                                  'Belum Ada Riwayat Pengecekan Kanker Kulit',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF5C715E),
                                    fontFamily: 'LeagueSpartan',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        else
                          Expanded(
                            child: ListView.builder(
                              itemCount: _history.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  color: const Color(0xFFF2F9F1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(color: Colors.black),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/Icons/logo1.png',
                                          height: 50,
                                          width: 50,
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                (_history[index]['date']
                                                        as Timestamp)
                                                    .toDate()
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'LeagueSpartan',
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const Text(
                                                'Telah Melakukan Check For Skin Cancer',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'LeagueSpartan',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              userPoint =
                                                  _history[index]['point'];
                                            });
                                            setAdviceText();
                                            calculatePercentage();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ResultPage(
                                                  combinedCF: _history[index]
                                                          ['combinedCF'] ??
                                                      0.0,
                                                  date: _history[index]['date'],
                                                  riskCategory: _history[index]
                                                          ['riskCategory'] ??
                                                      '',
                                                  description: _history[index]
                                                          ['description'] ??
                                                      '',
                                                  fullName: _fullName!,
                                                  adviceText: adviceText,
                                                  combinedCFPercentage:
                                                      combinedCFPercentage,
                                                ),
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF5C715E),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                          ),
                                          child: const Text(
                                            'Lihat Hasil',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFFF2F9F1),
                                              fontFamily: 'LeagueSpartan',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
