import 'package:dynamic_theming_provider/utils/fade_in.dart';
import 'package:dynamic_theming_provider/utils/shimmer.dart';
import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animation;
  bool time = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        time = false;
        _animation.dispose();
      });
    });
    super.initState();
    _animation = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(time);
    return time ? afterCharge() : _xd();
  }

  Widget _xd() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSUXKFT1Qh67Lz8BWDFfu4tSykFSGqoF61UAmKvHQ05GzpDM13Y&usqp=CAU"),
                  ),
                  title: Text("GATOOOO 1"),
                  trailing: CircleAvatar(radius: 20,child: Icon(Icons.subdirectory_arrow_left)),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSUXKFT1Qh67Lz8BWDFfu4tSykFSGqoF61UAmKvHQ05GzpDM13Y&usqp=CAU"),
                  ),
                  title: Text("GATOOOO 2"),
                  trailing: CircleAvatar(radius: 20,child: Icon(Icons.subdirectory_arrow_left)),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSUXKFT1Qh67Lz8BWDFfu4tSykFSGqoF61UAmKvHQ05GzpDM13Y&usqp=CAU"),
                  ),
                  title: Text("GATOOOO 3"),
                  trailing: CircleAvatar(radius: 20,child: Icon(Icons.subdirectory_arrow_left)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget afterCharge() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              FadeIn(
                2,
                SizedBox(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSUXKFT1Qh67Lz8BWDFfu4tSykFSGqoF61UAmKvHQ05GzpDM13Y&usqp=CAU"),
                      ),
                      title: Container(height: 30,width: 20,color: Colors.red,),
                      trailing: CircleAvatar(radius: 20,child: Icon(Icons.subdirectory_arrow_left)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              FadeIn(
                2,
                SizedBox(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSUXKFT1Qh67Lz8BWDFfu4tSykFSGqoF61UAmKvHQ05GzpDM13Y&usqp=CAU"),
                      ),
                      title: Container(height: 30,width: 20,color: Colors.red,),
                      trailing: CircleAvatar(radius: 20,child: Icon(Icons.subdirectory_arrow_left)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),FadeIn(
                2,
                SizedBox(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSUXKFT1Qh67Lz8BWDFfu4tSykFSGqoF61UAmKvHQ05GzpDM13Y&usqp=CAU"),
                      ),
                      title: Container(height: 30,width: 20,color: Colors.red,),
                      trailing: CircleAvatar(radius: 20,child: Icon(Icons.subdirectory_arrow_left)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
