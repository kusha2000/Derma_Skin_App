import 'dart:io';

import 'package:derma_skin_app/Pages/Get_Started_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:derma_skin_app/Pages/Risk_Profile/risk_start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyB_gdRQgSX3IpVdD5x0mHt3MKue8VamsTg",
            appId: "1:394579831287:android:09cd275b0288a25560a6f2",
            messagingSenderId: "394579831287",
            projectId: "derma-1994e",
            storageBucket: "derma-1994e.appspot.com",
          ),
        )
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      // home: StartRiskProfile(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStarted(),
    );
  }
}
