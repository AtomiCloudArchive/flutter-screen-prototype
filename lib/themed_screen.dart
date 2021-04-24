import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'diamond_styles.dart';

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
    return Scaffold(
      backgroundColor: ThemeColors.primaryLight,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ThemeColors.primaryLight,
        iconTheme: IconThemeData(
          color: ThemeColors.black,
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
