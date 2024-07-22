import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skinalert/home/floatingNavbar/home.dart';
import 'package:skinalert/user_authentication/login_or_signup.dart';
import 'package:skinalert/home/admin/AdminMainPage.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              // Mengambil data pengguna dari Firestore
              return FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users') // Pastikan koleksi ini ada
                    .doc(snapshot.data!.uid) // Menggunakan UID pengguna
                    .get(),
                builder:
                    (context, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
                  if (userSnapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (userSnapshot.hasError) {
                    return const Text('Error loading user data');
                  } else if (!userSnapshot.data!.exists) {
                    return const Text('User not found');
                  } else {
                    var userData =
                        userSnapshot.data!.data() as Map<String, dynamic>;
                    bool isAdmin =
                        userData['role'] == 'admin'; // Memeriksa peran pengguna
                    // Mengarahkan ke halaman yang sesuai
                    return isAdmin
                        ? AdminMainPage(user: snapshot.data!)
                        : MyHomePage(User: snapshot.data);
                  }
                },
              );
            } else {
              return const LoginOrSignUp(); // Jika tidak ada pengguna yang terautentikasi
            }
          }
        },
      ),
    );
  }
}
