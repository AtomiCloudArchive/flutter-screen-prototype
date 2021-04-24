import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as VecMath;

import 'diamond_styles.dart';
import 'themed_screen.dart';

class NotifScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemedScreen(
      appBarTitle: Container(
        margin: EdgeInsets.only(right: 56.0), //Default width for leading button
        child: Center(
          child: Text(
            "Notifications",
            style: TextStyle(
              fontFamily: DiamondTypography.regularFont,
              color: ThemeColors.black,
            ),
          ),
        ),
      ),
      body: NotifTray(),
    );
  }
}

class NotifTray extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NotifCard(),
      //NotifCard(),
      //NotifCard(),
    );
  }
}

class NotifCard extends StatefulWidget {
  @override
  _NotifCardState createState() => _NotifCardState();
}

class _NotifCardState extends State<NotifCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _collapseCard() {
    _animationController.fling();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double moveRight =
            MediaQuery.of(context).size.width * _animationController.value;
        return Transform(
          transform: Matrix4.identity()..translate(moveRight),
          alignment: Alignment.center,
          child: TextButton(
            child: Text("Press Me"),
            onPressed: () {
              _collapseCard();
            },
          ),
        );
      },
    );
  }
}
