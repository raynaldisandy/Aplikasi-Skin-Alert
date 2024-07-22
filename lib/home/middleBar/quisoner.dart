import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skinalert/home/middleBar/result.dart';
import 'package:skinalert/home/floatingNavbar/home.dart';

class QuisonerPage extends StatefulWidget {
  const QuisonerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuisonerPageState createState() => _QuisonerPageState();
}

class _QuisonerPageState extends State<QuisonerPage>
    with SingleTickerProviderStateMixin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> _quisioners = [];
  int currentIndex = 0;
  double combinedCF = 0.0;
  String _riskCategory = '';
  final Timestamp _date = Timestamp.now();
  late AnimationController _controller;
  late Animation<double> _animation;
  String _fullName = '';
  String? _userImage;
  // Timestamp? _dob;
  String? _userId;
  double? combinedCFPercentage;
  String? adviceText;

  void setAdviceText() {
    List<String> text = [
      'Segera Konsultasi Spesialis: Temui ahli onkologi kulit untuk evaluasi mendalam.\nIkuti Rencana Pengobatan: Lakukan biopsi dan ikuti terapi sesuai rekomendasi dokter.\nPemantauan Intensif: Jadwalkan kunjungan ke dokter kulit setiap 3-6 bulan.',
      'Konsultasi Dokter: Jadwalkan kunjungan ke dokter kulit segera.\nPertimbangkan Biopsi: Ikuti saran dokter untuk pemeriksaan lebih lanjut.\nPemantauan: Lakukan pemeriksaan kulit sendiri setiap bulan.',
      'Pantau Perubahan: Amati bintik atau tahi lalat secara berkala.\nKunjungi Dokter Kulit: Lakukan pemeriksaan rutin setiap 1-2 tahun.\nGunakan Tabir Surya: Lindungi kulit dari sinar matahari dengan SPF 30.'
    ];
    setState(() {
      if (combinedCF >= 0.0 && combinedCF <= 0.4) {
        setState(() {
          adviceText = text[2];
        });
      } else if (combinedCF > 0.4 && combinedCF <= 0.7) {
        setState(() {
          adviceText = text[1];
        });
      } else if (combinedCF > 0.7 && combinedCF <= 1.0) {
        setState(() {
          adviceText = text[0];
        });
      } else {
        setState(() {
          adviceText = 'error';
        });
      }
    });
  }

  void calculatePercentage() {
    setState(() {
      combinedCFPercentage = combinedCF * 100;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _fetchquisioners();
    _fetchFullName();
    _fetchUserId();
  }

  Future<void> _fetchquisioners() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('quisioners').get();
    setState(() {
      _quisioners = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  Future<void> _fetchFullName() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('users').doc(user.uid).get();
      setState(() {
        _fullName = documentSnapshot.get('fullName');
        _userImage = documentSnapshot.get('image');
        // _dob = documentSnapshot.get('dob');
      });
    }
  }

  Future<void> _fetchUserId() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _userId = user.uid;
      });
    }
  }

  void _answerQuestion(bool answer) {
    setState(() {
      if (answer == true) {
        double bobotPertanyaan =
            double.parse(_quisioners[currentIndex]['bobot']);
        combinedCF = _combineCF(combinedCF, bobotPertanyaan);
      }
      currentIndex++;
      if (currentIndex < _quisioners.length) {
        _controller.reset();
        _controller.forward();
      } else {
        _riskCategory = _determineRiskCategory(combinedCF);
        calculatePercentage();
        setAdviceText();
        _saveResult();
      }
    });
  }

  double _combineCF(double bobot1, double bobot2) {
    final result = bobot1 + bobot2 * (1 - bobot1);
    return result;
  }

  _determineRiskCategory(double combinedCF) {
    if (combinedCF >= 0.0 && combinedCF <= 0.4) {
      return 'Risiko Rendah';
    } else if (combinedCF > 0.4 && combinedCF <= 0.7) {
      return 'Risiko Sedang';
    } else if (combinedCF > 0.7 && combinedCF <= 1.0) {
      return 'Risiko Tinggi';
    } else {
      return 'Nilai CF tidak valid';
    }
  }

  Future<void> _saveResult() async {
    if (_userId != null) {
      await _firestore.collection('results').add({
        'point': combinedCF,
        'description': _riskCategory,
        'date': Timestamp.now(),
        'userId': _userId,
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = currentIndex / _quisioners.length;
    if (currentIndex < _quisioners.length) {
      _controller.forward();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF2F9F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile section
              Container(
                padding: const EdgeInsets.all(16.0),
                color: const Color(
                    0xFFF2F9F1), // Background color for profile section
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      foregroundImage: _userImage != null
                          ? NetworkImage(_userImage!)
                          : const AssetImage('assets/Icons/logo2.png')
                              as ImageProvider, // Add your profile picture asset here
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hi, WelcomeBack',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF5C715E),
                            fontFamily: 'LeagueSpartan',
                          ),
                        ),
                        Text(
                          _fullName,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return CircularPercentIndicator(
                              radius: 130.0,
                              lineWidth: 15.0,
                              percent: currentIndex < _quisioners.length
                                  ? progress * _animation.value
                                  : 1.0,
                              center: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Skin\nAlert',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 58,
                                      fontFamily: 'lobster-two',
                                      color: Color(0xFF2C4237),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: const Color(0xFFB6CDBD),
                              progressColor: const Color(0xFF5C715E),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        if (currentIndex < _quisioners.length)
                          Column(
                            children: [
                              Text(
                                _quisioners[currentIndex]['question'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Color(0xFF5C715E),
                                  fontFamily: 'LeagueSpartan',
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _answerQuestion(true);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(
                                          0xFF2C4237), // Adjusted color to match the image
                                      minimumSize: const Size(100,
                                          50), // Set the size to ensure both buttons are the same
                                    ),
                                    child: const Text(
                                      'Ya',
                                      style: TextStyle(
                                        fontFamily: 'LeagueSpartan',
                                        color: Color(0xFFF2F9F1),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _answerQuestion(false);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(
                                          0xFF2C4237), // Adjusted color to match the image
                                      minimumSize: const Size(100,
                                          50), // Set the size to ensure both buttons are the same
                                    ),
                                    child: const Text(
                                      'Tidak',
                                      style: TextStyle(
                                        color: Color(0xFFF2F9F1),
                                        fontFamily: 'LeagueSpartan',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        else
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Quisoner Completed!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'LeagueSpartan',
                                  color: Color(0xFF2C4237),
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      20), // add some space between the text and buttons
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResultPage(
                                              combinedCF: combinedCF,
                                              date: _date,
                                              riskCategory: _riskCategory,
                                              description: _riskCategory,
                                              fullName: _fullName,
                                              combinedCFPercentage:
                                                  combinedCFPercentage!,
                                              adviceText: adviceText,
                                              // dob: Timestamp.now(),
                                            )),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF5C715E),
                                  foregroundColor: const Color(0xFFF2F9F1),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'LeagueSpartan'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text('Show The Result'),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyHomePage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF5C715E),
                                  foregroundColor: const Color(0xFFF2F9F1),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'LeagueSpartan'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text('Back to Homepage'),
                              ),
                            ],
                          )
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
