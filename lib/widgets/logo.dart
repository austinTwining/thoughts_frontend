import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 75),
      child: Column(
        children: [
          Image.asset('assets/thoughts_logo.png'),
          Text(
            "Thoughts",
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontFamily: "Lato",
                fontSize: 24.0,
                fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
