import '../provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool valueTheme = false;
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return new Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: null,
        title: Text(
          'ChefMenu',
          style: Theme.of(context).textTheme.caption,
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Text(
                'Light Theme',
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                'Light Theme',
                style: Theme.of(context).textTheme.body1,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/animationHomePage'),
                child: Text('Light Theme',
                    style: Theme.of(context).textTheme.body2),
              ),
              // Container(child: img),Detalle del articulo
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          valueTheme ? valueTheme = false : valueTheme = true;
          _themeChanger.setTheme(valueTheme);
          print(valueTheme);
        },
        child: Icon(Icons.navigation),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
