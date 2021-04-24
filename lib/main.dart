import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card.dart';
import 'notif_screen.dart';
import 'search_screen.dart';
import 'server_screen.dart';
import 'diamond_styles.dart';
import 'themed_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemedScreen(
      floatingActionButton: IconButton(
        icon: Icon(Icons.ac_unit),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyApp())),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

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

  _toggleDrawerAnimation() {
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
                child: customEndDrawer(),
              ),
            ),
            Transform(
              transform: Matrix4.identity()..translate(slide),
              alignment: Alignment.center,
              child: ThemedScreen(
                appBarLeading: routeIconButton(Icons.search,
                    MaterialPageRoute(builder: (context) => SearchScreen())),
                appBarTitle: Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.only(left: 24.0),
                      child: Center(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: ThemeColors.black,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ThemedScreen(),
                            ));
                          },
                          child: Text(
                            'Options',
                            style: TextStyle(
                                fontFamily: DiamondTypography.regularFont),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                appBarActions: [
                  routeIconButton(
                    Icons.notifications,
                    MaterialPageRoute(builder: (context) => NotifScreen()),
                  ),
                  IconButton(
                    icon: Icon(Icons.account_circle),
                    onPressed: () {
                      _toggleDrawerAnimation();
                    },
                  ),
                ],
                body: customBody(),
                floatingActionButton: AbsorbPointer(
                  // disables button when drawer is active
                  absorbing: _animationController.isCompleted,
                  child: serverButton(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  PreferredSizeWidget customAppBar() {
    return AppBar(
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
                  primary: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ThemedScreen(),
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
          icon: Icon(Icons.account_circle),
          onPressed: () {
            _toggleDrawerAnimation();
          },
        ),
      ],
    );
  }

  Widget customBody() {
    return Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              child: CustomCard(
                child: Text("Hot reload supported"),
              ),
            ),
            Expanded(
              child: CustomCard(
                child: Text("Somethings missing..."),
              ),
            ),
          ],
        ));
  }

  Widget customEndDrawer() {
    return Drawer(
      child: Container(
        color: ThemeColors.primaryLight,
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

  Widget serverButton() {
    return Builder(
      builder: (BuildContext context) {
        return FloatingActionButton(
          backgroundColor: ThemeColors.primary,
          elevation: 0.0,
          child: Icon(Icons.bolt, color: ThemeColors.greyLight),
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
          icon: Icon(icon),
          onPressed: () {
            Navigator.of(context).push(route);
          },
        );
      },
    );
  }
}
