import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qrcodescannerforcovidlist/screens/landing/landing.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            TextButton(
              child: Text("Sign Out"),
              onPressed: () {
                _signOut().whenComplete(
                  () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => LandingPage()),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                _editProfile(context);
              },
              child: Text("Edit Profile"),
            ),
          ],
        ),
      ),
    );
  }

  Future _signOut() async {
    await _auth.signOut();
  }

  void _editProfile(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        // backgroundColor: Theme.of(context).accentColor,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Update Profile"),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.cancel),
                        iconSize: 25,
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: TextField(
                            decoration: InputDecoration(helperText: "Name"),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                        child: Text("save"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
