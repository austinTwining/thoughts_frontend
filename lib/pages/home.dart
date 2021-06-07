import 'package:flutter/material.dart';
import 'package:thoughts_frontend/pages/profile.dart';

import 'compose.dart';
import 'explore.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [ExplorePage(), ComposePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color(0x40D6A8EC),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, -4))
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                iconSize: 32.0,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                currentIndex: _currentIndex,
                selectedItemColor: const Color(0xff7300d1),
                items: [
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Icon(Icons.blur_circular),
                      ),
                      label: "explore"),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Icon(Icons.border_color),
                      ),
                      label: "compose"),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Icon(Icons.person),
                      ),
                      label: "profile")
                ],
              ),
            )));
  }
}
