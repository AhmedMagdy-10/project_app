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
    apiKey: 'AIzaSyBNpih9rt-PvCAI0E90pskKGQeghsxAr3Y',
    appId: '1:320011266528:web:5f3be2c63aa1931b77a385',
    messagingSenderId: '320011266528',
    projectId: 'project-app-96aac',
    authDomain: 'project-app-96aac.firebaseapp.com',
    storageBucket: 'project-app-96aac.appspot.com',
    measurementId: 'G-X069F26TR7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFWe6I7I0AwOLXUSVi-_QbOcJ3KGTLe4s',
    appId: '1:320011266528:android:c67e35db90e6761677a385',
    messagingSenderId: '320011266528',
    projectId: 'project-app-96aac',
    storageBucket: 'project-app-96aac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNcWBgefXyc3l93_J1tppexd8a1wlslmQ',
    appId: '1:320011266528:ios:77185d92d149cc6977a385',
    messagingSenderId: '320011266528',
    projectId: 'project-app-96aac',
    storageBucket: 'project-app-96aac.appspot.com',
    iosBundleId: 'com.example.projectApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNcWBgefXyc3l93_J1tppexd8a1wlslmQ',
    appId: '1:320011266528:ios:537915153f2d79f577a385',
    messagingSenderId: '320011266528',
    projectId: 'project-app-96aac',
    storageBucket: 'project-app-96aac.appspot.com',
    iosBundleId: 'com.example.projectApp.RunnerTests',
  );
}