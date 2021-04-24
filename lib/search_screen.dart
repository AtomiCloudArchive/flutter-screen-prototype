import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as VecMath;

import 'themed_screen.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemedScreen(
      appBarTitle: Container(
        margin: EdgeInsets.only(right: 56.0), //Default width for leading button
        child: Center(
          child: Text("Explore", style: TextStyle(color: Colors.black)),
        ),
      ),
      body: SearchBody(),
    );
  }
}

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _toggleInfoAnimation() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final double infoBoxSize = 300.0; //InfoBox Height
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double slide = infoBoxSize * _animationController.value;
        VecMath.Vector3 down = VecMath.Vector3(0.0, 1.0, 0.0);

        return Transform(
          transform: Matrix4.identity()..translate(down * slide),
          child: Transform.translate(
            offset: Offset(0.0, -infoBoxSize),
            child: Column(
              children: [
                Container(
                  height: infoBoxSize,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                infoBox("Server Type A"),
                infoBox("Server Type A"),
                infoBox("Server Type A"),
                infoBox("Server Type A"),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget infoBox(String text) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.account_circle_outlined),
                enableFeedback: false,
                onPressed: () => {},
                splashRadius: 0.1,
              ),
              Text(text),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => {},
              ),
            ],
          ),
        ),
        onPressed: () => _toggleInfoAnimation(),
      ),
    );
  }
}
