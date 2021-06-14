import 'package:flutter/material.dart';
import 'package:qrcodescannerforcovidlist/screens/home/home.dart';
import 'package:qrcodescannerforcovidlist/services/authentication.dart';
import 'package:qrcodescannerforcovidlist/widgets/container.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  // String dropdownValue = 'Customer';
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
              height: 80.0,
            ),
            MyContainer(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // DropdownButton<String>(
                  //   value: dropdownValue,
                  //   icon: Icon(Icons.arrow_downward_outlined),
                  //   iconSize: 20,
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       dropdownValue = newValue!;
                  //     });
                  //   },
                  //   items: <String>['Customer', 'Merchant'].map((String value) {
                  //     return DropdownMenuItem(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  // ),
                  TextFormField(
                    controller: _fullNameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        hintText: "User Name"),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        hintText: "Password"),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        hintText: "Confirm Password"),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_passwordController.text ==
                          _confirmPasswordController.text) {
                        _signupUser(_emailController.text.trim(),
                            _passwordController.text.trim(), context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Passwords do not match"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80.0),
                      child: Text(
                        "Sign me up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signupUser(String email, String password, BuildContext context) async {
    try {
      String? _returnString =
          await AuthService().signUp(email: email, password: password);
      if (_returnString == "success") {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
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
