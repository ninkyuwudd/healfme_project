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
    apiKey: 'AIzaSyALbCE4XMbEMKzh2xLHeFsjhEs1yjHF4_A',
    appId: '1:251042767140:web:aebeca8776dee85a32d3b1',
    messagingSenderId: '251042767140',
    projectId: 'healthantri',
    authDomain: 'healthantri.firebaseapp.com',
    storageBucket: 'healthantri.appspot.com',
    measurementId: 'G-D1FXJ592EQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACJBrnyjWQxpHpBDDYB5kU1HMkRfDVu2U',
    appId: '1:251042767140:android:224f4120b8d7fe3132d3b1',
    messagingSenderId: '251042767140',
    projectId: 'healthantri',
    storageBucket: 'healthantri.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcJ8N5Vh_5ozLjJ1d16XIhvvJpPXZPqEs',
    appId: '1:251042767140:ios:cb5c7d55707d6e6432d3b1',
    messagingSenderId: '251042767140',
    projectId: 'healthantri',
    storageBucket: 'healthantri.appspot.com',
    iosClientId: '251042767140-hmcrd8m6520fqabp0f470oovrlno7f1k.apps.googleusercontent.com',
    iosBundleId: 'com.example.healthproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcJ8N5Vh_5ozLjJ1d16XIhvvJpPXZPqEs',
    appId: '1:251042767140:ios:cb5c7d55707d6e6432d3b1',
    messagingSenderId: '251042767140',
    projectId: 'healthantri',
    storageBucket: 'healthantri.appspot.com',
    iosClientId: '251042767140-hmcrd8m6520fqabp0f470oovrlno7f1k.apps.googleusercontent.com',
    iosBundleId: 'com.example.healthproject',
  );
}
