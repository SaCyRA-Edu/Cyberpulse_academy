// ⚠️ PLACEHOLDER FILE — REPLACE THIS BEFORE RUNNING THE APP ⚠️
//
// This file exists only so the project compiles before you've set up your
// own Firebase project. The values below are NOT real and will NOT work.
//
// To generate the real version of this file:
//   1. Create a Firebase project at https://console.firebase.google.com
//   2. Install the FlutterFire CLI:  dart pub global activate flutterfire_cli
//   3. From your project root, run:  flutterfire configure
//   4. Follow the prompts (select your Firebase project, select Android/iOS/web)
//   5. This file will be automatically regenerated with your real project's
//      configuration values — you do not need to edit it by hand.
//
// Full setup instructions (including enabling Google/Facebook/Email sign-in
// and registering your Android app) are in FIREBASE_SETUP.md at the project
// root.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for this platform. '
          'Run `flutterfire configure` from your project root to generate a '
          'real firebase_options.dart file — see FIREBASE_SETUP.md.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'REPLACE_ME',
    appId: 'REPLACE_ME',
    messagingSenderId: 'REPLACE_ME',
    projectId: 'REPLACE_ME',
    authDomain: 'REPLACE_ME',
    storageBucket: 'REPLACE_ME',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'REPLACE_ME',
    appId: 'REPLACE_ME',
    messagingSenderId: 'REPLACE_ME',
    projectId: 'REPLACE_ME',
    storageBucket: 'REPLACE_ME',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'REPLACE_ME',
    appId: 'REPLACE_ME',
    messagingSenderId: 'REPLACE_ME',
    projectId: 'REPLACE_ME',
    storageBucket: 'REPLACE_ME',
    iosBundleId: 'REPLACE_ME',
  );
}
