import 'package:flutter/material.dart';
import 'package:skinalert/authentication/authentication_wrapper.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AuthenticationWrapper()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              width: 200,
              height: 200,
              margin: const EdgeInsets.only(bottom: 30),
              color: Colors.transparent,
              child: Image.asset('assets/Icons/logo.png'),
            ),
            const Text(
              'Skin',
              style: TextStyle(
                fontFamily: 'lobster-two', // Use a custom font if available
                fontSize: 58,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C4237),
              ),
            ),
            const Text(
              'Alert',
              style: TextStyle(
                fontFamily: 'lobster-two', // Use a custom font if available
                fontSize: 58,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C4237),
              ),
            ),
            const SizedBox(height: 20),
            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome ',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter-Bold',
                            color: Color(0xFF2C4237),
                          ),
                        ),
                        TextSpan(
                          text: 'SkinAlert Apps,',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter-Bold',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C4237),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Solusi cerdas untuk deteksi dini kanker kulit.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Inter-Bold',
                      color: Color(0xFF2C4237),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
