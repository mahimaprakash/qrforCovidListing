import 'package:flutter/material.dart';
import 'package:qrcodescannerforcovidlist/screens/login/login.dart';
import 'package:qrcodescannerforcovidlist/screens/register/register.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.all(80.0),
            child: Image.asset("assets/logo.jpg"),
          ),
          Text(
            "Welcome",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Register()));
              },
              child: Text(
                "SignUp",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
