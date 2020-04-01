import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData themeData;
  ThemeChanger({this.themeData});

  getTheme() => themeData;
  setTheme(bool value) {
    value?themeData = darks():themeData=lights();

    notifyListeners();
  }
}

ThemeData darks() {
    return ThemeData(
      backgroundColor: Color.fromRGBO(145, 145, 145, 0.1),
      primaryColor: Color.fromRGBO(231, 63, 100, 1),
      appBarTheme: AppBarTheme(color: Colors.black),
      textTheme: TextTheme(
        title: TextStyle(fontFamily: 'ondo-demo-medium', fontSize: 50,color: Color.fromRGBO(247, 92, 122, 1)),
        body1: TextStyle(fontFamily: 'montserrat-thin' , fontSize: 50,color: Color.fromRGBO(144, 162, 205, 1)),
        body2: TextStyle(fontFamily: 'montserrat-bold' , fontSize: 50,color: Colors.white),
        caption: TextStyle(fontFamily: 'montserrat-thin' ,fontSize: 50,color: Colors.white),
        
      )
    );
  }
ThemeData lights() {
    return ThemeData(
      backgroundColor: Colors.white,
      primaryColor: Colors.blue,
      appBarTheme: AppBarTheme(color: Colors.blue),
      textTheme: TextTheme(
        title: TextStyle(fontSize: 50,color: Colors.black),
        body1: TextStyle(fontSize: 50,color: Colors.black),
        body2: TextStyle(fontSize: 50,color: Colors.white),
        caption: TextStyle(fontSize: 50,color: Colors.black),
        
      )
    );
  }  