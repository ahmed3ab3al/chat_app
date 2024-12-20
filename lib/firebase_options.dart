// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyBWoXuBIjyI_uzPJFyVCd_9tRyHsiqEuQw',
    appId: '1:280068875115:web:4597e4ba809218ac67222e',
    messagingSenderId: '280068875115',
    projectId: 'chat-app-47794',
    authDomain: 'chat-app-47794.firebaseapp.com',
    storageBucket: 'chat-app-47794.appspot.com',
    measurementId: 'G-YMR08DDSXQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXkTrWX2w0TJbtLm2jO8Q7Emw4eMk9wAE',
    appId: '1:280068875115:android:dc2e842e8096ddf567222e',
    messagingSenderId: '280068875115',
    projectId: 'chat-app-47794',
    storageBucket: 'chat-app-47794.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA27KQjRL9xsHLvQdeCRqepE7o5OTSlsrE',
    appId: '1:280068875115:ios:dbeb6912ecfdb22c67222e',
    messagingSenderId: '280068875115',
    projectId: 'chat-app-47794',
    storageBucket: 'chat-app-47794.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA27KQjRL9xsHLvQdeCRqepE7o5OTSlsrE',
    appId: '1:280068875115:ios:dbeb6912ecfdb22c67222e',
    messagingSenderId: '280068875115',
    projectId: 'chat-app-47794',
    storageBucket: 'chat-app-47794.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBWoXuBIjyI_uzPJFyVCd_9tRyHsiqEuQw',
    appId: '1:280068875115:web:577068d6e27b3c0c67222e',
    messagingSenderId: '280068875115',
    projectId: 'chat-app-47794',
    authDomain: 'chat-app-47794.firebaseapp.com',
    storageBucket: 'chat-app-47794.appspot.com',
    measurementId: 'G-GBZ5L1JYXC',
  );
}
