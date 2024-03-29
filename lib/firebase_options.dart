// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBxjrPMHN5nFfvQIIv0WwmCJRHTpvVfUDo',
    appId: '1:566172859630:web:f9d2d0eade5ba836c907ff',
    messagingSenderId: '566172859630',
    projectId: 'thewall-40672',
    authDomain: 'thewall-40672.firebaseapp.com',
    storageBucket: 'thewall-40672.appspot.com',
    measurementId: 'G-NDFS247B39',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpV67H5duIFND1hnJB7lLzgkvwIoGBzOY',
    appId: '1:566172859630:android:273b32041217c6b4c907ff',
    messagingSenderId: '566172859630',
    projectId: 'thewall-40672',
    storageBucket: 'thewall-40672.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDl3yr2MWJ_W76SNlSuRatv89TqRTkOTbE',
    appId: '1:566172859630:ios:9f07b96a1648b699c907ff',
    messagingSenderId: '566172859630',
    projectId: 'thewall-40672',
    storageBucket: 'thewall-40672.appspot.com',
    iosBundleId: 'com.example.thewall',
  );
}
