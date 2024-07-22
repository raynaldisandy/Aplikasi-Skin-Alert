import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:skinalert/home/floatingNavbar/History.dart';
import 'package:skinalert/home/floatingNavbar/profile.dart';
import 'package:skinalert/home/floatingNavbar/team.dart';
import 'package:skinalert/home/floatingNavbar/home.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _indexNavbar = 0;

  final List<Widget> screenPage = [
    const MyHomePage(),
    const  HistoryPage(),
    const ProfilePage(),
    const ProjectTeamPage(),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xFFF2F9F1),
      body: screenPage.elementAt(_indexNavbar),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: FloatingNavbar(
          onTap: (int val) {
            setState(() {
              _indexNavbar = val;
            });
          },
          currentIndex: _indexNavbar,
          backgroundColor: const Color(0xFF5C715E),
          selectedItemColor: Colors.black,
          unselectedItemColor: const Color(0xFFF2F9F1),
          items: [
            FloatingNavbarItem(icon: Icons.home),
            FloatingNavbarItem(icon: Icons.history),
            FloatingNavbarItem(icon: Icons.person_outline),
            FloatingNavbarItem(icon: Icons.info_outline),
          ],
        ),
      ),
    );
  }
}
