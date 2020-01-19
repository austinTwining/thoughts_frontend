import 'package:flutter/material.dart';
import 'package:thoughts_frontend/widgets/login.dart';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
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
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Login(),
              ),
            )
          ],
        ),
      )
    );
  }
}