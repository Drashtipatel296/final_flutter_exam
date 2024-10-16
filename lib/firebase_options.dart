// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyCoLBgdt_gfeIQR3RzpfAQ_8TsFc4GgWE0',
    appId: '1:438973411326:web:e3aef445c9c7743b4a9aaf',
    messagingSenderId: '438973411326',
    projectId: 'final-exam-flutter-321f3',
    authDomain: 'final-exam-flutter-321f3.firebaseapp.com',
    storageBucket: 'final-exam-flutter-321f3.appspot.com',
    measurementId: 'G-Z2QD1H8RW4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNeyRMZaoVp6ig2iohgq9Fg1KA337b38o',
    appId: '1:438973411326:android:e7a82abcf7ed35114a9aaf',
    messagingSenderId: '438973411326',
    projectId: 'final-exam-flutter-321f3',
    storageBucket: 'final-exam-flutter-321f3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARJyePLhkWhkffIPYiFC3RF6LqoNtF6uE',
    appId: '1:438973411326:ios:59919d9fa7afeee04a9aaf',
    messagingSenderId: '438973411326',
    projectId: 'final-exam-flutter-321f3',
    storageBucket: 'final-exam-flutter-321f3.appspot.com',
    iosBundleId: 'com.example.finalFlutterExam',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyARJyePLhkWhkffIPYiFC3RF6LqoNtF6uE',
    appId: '1:438973411326:ios:59919d9fa7afeee04a9aaf',
    messagingSenderId: '438973411326',
    projectId: 'final-exam-flutter-321f3',
    storageBucket: 'final-exam-flutter-321f3.appspot.com',
    iosBundleId: 'com.example.finalFlutterExam',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCoLBgdt_gfeIQR3RzpfAQ_8TsFc4GgWE0',
    appId: '1:438973411326:web:7a1c6d149db1ecde4a9aaf',
    messagingSenderId: '438973411326',
    projectId: 'final-exam-flutter-321f3',
    authDomain: 'final-exam-flutter-321f3.firebaseapp.com',
    storageBucket: 'final-exam-flutter-321f3.appspot.com',
    measurementId: 'G-WDERLC82GR',
  );
}
