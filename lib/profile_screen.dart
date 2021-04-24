import 'package:flutter/material.dart';

import 'diamond_styles.dart';
import 'themed_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemedScreen(
      appBarTitle: Container(
        margin: EdgeInsets.only(right: 56.0),
        child: Center(
          child: Text("Servers", style: TextStyle(color: ThemeColors.black)),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            customProfileCard(Text("Test Account 1")),
            customProfileCard(Text("Test Account 2")),
            customProfileCard(Text("Test Account 3")),
            customProfileCard(Text("Test Account 4")),
            customProfileCard(Text("Test Account 5")),
          ],
        ),
      ),
    );
  }

  Widget customProfileCard(Widget text) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.account_box_rounded),
          Center(child: text),
          Icon(Icons.circle),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
    );
  }
}
