import 'package:flutter/material.dart';

class ThoughtCard extends StatelessWidget{
  final String thought;
  final String name;

  ThoughtCard(this.thought, this.name);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            width: 150,
            height: 300,
            child: Text(thought),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(name)
            ],
          )
        ],
      ),
    );
  }
}