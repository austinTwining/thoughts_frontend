import 'package:flutter/material.dart';
import 'package:thoughts_frontend/pages/landing.dart';

void main() {
  return runApp(ThoughtsApp());
}

class ThoughtsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'thoughts',
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}