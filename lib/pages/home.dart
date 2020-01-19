import 'package:flutter/material.dart';
import 'package:thoughts_frontend/pages/compose.dart';
import 'package:thoughts_frontend/pages/explore.dart';
import 'package:thoughts_frontend/pages/profile.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage>{

  int _currentIndex = 1;
  final List<Widget> _children = [
    ExplorePage(),
    ComposePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9d00f5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Text('thoughts',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 65.0,
                fontWeight: FontWeight.w900, 
                fontFamily: 'Quicksand',
                color: const Color(0xff7300d1)
              ),
            ),
          ),
        )
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(32.0), topLeft: Radius.circular(32.0)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(32.0), topLeft: Radius.circular(32.0)),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 32.0,
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            selectedItemColor: const Color(0xff7300d1),
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Icon(Icons.blur_circular),
                ),
                title: Text('explore')
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Icon(Icons.border_color),
                ),
                title: Text('compose')
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Icon(Icons.person),
                ),
                title: Text('profile')
              )
            ],
          ),
        ),
      ),
    );
  }

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}