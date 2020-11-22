import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar example project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      initialRoute: '/',
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: true,
            bottomNavigationBar: BottomNavStyle4(
                popScreensOnTapOfSelectedTab: false,
                selectedIndex: 0,
                previousIndex: 0,
                onItemSelected: (index) {
                  print(index);
                },
                backgroundColor: Colors.red,
                popAllScreensForTheSelectedTab: (int) {},
                itemAnimationProperties: ItemAnimationProperties(
                    curve: Curves.easeIn,
                    duration: Duration(milliseconds: 200)),
                navBarHeight: 75,
                padding: NavBarPadding.all(0),
                iconSize: 24,
                items: [
                  PersistentBottomNavBarItem(
                    icon: Icon(Icons.home),
                    activeColor: Theme.of(context).primaryColor,
                    inactiveColor: Theme.of(context).secondaryHeaderColor,
                  ),
                  PersistentBottomNavBarItem(
                    icon: Icon(Icons.search),
                    activeColor: Theme.of(context).primaryColor,
                    inactiveColor: Theme.of(context).secondaryHeaderColor,
                  ),
                ]),
            body: Container()));
  }
}
