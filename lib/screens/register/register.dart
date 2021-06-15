import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qrcodescannerforcovidlist/models/user.dart';
import 'package:qrcodescannerforcovidlist/screens/home/homewrapper.dart';
import 'package:qrcodescannerforcovidlist/services/authService.dart';
import 'package:qrcodescannerforcovidlist/widgets/container.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final db = FirebaseFirestore.instance;

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _shopNameController = TextEditingController();
  String dropdownValue = 'Customer';
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
              height: 50.0,
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
                  DecoratedBox(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DropdownButton<String>(
                        underline: SizedBox(),
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 20,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Customer', 'Merchant']
                            .map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
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
                    // onEditingComplete: () {
                    //   if (_passwordController.text.length < 8) {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(
                    //         content: Text("Password must be 8 letters"),
                    //         duration: Duration(seconds: 2),
                    //       ),
                    //     );
                    //   }
                    // },
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
                      hintText: "Confirm Password",
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  dropdownValue == 'Merchant'
                      ? TextFormField(
                          controller: _shopNameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.shopping_bag_outlined,
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                            hintText: "Shop Name",
                          ),
                        )
                      : SizedBox(height: 5.0),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_passwordController.text ==
                          _confirmPasswordController.text) {
                        await db.collection("user").add(UserModel(
                              fullName: _fullNameController.text.trim(),
                              email: _emailController.text.trim(),
                              userRole: dropdownValue,
                              shopName: _shopNameController.text.trim(),
                            ).toJson());
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
