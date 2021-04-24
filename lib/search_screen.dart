import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as VecMath;

import 'card.dart';
import 'diamond_styles.dart';
import 'themed_screen.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemedScreen(
      appBarTitle: Container(
        margin: EdgeInsets.only(right: 56.0), //Default width for leading button
        child: Center(
          child: Text("Explore", style: TextStyle(color: ThemeColors.black)),
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
  final double compareBoxSize = 300.0;
  String a = "TBD";
  String b = "TBD";
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

  updateComparison(String next) {
    setState(() {
      if (_animationController.isDismissed) _animationController.forward();
      a = b;
      b = next;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double slide = compareBoxSize * _animationController.value;
        VecMath.Vector3 down = VecMath.Vector3(0.0, 1.0, 0.0);

        return Transform(
          transform: Matrix4.identity()..translate(down * slide),
          child: Transform.translate(
            offset: Offset(0.0, -compareBoxSize),
            child: Column(
              children: [
                compareBox(a, b),
                infoBox("Server Type A"),
                infoBox("Server Type B"),
                infoBox("Server Type C"),
                infoBox("Server Type D"),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget compareBox(String a, String b) {
    return Container(
      height: compareBoxSize,
      child: Row(
        children: [
          Expanded(
            child: CustomCard(
              child: Text(a),
            ),
          ),
          Expanded(
            child: CustomCard(
              child: Text(b),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: ThemeColors.greyLight,
      ),
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
                onPressed: () {
                  updateComparison(text);
                },
              ),
            ],
          ),
        ),
        onPressed: () => _toggleInfoAnimation(),
      ),
    );
  }
}
