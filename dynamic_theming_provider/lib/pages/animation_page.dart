import 'package:dynamic_theming_provider/utils/fade_in.dart';
import 'package:dynamic_theming_provider/utils/shimmer.dart';
import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage>
    with SingleTickerProviderStateMixin {

  bool time = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        time = false;

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(time);
    return time ? afterCharge() : beforeCharge();
  }

  Widget beforeCharge() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [0, 1, 2, 3]
                .map((_) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 48.0,
                            height: 48.0,
                            child: Icon(Icons.opacity),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 15,
                                  child: Text("Titulo"),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 15,
                                  child: Text("Subtitle"),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget afterCharge() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30),
          child: FadeIn(
            2,
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white,
              child: Column(
                children: [0, 1, 2, 3]
                    .map(
                      (_) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 48.0,
                              height: 48.0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 15,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 15,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
