import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thoughts_frontend/pages/registration.dart';
import 'package:thoughts_frontend/pages/home.dart';
import 'package:thoughts_frontend/services/http_service.dart';

import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  State createState() => new LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Material(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(
                            color: const Color(0xff9d00f5), width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(
                            color: const Color(0xff9d00f5), width: 2.0)),
                    labelText: 'email',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Quicksand',
                        color: const Color(0xff9d00f5)),
                    contentPadding: EdgeInsets.all(12.0)),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(
                            color: const Color(0xff9d00f5), width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(
                            color: const Color(0xff9d00f5), width: 2.0)),
                    labelText: 'password',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Quicksand',
                        color: const Color(0xff9d00f5)),
                    contentPadding: EdgeInsets.all(12.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 2.5),
                    child: FlatButton(
                      onPressed: () async {
                        //authenticate and navigate
                        print(_emailController.text);
                        print(_passwordController.text);

                        http.Response res = await HttpService.login(
                            _emailController.text, _passwordController.text);

                        if (res.statusCode == 200)
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        else {
                          print(jsonDecode(res.body)['message']);
                          _emailController.clear();
                          _passwordController.clear();
                        }
                      },
                      color: const Color(0xff9d00f5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          side: BorderSide(
                              color: const Color(0xff9d00f5), width: 2.0)),
                      child: Text(
                        'log in',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Quicksand',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.5),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()));
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          side: BorderSide(
                              color: const Color(0xff9d00f5), width: 2.0)),
                      child: Text(
                        'sign up',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Quicksand',
                            color: const Color(0xff9d00f5)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
