import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card.dart';
import 'search_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

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
    final leftSlide = MediaQuery.of(context).size.width * -0.8;
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
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchScreen(),
              ));
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      title: Container(
        margin: EdgeInsets.only(left: 24.0),
        child: Center(
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {},
            child: Text('Options'),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () => {},
        ),
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () => _toggleAnimation(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
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
    return Drawer(child: Text("ASD"));
  }

  Widget serverButton(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return FloatingActionButton(
          child: Icon(Icons.bolt),
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
}

class ServerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Servers"))),
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
