import 'package:flutter/material.dart';

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

class SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, -300.0),
      child: Column(
        children: [
          Container(
            height: 300.0,
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
        onPressed: () => {},
      ),
    );
  }
}
