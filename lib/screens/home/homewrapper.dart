import 'package:flutter/material.dart';
import 'package:qrcodescannerforcovidlist/screens/home/home.dart';
import 'package:qrcodescannerforcovidlist/screens/home/profile.dart';
import 'package:qrcodescannerforcovidlist/screens/home/recent.dart';

class HomeWrapper extends StatefulWidget {
  //final User? user;

  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Recent(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.orange),
        title: Text("QR for Covid"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home_sharp),
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.history_sharp),
            icon: Icon(Icons.history_rounded),
            label: "Recent",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person_sharp),
            icon: Icon(Icons.person_outlined),
            label: "Profile",
          )
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
