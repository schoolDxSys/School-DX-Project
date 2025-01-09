import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAdUnnBirkJ2skcRRBS1xRsiXVAY4ab30A",
            authDomain: "school-d-x-sys-iryhwo.firebaseapp.com",
            projectId: "school-d-x-sys-iryhwo",
            storageBucket: "school-d-x-sys-iryhwo.firebasestorage.app",
            messagingSenderId: "231013297663",
            appId: "1:231013297663:web:40fe5a65176b5834da8bca"));
  } else {
    await Firebase.initializeApp();
  }
}
