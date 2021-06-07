import 'package:flutter/material.dart';
import 'package:thoughts_frontend/services/http_service.dart';

class ComposePage extends StatefulWidget {
  ComposePageState createState() => ComposePageState();
}

class ComposePageState extends State<ComposePage> {
  final TextEditingController _thoughtController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _thoughtController.addListener(() => setState(() {}));
  }

  //TODO: fix keyboard bug not being able to get rid of keyboard

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Compose",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontFamily: "Lato",
                      fontSize: 36,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
          //background card
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  _buildComposeField(),
                  Spacer(),
                  _buildSendButton(),
                  SizedBox(height: 145)
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildComposeField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Material(
          color: Color(0xffFAF4FE),
          child: TextField(
              controller: _thoughtController,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              maxLength: 255,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffFAF4FE),
                  border: InputBorder.none,
                  hintText: "What's on your mind?",
                  hintStyle: TextStyle(color: Color(0xffD6A8EC)))),
        ),
      ),
    );
  }

  Widget _buildSendButton() {
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
                "send thought",
                style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            onPressed: () async {
              final res = await HttpService.sendPost(_thoughtController.text);
              if (res.statusCode == 200) _thoughtController.clear();
            },
          ))
        ],
      ),
    );
  }
}
