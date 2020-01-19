import 'package:flutter/material.dart';

class ComposePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ComposeState();
  }
}

class ComposeState extends State<ComposePage>{

  final TextEditingController _thoughtController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
            child: Material(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Container(
                margin: EdgeInsets.all(15.0),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: _thoughtController,
                        onSubmitted: _thoughtSubmit,
                        decoration: InputDecoration.collapsed(
                          hintText: "What's on your mind?",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Quicksand',
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Quicksand',
                        ),
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
                        maxLines: 7,
                        maxLength: 255,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('-austin',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600, 
                              fontFamily: 'Quicksand',
                              fontStyle: FontStyle.italic,
                              color: Colors.grey
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  child: FloatingActionButton(
                    onPressed: _sendThought,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image(
                        image: AssetImage('assets/globe_africa.png'),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  
  void _thoughtSubmit(String s){

  }

  void _sendThought(){

  }
}