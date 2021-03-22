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
                shadow: BoxShadow(),
                trailingWidget: AddSetButton(),
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

class AddSetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: SizedBox(
        height: 45,
        width: 45,
        child: FloatingActionButton(
          child: Container(
            height: 45,
            width: 45,
            //padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(0, 255, 0, 1),
            ),
            child: Icon(
              Icons.add,
              //const IconDataSolid(61543),
              size: 16,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            //HapticFeedback.selectionClick();
            // showModalBottomSheet<void>(
            //   isScrollControlled: true,
            //   context: context,
            //   builder: (BuildContext context) {
            //     return AddSetModal();
            //   },
            // );
          },
        ),
      ),
    );
  }
}
