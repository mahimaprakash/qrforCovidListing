import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qrcodescannerforcovidlist/screens/home/home.dart';
import 'package:qrcodescannerforcovidlist/screens/landing/landing.dart';
import 'package:qrcodescannerforcovidlist/services/authentication.dart';
import 'package:qrcodescannerforcovidlist/utils/theme.dart';

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
            return signedIn ? HomeScreen() : LandingPage();
          }
          return CircularProgressIndicator();
        });
  }
}

class Provider extends InheritedWidget {
  final AuthService auth;
  Provider({Key? key, required Widget child, required this.auth})
      : super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider);
}
