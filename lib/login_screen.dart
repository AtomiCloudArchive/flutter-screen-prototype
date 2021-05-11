import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'diamond_styles.dart';
import 'themed_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemedScreen(
      floatingActionButton: IconButton(
        icon: Icon(Icons.ac_unit, color: ThemeColors.primary),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyApp())),
      ),
    );
  }
}
