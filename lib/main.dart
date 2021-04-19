import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card.dart';
import 'notif_screen.dart';
import 'search_screen.dart';
import 'server_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

final Color bkgdColor = Colors.orange[50];
final Color textColor = Colors.black;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _toggleAnimation() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final leftSlide = -304.0; //Drawer width
    final drawerOffset = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double slide = leftSlide * _animationController.value;

        return Stack(
          children: [
            Transform(
              transform: Matrix4.identity()..translate(slide),
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(drawerOffset, 0),
                child: customEndDrawer(context),
              ),
            ),
            Transform(
              transform: Matrix4.identity()..translate(slide),
              alignment: Alignment.center,
              child: Scaffold(
                backgroundColor: bkgdColor,
                appBar: customAppBar(context),
                body: customBody(context),
                floatingActionButton: serverButton(context),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: bkgdColor,
      elevation: 0.0,
      leading: routeIconButton(Icons.search,
          MaterialPageRoute(builder: (context) => SearchScreen())),
      title: Builder(
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.only(left: 24.0),
            child: Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: textColor,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlankScreen(),
                  ));
                },
                child: Text('Options'),
              ),
            ),
          );
        },
      ),
      actions: [
        routeIconButton(
          Icons.notifications,
          MaterialPageRoute(builder: (context) => NotifScreen()),
        ),
        IconButton(
          icon: Icon(Icons.account_circle, color: textColor),
          onPressed: () {
            _toggleAnimation();
          },
        ),
      ],
    );
  }

  Widget customBody(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            CustomCard(child: Text("Hot reload supported")),
            CustomCard(child: Text("Somethings missing...")),
          ],
        ));
  }

  Widget customDrawer(BuildContext context) {
    return Drawer();
  }

  Widget customEndDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.orange[50],
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

  Widget serverButton(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return FloatingActionButton(
          backgroundColor: Colors.green,
          elevation: 0.0,
          child: Icon(Icons.bolt, color: Colors.yellow),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ServerScreen(),
            ));
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    );
  }

  Widget routeIconButton(IconData icon, MaterialPageRoute route) {
    return Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(icon, color: textColor),
          onPressed: () {
            Navigator.of(context).push(route);
          },
        );
      },
    );
  }
}

class BlankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
