import 'package:flutter/material.dart';
import 'package:qrcodescannerforcovidlist/screens/home/homewrapper.dart';
import 'package:qrcodescannerforcovidlist/screens/register/register.dart';
import 'package:qrcodescannerforcovidlist/services/authService.dart';
import 'package:qrcodescannerforcovidlist/widgets/container.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Row(
          //     children: [BackButton()],
          //   ),
          // ),
          SizedBox(
            height: 120.0,
          ),
          MyContainer(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    hintText: "Email",
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline,
                          color: Theme.of(context).secondaryHeaderColor),
                      hintText: "Password"),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    _signIn(_emailController.text.trim(),
                        _passwordController.text.trim(), context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80.0),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  child: Text(
                    "Don't have an account? SignUp here",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  void _signIn(String email, String password, BuildContext context) async {
    try {
      String? _returnString =
          await AuthService().signIn(email: email, password: password);
      if (_returnString == "success") {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeWrapper()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_returnString!),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
