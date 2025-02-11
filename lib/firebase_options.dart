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
    apiKey: 'AIzaSyAjLvXVTxkLpLplBDRK-b6iatniLU_Ie3w',
    appId: '1:549178427896:web:3185b09729a2c3c8d06e0d',
    messagingSenderId: '549178427896',
    projectId: 'socialaura',
    authDomain: 'socialaura.firebaseapp.com',
    storageBucket: 'socialaura.appspot.com',
    measurementId: 'G-11N6WGXZWQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCl3lvtBIGs4ctn9uFnhtN4YT0JhSrLNCA',
    appId: '1:549178427896:android:3fa9d6c0ccb2811ad06e0d',
    messagingSenderId: '549178427896',
    projectId: 'socialaura',
    storageBucket: 'socialaura.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAR-glUvv179495cK5pUrtA7sF61AOPYpM',
    appId: '1:549178427896:ios:0c0b2832eb8fff80d06e0d',
    messagingSenderId: '549178427896',
    projectId: 'socialaura',
    storageBucket: 'socialaura.appspot.com',
    androidClientId: '549178427896-41kr1ohch2ffpm3018iqj4u965rb0qca.apps.googleusercontent.com',
    iosClientId: '549178427896-b1ouqu98amnrja0qvqt8c8921qe1ctbl.apps.googleusercontent.com',
    iosBundleId: 'com.example.urbanCulture',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAR-glUvv179495cK5pUrtA7sF61AOPYpM',
    appId: '1:549178427896:ios:0c0b2832eb8fff80d06e0d',
    messagingSenderId: '549178427896',
    projectId: 'socialaura',
    storageBucket: 'socialaura.appspot.com',
    androidClientId: '549178427896-41kr1ohch2ffpm3018iqj4u965rb0qca.apps.googleusercontent.com',
    iosClientId: '549178427896-b1ouqu98amnrja0qvqt8c8921qe1ctbl.apps.googleusercontent.com',
    iosBundleId: 'com.example.urbanCulture',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAjLvXVTxkLpLplBDRK-b6iatniLU_Ie3w',
    appId: '1:549178427896:web:c4ecc0342429fd24d06e0d',
    messagingSenderId: '549178427896',
    projectId: 'socialaura',
    authDomain: 'socialaura.firebaseapp.com',
    storageBucket: 'socialaura.appspot.com',
    measurementId: 'G-3BYB53SWN7',
  );
}
