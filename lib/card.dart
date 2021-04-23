import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({this.child});

  final Widget? child;

  @override
  Widget build(BuildContext buildContext) {
    return Container(
      margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
      child: Center(
        heightFactor: 10,
        child: child,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 5),
            blurRadius: 10.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
