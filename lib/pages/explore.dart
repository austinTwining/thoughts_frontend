import 'package:flutter/material.dart';
import '../widgets/thought.dart';

class ExplorePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ExploreState();
  }
}

class ExploreState extends State<ExplorePage>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Thought t = Thought("Hello World", "me");
    Thought h = Thought("Goodbye World", "you");
    Thought o = Thought("Still Here", "you");
    return Container(
      child: Center(
        child: Draggable(
          child: _getThoughtCard(t),
          feedback: _getThoughtCard(h),
          childWhenDragging: Container(),
        )
      ),
    );
  }

  Widget _getThoughtCard(Thought thought) {
    return Container(
      margin: EdgeInsets.all(15.0),
      width: 330,
      height: 400,
      child: Card(
              elevation: 12,
              color: Colors.white,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(thought.thought),
              ),
            ),
    );
  }
}