import 'package:flutter/material.dart';
import 'package:thoughts_frontend/pages/registration.dart';
import 'package:thoughts_frontend/widgets/logo.dart';

import 'login.dart';

class LandingPage extends StatefulWidget {
  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //Background Gradient
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.5, 1.0],
            colors: <Color>[Color(0xffbf80ff), Color(0xff8b06ba)],
            tileMode: TileMode.clamp,
          ),
        ),

        //content
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Logo(),
              //center spacer
              Spacer(),

              //sign up button
              _buildSignupButton(),
              SizedBox(height: 16), //spacer
              //login button
              _buildLoginButton(),
              SizedBox(height: 75)
            ],
          ),
        ));
  }

  Widget _buildSignupButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(
              child: TextButton(
            style: TextButton.styleFrom(
                primary: Color(0xff8B06BA),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0))),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "sign up",
                style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegistrationPage()));
            },
          ))
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(
              child: TextButton(
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Color(0x33ffffff),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0))),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "log in",
                style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ))
        ],
      ),
    );
  }
}
