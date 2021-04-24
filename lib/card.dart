import 'package:flutter/material.dart';

import 'diamond_styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    this.child,
    this.height,
  });

  final Widget? child;

  final double? height;

  @override
  Widget build(BuildContext buildContext) {
    return Container(
      height: height,
      margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
      child: Center(
        child: child,
      ),
      decoration: BoxDecoration(
        color: ThemeColors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 5),
            blurRadius: 10.0,
            color: ThemeColors.greyLight,
          ),
        ],
      ),
    );
  }
}
