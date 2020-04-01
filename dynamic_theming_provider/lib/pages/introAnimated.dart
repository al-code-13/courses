import 'package:flutter/material.dart';

class IntroAnimated extends StatefulWidget {
  @override
  _IntroAnimatedState createState() => _IntroAnimatedState();
}

AnimationController animationController;
Animation<double> animation;
AnimationController _opacityController;

class _IntroAnimatedState extends State<IntroAnimated>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..addListener(() => setState(() {}));
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    _opacityController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    )
      ..addListener(() => setState(() {}))..forward();
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ScaleTransition(
            scale: animation,
            alignment: Alignment.center,
            child: Opacity(
            opacity: new Tween(
              begin: 0.0,   
              end: 1.0,     
            ).evaluate(_opacityController), 
              child: Container(
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQsv3ym9ZS805mKxacu9ZOI9a9tUxvonK25Yq7qSGFRV4rYm8BP&usqp=CAU"),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
