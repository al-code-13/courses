import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
import 'pages/animation_page.dart';
import 'pages/home.dart';
import 'pages/homeAnimation_page.dart';
import 'pages/img_shimmer.page.dart';
import 'pages/introAnimated.dart';
import 'pages/maquetacion.dart';
import 'pages/prueba.dart';
import 'provider/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: '/imgPage',
      routes: {
        '/home'              :(context) => HomePage(),
        '/animationPage' :(context) => AnimatedPage(),
        '/animationHomePage' :(context) => HomeAnimatedPage(),
        '/fadeInUI' :(context) => FadeInUi(),
        '/maquetaPage' :(context) => MaquetaPage(),
        '/introAnimated' :(context) => IntroAnimated(),
        '/imgPage' :(context) => ImgPage(),

      },
      theme: theme.getTheme(),
    );
  }
}
