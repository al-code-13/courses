import 'package:dynamic_theming_provider/utils/fade_in.dart';
import 'package:dynamic_theming_provider/utils/shimmer.dart';
import 'package:flutter/material.dart';

class MaquetaPage extends StatefulWidget {
  @override
  _MaquetaPageState createState() => _MaquetaPageState();
}

class _MaquetaPageState extends State<MaquetaPage>
    with TickerProviderStateMixin {
  bool time = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        time = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(time);
    return time ? afterShimmer() : beforeShimmer();
  }

  Widget afterShimmer() {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Text(
                      "Establecimiento",
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      "Minutos",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                    SizedBox(height: 18),
                    ListTile(
                      leading: Icon(Icons.open_in_new),
                      title: Text("Sin confirmacion de entrega"),
                      trailing: Text("24:59"),
                    ),
                    ListTile(
                      leading: Icon(Icons.open_in_new),
                      title: Text("Sin confirmacion de entrega"),
                      trailing: Text("24:59"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.open_in_new,
                      ),
                      title: Text(
                        "Sin confirmacion de entrega",
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      ),
                      trailing: Text(
                        "24:59",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    //           CachedNetworkImage(
                    //   placeholder: CircularProgressIndicator(),
                    //   imageUrl:
                    //       'https://picsum.photos/250?image=9',
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget beforeShimmer() {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(height: 30),
                    FadeIn(
                      2,
                      Container(
                        height: 25,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    FadeIn(
                      2,
                      Container(
                        height: 15,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 18),
                    FadeIn(
                      2,
                      ListTile(
                        leading: CircleAvatar(
                          radius: 15,
                        ),
                        title: Container(
                          height: 25,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                        trailing: Container(
                          height: 25,
                          width: 45,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    FadeIn(
                      2,
                      ListTile(
                        leading: CircleAvatar(
                          radius: 15,
                        ),
                        title: Container(
                          height: 25,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                        trailing: Container(
                          height: 25,
                          width: 45,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    FadeIn(
                      2,
                      ListTile(
                        leading: CircleAvatar(
                          radius: 15,
                        ),
                        title: Container(
                          height: 25,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                        trailing: Container(
                          height: 25,
                          width: 45,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
