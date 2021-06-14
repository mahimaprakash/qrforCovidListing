import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qrcodescannerforcovidlist/screens/landing/landing.dart';

class Signout extends StatefulWidget {
  const Signout({Key? key}) : super(key: key);

  @override
  _SignoutState createState() => _SignoutState();
}

class _SignoutState extends State<Signout> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextButton(
            child: Text("Sign Out"),
            onPressed: () {
              _signOut().whenComplete(() => Navigator.of(context)
                  .pushReplacement(
                      MaterialPageRoute(builder: (_) => LandingPage())));
            },
          ),
        ],
      ),
    );
  }

  Future _signOut() async {
    await _auth.signOut();
  }
}
