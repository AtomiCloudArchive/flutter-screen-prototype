import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card.dart';
import 'notif_screen.dart';
import 'search_screen.dart';
import 'profile_screen.dart';
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
                appBarLeading: AbsorbPointer(
                  // disables button when drawer is active
                  absorbing: _animationController.isCompleted,
                  child: routeIconButton(
                    Icons.search,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ),
                  ),
                ),
                appBarTitle: Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.only(left: 24.0),
                      child: Center(
                        child: AbsorbPointer(
                          // disables button when drawer is active
                          absorbing: _animationController.isCompleted,
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
                              'Teams',
                              style: TextStyle(
                                  fontFamily: DiamondTypography.regularFont),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                appBarActions: [
                  AbsorbPointer(
                    // disables button when drawer is active
                    absorbing: _animationController.isCompleted,
                    child: routeIconButton(
                      Icons.notifications,
                      MaterialPageRoute(builder: (context) => NotifScreen()),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.bolt),
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
                child: Text('Organisations'),
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
        child: Center(
          child: Column(
            children: [
              serverBox(context),
              serverBox(context),
              serverBox(context),
            ],
          ),
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
        color: ThemeColors.primary,
      ),
    );
  }

  Widget serverButton() {
    return Builder(
      builder: (BuildContext context) {
        return FloatingActionButton(
          backgroundColor: ThemeColors.primary,
          elevation: 0.0,
          child: Icon(Icons.account_circle, color: ThemeColors.greyLight),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfileScreen(),
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
