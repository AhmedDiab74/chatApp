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
        return macos;
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
    apiKey: 'AIzaSyDodjDXiKCK_EarxJ7wRfqnz9aiVV5Lxj8',
    appId: '1:299252917200:web:fdc958a0a3e10a3292cfd5',
    messagingSenderId: '299252917200',
    projectId: 'chat-app-ea2dc',
    authDomain: 'chat-app-ea2dc.firebaseapp.com',
    storageBucket: 'chat-app-ea2dc.appspot.com',
    measurementId: 'G-JL5N2SDTGW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxHzPQfTAYK4OrQbs-y44dz89crtxBfkY',
    appId: '1:299252917200:android:fca4647da2fa0da492cfd5',
    messagingSenderId: '299252917200',
    projectId: 'chat-app-ea2dc',
    storageBucket: 'chat-app-ea2dc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpLoNi1uFRk5un5bu95stS6d_AVmWKhO4',
    appId: '1:299252917200:ios:f0a7cfc9339f11b992cfd5',
    messagingSenderId: '299252917200',
    projectId: 'chat-app-ea2dc',
    storageBucket: 'chat-app-ea2dc.appspot.com',
    androidClientId: '299252917200-75v4g16b5ffad0n3u28g1qrbqsg0mup3.apps.googleusercontent.com',
    iosClientId: '299252917200-baism5q7j6kqbrgo0ssgud8kke26vcqm.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpLoNi1uFRk5un5bu95stS6d_AVmWKhO4',
    appId: '1:299252917200:ios:93f38aed85641d1b92cfd5',
    messagingSenderId: '299252917200',
    projectId: 'chat-app-ea2dc',
    storageBucket: 'chat-app-ea2dc.appspot.com',
    androidClientId: '299252917200-75v4g16b5ffad0n3u28g1qrbqsg0mup3.apps.googleusercontent.com',
    iosClientId: '299252917200-a29jmdrdjkhmtk6hatb7a7g9d2d0i2mf.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
