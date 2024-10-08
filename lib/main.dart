import 'dart:io';
import 'package:derma_skin_app/routers/router_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // firebase platform for android
//   void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Platform.isAndroid
//       ? await Firebase.initializeApp(
//           options: const FirebaseOptions(
//             apiKey: "AIzaSyB_gdRQgSX3IpVdD5x0mHt3MKue8VamsTg",
//             appId: "1:394579831287:android:09cd275b0288a25560a6f2",
//             messagingSenderId: "394579831287",
//             projectId: "derma-1994e",
//             storageBucket: "derma-1994e.appspot.com",
//           ),
//         )
//       : await Firebase.initializeApp();

//   runApp(const MyApp());
// }

  // Firebase initialization for both web and mobile platforms
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB_gdRQgSX3IpVdD5x0mHt3MKue8VamsTg",
        authDomain: "derma-1994e.firebaseapp.com",
        projectId: "derma-1994e",
        storageBucket: "derma-1994e.appspot.com",
        messagingSenderId: "394579831287",
        appId: "1:394579831287:web:09cd275b0288a25560a6f2",
      ),
    );
  } else if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB_gdRQgSX3IpVdD5x0mHt3MKue8VamsTg",
        appId: "1:394579831287:android:09cd275b0288a25560a6f2",
        messagingSenderId: "394579831287",
        projectId: "derma-1994e",
        storageBucket: "derma-1994e.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Derma App",
      routerConfig: RouterPage.router,
    );
  }
}
