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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: customBody(context),
      drawer: customDrawer(context),
      endDrawer: customEndDrawer(context),
      floatingActionButton: serverButton(context),
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
      actions: [
        Center(
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {},
            child: Text('Options'),
          ),
          widthFactor: 2.5,
        ),
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () => {},
        ),
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
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
    return Drawer();
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
