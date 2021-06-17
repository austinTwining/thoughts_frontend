import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thoughts_frontend/pages/landing.dart';

import 'package:thoughts_frontend/pages/registration.dart';
import 'package:thoughts_frontend/services/http_service.dart';
import 'package:thoughts_frontend/widgets/logo.dart';

import 'home.dart';

import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //logo
            Expanded(
              flex: 5,
              child: Logo(),
            ),

            //login form card
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25))),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      errorMessage,
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: "Lato",
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    //email field
                    _buildEmailField(),
                    SizedBox(height: 30),
                    //password field
                    _buildPasswordField(),
                    //sign up button
                    _buildLoginButton(),

                    //login question
                    _buildSignupQuestion(),
                    SizedBox(height: 30)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildEmailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Material(
          child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffFAF4FE),
                  border: InputBorder.none,
                  labelText: "email",
                  labelStyle: TextStyle(color: Color(0xffD6A8EC)))),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Material(
          child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffFAF4FE),
                  border: InputBorder.none,
                  labelText: "password",
                  labelStyle: TextStyle(color: Color(0xffD6A8EC)))),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      child: Row(
        children: [
          Expanded(
              child: TextButton(
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Color(0xffA940CE),
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
            onPressed: () async {
              //LOG IN
              //authenticate and navigate
              print(_emailController.text);
              print(_passwordController.text);

              http.Response res = await HttpService.login(
                  _emailController.text, _passwordController.text);

              if (res.statusCode == 200)
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(),
                        fullscreenDialog: true));
              else {
                print(jsonDecode(res.body)['message']);
                setState(() {
                  errorMessage = jsonDecode(res.body)['message'];
                });
                _emailController.clear();
                _passwordController.clear();
              }
            },
          ))
        ],
      ),
    );
  }

  Widget _buildSignupQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?",
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Color(0xA6D6A8EC),
                fontFamily: 'Lato',
                fontSize: 12)),
        TextButton(
          child: Text("Sign up",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color(0xffBC77DC),
                  fontFamily: 'Lato',
                  fontSize: 12)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegistrationPage()));
          },
        )
      ],
    );
  }
}
