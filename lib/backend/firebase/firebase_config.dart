import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBk8pHFF6y13WkVMTSKeHYuKaE2CVCaMQs",
            authDomain: "mobix-408923.firebaseapp.com",
            projectId: "mobix-408923",
            storageBucket: "mobix-408923.firebasestorage.app",
            messagingSenderId: "919262776871",
            appId: "1:919262776871:web:3eb65205e92af513148802"));
  } else {
    await Firebase.initializeApp();
  }
}
