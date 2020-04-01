import 'package:dynamic_theming_provider/utils/fade_in.dart';
import 'package:flutter/material.dart';

int count = 1;

class MaquetaPage extends StatelessWidget {
  const MaquetaPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      "Establecimiento",
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      "Minutos",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                    SizedBox(height: 18),
                    FadeIn(2,ListTile(
                      leading: Icon(Icons.open_in_new),
                      title: Text("Sin confirmacion de entrega"),
                      trailing: Text("24:59"),
                    ), ),
                    
                    FadeIn(2,ListTile(
                      leading: Icon(Icons.open_in_new),
                      title: Text("Sin confirmacion de entrega"),
                      trailing: Text("24:59"),
                    ), ),
                    FadeIn(2,ListTile(
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
                    ),)
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
