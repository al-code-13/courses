import 'dart:math';

import 'package:dynamic_theming_provider/pages/prueba.dart';
import 'package:dynamic_theming_provider/utils/controller_animated.dart';
import 'package:dynamic_theming_provider/utils/fade_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'animated_screen.dart';

class HomeAnimatedPage extends StatefulWidget {
  @override
  _HomeAnimatedPageState createState() => _HomeAnimatedPageState();
}

const TEXT_STYLE =
    TextStyle(letterSpacing: 5, fontSize: 20, fontWeight: FontWeight.w800);


class _HomeAnimatedPageState extends State<HomeAnimatedPage>
    with TickerProviderStateMixin {
      void _toggle() {
    setState(() {
      enableCoolStuff = !enableCoolStuff;
      
    });
  }
  static final boxDecoration = BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withAlpha(60),
            blurRadius: 5,
            offset: Offset(0, 8),
            spreadRadius: 2)
      ]);
  Animation _arrowAnimation, _heartAnimation;
  AnimationController _arrowAnimationController, _heartAnimationController;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);

    _heartAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));

    _heartAnimation = Tween(begin: 150.0, end: 170.0).animate(CurvedAnimation(
        curve: Curves.bounceOut, parent: _heartAnimationController));

    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _arrowAnimationController?.dispose();
    _heartAnimationController?.dispose();
  }

  bool enableCoolStuff = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Example Animations'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          boton(),
          iconRotate(),
          SizedBox(
            height: 50.0,
          ),
          secondChild(),
          SizedBox(
            height: 50.0,
          ),
          OutlineButton(
            color: Colors.white,
            textColor: Colors.black,
            padding: const EdgeInsets.all(12.0),
            child: Text('Container Animation'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AnimatedScreen()));
            },
            splashColor: Colors.red,
          ),
          OutlineButton(
            color: Colors.white,
            textColor: Colors.black,
            padding: const EdgeInsets.all(12.0),
            child: Text('SHAPE'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FadeInUi()));
            },
            splashColor: Colors.red,
          ),
          SizedBox(
            height: 50.0,
          ),
          checkAnimated(),
        ],
      ),
    );
  }

  GestureDetector checkAnimated() {
    return GestureDetector(
          onTap: _toggle,
          behavior: HitTestBehavior.translucent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SwitchlikeCheckbox(checked: enableCoolStuff),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Check Animation",
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
        );
  }

  ControlledAnimation<double> boton() {
    return ControlledAnimation(
      duration: Duration(milliseconds: 400),
      tween: Tween(begin: 0.0, end: 80.0),
      builder: (context, height) {
        return ControlledAnimation(
          duration: Duration(milliseconds: 1200),
          delay: Duration(milliseconds: 500),
          tween: Tween(begin: 2.0, end: 300.0),
          builder: (context, width) {
            return Container(
              decoration: boxDecoration,
              width: width,
              height: height,
              child: totalWithd(width)
                  ? TypewriterText("Hello")
                  : Container(),
            );
          },
        );
      },
    );
  }

  Widget iconRotate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AnimatedBuilder(
          animation: _arrowAnimationController,
          builder: (context, child) => Transform.rotate(
            angle: _arrowAnimation.value,
            child: GestureDetector(
              onTap: () {
                _arrowAnimationController.isCompleted
                    ? _arrowAnimationController.reverse()
                    : _arrowAnimationController.forward();
              },
              child: Icon(
                Icons.expand_more,
                size: 50.0,
                color: Colors.black,
              ),
            ),
          ),
          //  child:
        ),
      ],
    );
  }

  Widget secondChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: AnimatedBuilder(
            animation: _heartAnimationController,
            builder: (context, child) {
              return Center(
                child: Container(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        _heartAnimationController.forward();
                      },
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: _heartAnimation.value,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  totalWithd(width) => width > 20;
}

class TypewriterText extends StatelessWidget {
  final String text;
  TypewriterText(this.text);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
        duration: Duration(milliseconds: 800),
        delay: Duration(milliseconds: 800),
        tween: IntTween(begin: 0, end: text.length),
        builder: (context, textLength) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text.substring(0, textLength), style: TEXT_STYLE),
              ControlledAnimation(
                playback: Playback.LOOP,
                duration: Duration(milliseconds: 600),
                tween: IntTween(begin: 0, end: 1),
                builder: (context, oneOrZero) {
                  return Opacity(
                      opacity: oneOrZero == 1 ? 1.0 : 0.0,
                      child: Text(">", style: TEXT_STYLE));
                },
              )
            ],
          );
        });
  }
}

class SwitchlikeCheckbox extends StatelessWidget {
  final bool checked;

  SwitchlikeCheckbox({this.checked});

  @override
  Widget build(BuildContext context) {
    var tween = MultiTrackTween([
      Track("paddingLeft")
          .add(Duration(milliseconds: 1000), Tween(begin: 0.0, end: 20.0)),
      Track("color").add(Duration(milliseconds: 1000),
          ColorTween(begin: Colors.grey, end: Colors.blue)),
      Track("text")
          .add(Duration(milliseconds: 500), ConstantTween("off"))
          .add(Duration(milliseconds: 500), ConstantTween("ON")),
      Track("rotation")
          .add(Duration(milliseconds: 1000), Tween(begin: -2 * pi, end: 0.0))
    ]);

    return ControlledAnimation(
      playback: checked ? Playback.PLAY_FORWARD : Playback.PLAY_REVERSE,
      startPosition: checked ? 1.0 : 0.0,
      duration: tween.duration * 1.2,
      tween: tween,
      curve: Curves.easeInOut,
      builder: _buildCheckbox,
    );
  }

  Widget _buildCheckbox(context, animation) {
    return Container(
      decoration: _outerBoxDecoration(animation["color"]),
      width: 50,
      height: 30,
      padding: const EdgeInsets.all(3.0),
      child: Stack(
        children: [
          Positioned(
              child: Padding(
            padding: EdgeInsets.only(left: animation["paddingLeft"]),
            child: Transform.rotate(
              angle: animation["rotation"],
              child: Container(
                decoration: _innerBoxDecoration(animation["color"]),
                width: 20,
                child:
                    Center(child: Text(animation["text"], style: labelStyle)),
              ),
            ),
          ))
        ],
      ),
    );
  }

  BoxDecoration _innerBoxDecoration(color) => BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(25)), color: color);

  BoxDecoration _outerBoxDecoration(color) => BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(
          width: 2,
          color: color,
        ),
      );

  static final labelStyle = TextStyle(
      height: 1.2,
      fontWeight: FontWeight.bold,
      fontSize: 9,
      color: Colors.white);
}
