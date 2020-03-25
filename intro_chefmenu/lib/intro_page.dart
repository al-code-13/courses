import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialPage extends StatefulWidget {
  InitialPage({Key key}) : super(key: key);
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  List img = ['0.png', '1.png', '2.png', '3.png'];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Share._getBool(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        Share._setNull().then((value) => print(value));
        return snapshot.data == true ? home():intro();
      },
    );
  }

  home() {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
    );
  }

  Widget intro() {
    return Scaffold(
      body: Stack(
        children: <Widget>[
           Swiper(
              outer: false,
              itemBuilder: (c, i) {
                return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/$i.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                );
              },
              pagination: new SwiperPagination(
                margin: new EdgeInsets.all(20.0),
                builder: new DotSwiperPaginationBuilder(
                    color: Colors.grey, activeColor: Colors.green),
              ),
              itemCount: img.length,
              onIndexChanged: (p) {},
              loop: false,
            ),
           
          Positioned(
            bottom: 22,
            right: 22,
            child: GestureDetector(
              onTap: () async {
                await Share._setBool(true);
                home();
                setState(() {
                  
                });
              },
              child: Text(
                "Omitir",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Share {
  static Future<bool> _getBool() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('yesno') ?? false;
  }

  static Future<bool> _setBool(bool data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('yesno', data);
  }

  static Future<bool> _setNull() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }
}
