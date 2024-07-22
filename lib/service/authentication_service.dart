import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skinalert/execption/auth_execption_handler.dart';

class AuthenticationService {
  late AuthResultStatus status;

  Future<AuthResultStatus> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final UserCredential authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (authResult.user != null) {
        status = AuthResultStatus.successful;
      } else {
        status = AuthResultStatus.undefined;
      }
      return status;
    } catch (msg) {
      status = AuthExceptionHandler.handleException(msg);
    }
    return status;
  }

  // ignore: non_constant_identifier_names
  Future<AuthResultStatus> SignUpWithEmailAndPassword(
      {required String fullName,
      required String email,
      required String password,
      required String mobileNumber,
      required Timestamp dob}) async {
    try {
      final UserCredential authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (authResult.user != null) {
        _saveUserDetails(
            image: null,
            fullName: fullName,
            email: email,
            mobileNumber: mobileNumber,
            dob: dob,
            userId: authResult.user!.uid);
        status = AuthResultStatus.successful;
      } else {
        status = AuthResultStatus.undefined;
      }
    } catch (msg) {
      status = AuthExceptionHandler.handleException(msg);
    }
    return status;
  }

  void _saveUserDetails(
      {required String fullName,
      email,
      userId,
      required Timestamp dob,
      required String mobileNumber,
      image}) {
    FirebaseFirestore.instance.collection('users').doc(userId).set({
      'image': image,
      'fullName': fullName,
      'email': email,
      'mobileNumber': mobileNumber,
      'dob': dob,
      'userId': userId,
    });
  }
}
