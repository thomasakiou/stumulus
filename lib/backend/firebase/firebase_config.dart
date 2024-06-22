import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBVtmLSBC0rWGhHRGYCw_T61s-IkCmxU9s",
            authDomain: "quizapp-5566d.firebaseapp.com",
            projectId: "quizapp-5566d",
            storageBucket: "quizapp-5566d.appspot.com",
            messagingSenderId: "790182096531",
            appId: "1:790182096531:web:3a89b9dd831f955fb96766"));
  } else {
    await Firebase.initializeApp();
  }
}
