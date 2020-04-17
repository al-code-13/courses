import 'package:flutter/material.dart';

import 'src/pages/homepage.dart';
import 'src/pages/loginpage.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/home' : (BuildContext context ) => HomePage(),
        '/login' : (BuildContext context ) => LoginPage(),

      },
    );
  }
}