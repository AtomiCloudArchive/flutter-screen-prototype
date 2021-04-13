import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin:
              EdgeInsets.only(right: 56.0), //Default width for leading button
          child: Center(
            child: Text("Explore"),
          ),
        ),
      ),
      body: SearchBody(),
    );
  }
}

class SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
