import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qrcodescannerforcovidlist/screens/home/homewrapper.dart';
import 'package:qrcodescannerforcovidlist/screens/landing/landing.dart';
import 'package:qrcodescannerforcovidlist/services/authService.dart';
import 'package:qrcodescannerforcovidlist/utils/theme.dart';
import 'package:qrcodescannerforcovidlist/widgets/provider_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme().buildTheme(),
        home: HomeController(),
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder(
        stream: auth.authStateChanges,
        builder: (context, AsyncSnapshot<String?> snap) {
          if (snap.connectionState == ConnectionState.active) {
            final bool signedIn = snap.hasData;
            return signedIn ? HomeWrapper() : LandingPage();
          }
          return CircularProgressIndicator();
        });
  }
}
