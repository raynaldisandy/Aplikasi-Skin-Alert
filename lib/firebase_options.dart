import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCVM0gcRqxq4C2P589VdJzyacU4QV1teVs',
    appId: '1:104331017775:web:6a0fb4b9778681fd66d0da',
    messagingSenderId: '104331017775',
    projectId: 'skin-alerts-apps',
    authDomain: 'skin-alerts-apps.firebaseapp.com',
    databaseURL:
        'https://skin-alerts-apps-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'skin-alerts-apps.appspot.com',
    measurementId: 'G-C3MBDXZ6L2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqyK-D2UEqxUslRkP7-xHBwLQcKOHY778',
    appId: '1:104331017775:android:b17b3cdd4e3915c666d0da',
    messagingSenderId: '104331017775',
    projectId: 'skin-alerts-apps',
    databaseURL:
        'https://skin-alerts-apps-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'skin-alerts-apps.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0kVdOMJffBGhVVFicKfWGS_5abg-D_VU',
    appId: '1:104331017775:ios:56775d2db93f941666d0da',
    messagingSenderId: '104331017775',
    projectId: 'skin-alerts-apps',
    databaseURL:
        'https://skin-alerts-apps-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'skin-alerts-apps.appspot.com',
    iosClientId:
        '104331017775-t7ml8264kdvqbdjq4p4i31dpeecrmd09.apps.googleusercontent.com',
    iosBundleId: 'com.example.skinalert',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0kVdOMJffBGhVVFicKfWGS_5abg-D_VU',
    appId: '1:104331017775:ios:56775d2db93f941666d0da',
    messagingSenderId: '104331017775',
    projectId: 'skin-alerts-apps',
    databaseURL:
        'https://skin-alerts-apps-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'skin-alerts-apps.appspot.com',
    iosClientId:
        '104331017775-t7ml8264kdvqbdjq4p4i31dpeecrmd09.apps.googleusercontent.com',
    iosBundleId: 'com.example.skinalert',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCVM0gcRqxq4C2P589VdJzyacU4QV1teVs',
    appId: '1:104331017775:web:56e746d2983a50a866d0da',
    messagingSenderId: '104331017775',
    projectId: 'skin-alerts-apps',
    authDomain: 'skin-alerts-apps.firebaseapp.com',
    databaseURL:
        'https://skin-alerts-apps-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'skin-alerts-apps.appspot.com',
    measurementId: 'G-NF2P91LH8N',
  );
}
