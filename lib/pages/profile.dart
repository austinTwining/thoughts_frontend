import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text('profile'),
    );
  }
}