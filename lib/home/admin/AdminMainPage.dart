import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skinalert/user_authentication/loginpage.dart';
import 'symptomps.dart';
import 'Diagnosis.dart';
import 'Quisioner.dart';

class AdminMainPage extends StatefulWidget {
  final User user;

  const AdminMainPage({super.key, required this.user});

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  int _index = 0; // State variable to keep track of selected tab

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildSymptomsPage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavButton(0, 'Symptoms', screenWidth),
              _buildNavButton(1, 'Diagnosis And Treatment', screenWidth),
              _buildNavButton(2, 'Quisioner', screenWidth),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: IndexedStack(
              index: _index,
              children: const [
                SymptomsPage(),
                DiagnosisPage(),
                QuisonersPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(int index, String title, double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.25, // Set the width relative to screen size
      child: TextButton(
        onPressed: () {
          setState(() => _index = index);
        },
        style: ButtonStyle(
          backgroundColor: _index == index
              ? WidgetStateProperty.all(const Color(0xFF5C715E))
              : WidgetStateProperty.all(const Color(0xFFF2F9F1)),
          foregroundColor: _index == index
              ? WidgetStateProperty.all(const Color(0xFFF2F9F1))
              : WidgetStateProperty.all(const Color(0xFF5C715E)),
          padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
          textStyle: WidgetStateProperty.all(const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 10,
            fontWeight: FontWeight.bold,
          )),
        ),
        child: Text(title),
      ),
    );
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F9F1),
      extendBody: true,
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(100.0), // Set the height of the app bar
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffF2F9F1),
          flexibleSpace: Container(
            padding: const EdgeInsets.only(top: 40.0, left: 15.0, right: 15.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/Icons/logo2.png'),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hi, WelcomeBack',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF5C715E),
                          fontFamily: 'LeagueSpartan'),
                    ),
                    Text(
                      'Admin',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LeagueSpartan'),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: _logout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5C715E),
                    foregroundColor: const Color(0xFFF2F9F1),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LeagueSpartan'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Logout'),
                ),
                const SizedBox(width: 10), // Add space between icons
              ],
            ),
          ),
        ),
      ),
      body: buildSymptomsPage(context),
    );
  }
}
