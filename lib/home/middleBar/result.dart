import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skinalert/home/floatingNavbar/home.dart';

class ResultPage extends StatefulWidget {
  final double combinedCF;
  final Timestamp date;
  final String riskCategory;
  final String description;
  final String fullName;
  final double? combinedCFPercentage;
  final String? adviceText;

  const ResultPage({
    super.key,
    required this.combinedCF,
    required this.date,
    required this.riskCategory,
    required this.description,
    required this.fullName,
    this.combinedCFPercentage,
    this.adviceText,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _fullName;
  String? _userImage;

  @override
  void initState() {
    super.initState();
    _fetchFullName();
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

  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F9F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Profile section
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: const Color(
                      0xFFF2F9F1), // Background color for profile section
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                                _fullName ??
                                    widget
                                        .fullName, // Display the fetched or provided name
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
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () => _logout(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5C715E),
                          foregroundColor: const Color(0xFFF2F9F1),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LeagueSpartan',
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Card(
                    color: const Color(
                        0xFFF2F9F1), // Change the background color to white
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            'Nama: ${_fullName ?? widget.fullName}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'LeagueSpartan',
                              color: Color(0xFF5C715E),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Tanggal Pengecekan: ${widget.date.toDate()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'LeagueSpartan',
                              color: Color(0xFF5C715E),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFF5C715E)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    'Tingkat Resiko Terpapar Kanker Kulit :',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'LeagueSpartan',
                                      color: Color(0xFF5C715E),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    widget.description,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      fontFamily: 'LeagueSpartan',
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Center(
                                    child: Text(
                                      'Tingkat Persentase Sebesar ${widget.combinedCFPercentage!.toStringAsFixed(2)} %',
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontFamily: 'LeagueSpartan',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Text(
                              widget.adviceText!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'LeagueSpartan',
                                color: Color(0xFF5C715E),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 32),
                          const Text(
                            'Perlu diperhatikan!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'LeagueSpartan',
                              color: Color(0xFF5C715E),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Hasil ini merupakan estimasi berdasarkan jawaban kuesioner dan bukan merupakan diagnosis medis. Penting untuk selalu berkonsultasi dengan tenaga medis profesional untuk penilaian yang akurat dan langkah penanganan yang tepat.',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'LeagueSpartan',
                              color: Color(0xFF5C715E),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                              height: 16), // Added a SizedBox here for spacing
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyHomePage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5C715E),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Back to Home',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'LeagueSpartan',
                                color: Color(0xFFF2F9F1),
                              ),
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
      ),
    );
  }
}
