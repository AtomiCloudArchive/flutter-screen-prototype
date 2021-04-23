import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemedScreen extends StatelessWidget {
  const ThemedScreen({
    this.appBarLeading,
    this.appBarTitle,
    this.appBarActions,
    this.body,
    this.floatingActionButton,
  });

  final Widget? appBarLeading;

  final Widget? appBarTitle;

  final List<Widget>? appBarActions;

  final Widget? body;

  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final Color bkgdColor = Colors.orange.shade50;
    final Color textColor = Colors.black;
    return Scaffold(
      backgroundColor: bkgdColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: bkgdColor,
        iconTheme: IconThemeData(
          color: textColor,
        ),
        leading: appBarLeading,
        title: appBarTitle,
        actions: appBarActions,
      ),
      body: this.body,
      floatingActionButton: this.floatingActionButton,
    );
  }
}
