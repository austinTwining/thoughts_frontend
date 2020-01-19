import 'package:flutter/material.dart';
import 'package:thoughts_frontend/pages/home.dart';

class Register extends StatefulWidget{
  @override
  State createState() => new RegisterState();
}

class RegisterState extends State<Register>{
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmPasswordController = new TextEditingController();
  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          Material(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: const Color(0xff9d00f5), width: 2.0)
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: const Color(0xff9d00f5), width: 2.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: const Color(0xff9d00f5), width: 2.0)
                  ),
                  labelText: 'name',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Quicksand',
                    color: const Color(0xff9d00f5)
                  ),
                  contentPadding: EdgeInsets.all(12.0)
                ),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: const Color(0xff9d00f5), width: 2.0)
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: const Color(0xff9d00f5), width: 2.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: const Color(0xff9d00f5), width: 2.0)
                  ),
                  labelText: 'email',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Quicksand',
                    color: const Color(0xff9d00f5)
                  ),
                  contentPadding: EdgeInsets.all(12.0)
                ),
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
                    borderSide: BorderSide(color: const Color(0xff9d00f5), width: 2.0)
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: const Color(0xff9d00f5), width: 2.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: const Color(0xff9d00f5), width: 2.0)
                  ),
                  labelText: 'password',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Quicksand',
                    color: const Color(0xff9d00f5)
                  ),
                  contentPadding: EdgeInsets.all(12.0)
                ),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: const Color(0xff9d00f5), width: 2.0)
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: const Color(0xff9d00f5), width: 2.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: const Color(0xff9d00f5), width: 2.0)
                  ),
                  labelText: 'confirm password',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Quicksand',
                    color: const Color(0xff9d00f5)
                  ),
                  contentPadding: EdgeInsets.all(12.0)
                ),
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
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      color: const Color(0xff9d00f5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        side: BorderSide(color: const Color(0xff9d00f5), width: 2.0)
                      ),
                      child: Text('sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Quicksand',
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}