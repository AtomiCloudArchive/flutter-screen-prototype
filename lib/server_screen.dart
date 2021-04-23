import 'package:flutter/material.dart';

import 'themed_screen.dart';

class ServerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemedScreen(
      appBarTitle: Container(
        margin: EdgeInsets.only(right: 56.0),
        child: Center(
          child: Text("Servers", style: TextStyle(color: Colors.black)),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            serverBox(context),
            serverBox(context),
            serverBox(context),
          ],
        ),
      ),
    );
  }

  Widget serverBox(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.desktop_windows),
              onPressed: () => {},
            ),
            Text("Server"),
            Icon(Icons.bolt),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.yellow,
      ),
    );
  }
}
