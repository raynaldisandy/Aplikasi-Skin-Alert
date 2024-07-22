import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skinalert/firebase_options.dart';
import 'package:skinalert/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SkinAlert',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
