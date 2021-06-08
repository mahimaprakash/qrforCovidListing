import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qrcodescannerforcovidlist/screens/home/home.dart';
import 'package:qrcodescannerforcovidlist/screens/landing/landing.dart';
import 'package:qrcodescannerforcovidlist/utils/theme.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR for Covid',
      theme: MyTheme().buildTheme(),
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
