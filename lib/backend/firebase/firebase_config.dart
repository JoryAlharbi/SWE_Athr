import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAtwW0fcTYGAt9i7pdbeb1WbnrAO3Gy6Bc",
            authDomain: "athr-21c07.firebaseapp.com",
            projectId: "athr-21c07",
            storageBucket: "athr-21c07.appspot.com",
            messagingSenderId: "429475438720",
            appId: "1:429475438720:web:3cf93f146b0676bc134665",
            measurementId: "G-2SBLK3VJLH"));
  } else {
    await Firebase.initializeApp();
  }
}
