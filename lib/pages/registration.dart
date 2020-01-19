import 'package:flutter/material.dart';
import 'package:thoughts_frontend/widgets/register.dart';

class RegistrationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Material(
                        color: Colors.white,
                        child: IconButton(
                          color: const Color(0xff9d00f5),
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                  Text('thoughts',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 65.0,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Quicksand',
                      color: const Color(0xff7300d1)
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Register(),
              ),
            )
          ],
        ),
      ),
    );
  }
  
}