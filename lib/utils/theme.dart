import 'package:flutter/material.dart';

class MyTheme {
  Color _darkgreen = Color(0xFF206a5d);
  Color _green = Color(0xFF91c788);
  Color _lightgreen = Color(0xFFddffbc);

  ThemeData buildTheme() {
    return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: _green,
        accentColor: _lightgreen,
        hintColor: _darkgreen,
        secondaryHeaderColor: _green,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: _lightgreen,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: _darkgreen,
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: _darkgreen,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_darkgreen),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(_darkgreen)),
        ));
  }
}
