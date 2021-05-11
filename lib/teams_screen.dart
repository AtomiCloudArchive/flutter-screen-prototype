import 'package:flutter/material.dart';

import 'diamond_styles.dart';
import 'themed_screen.dart';

class TeamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemedScreen(
      appBarTitle: Container(
        margin: EdgeInsets.only(right: 56.0),
        child: Center(
          child: Text("Teams", style: TextStyle(color: ThemeColors.black)),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            customTeamCard(Text("Team A")),
            customTeamCard(Text("Team B")),
            customTeamCard(Text("Team C")),
            customTeamCard(Text("Team D")),
          ],
        ),
      ),
    );
  }

  Widget customTeamCard(Widget text) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.group),
          Center(child: text),
          Icon(Icons.circle, color: ThemeColors.success),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
    );
  }
}
