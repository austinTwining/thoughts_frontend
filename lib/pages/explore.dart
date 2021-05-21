import 'package:flutter/material.dart';
import '../widgets/thought_card.dart';

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
    
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.0),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ThoughtCard("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae lacinia massa. Sed consequat consequat volutpat. Sed arcu nulla, elementum quis aliquet in, euismod in turpis. Cras sed auctor lacus, vitae blandit nibh.", "-austin");
      })
    );
  }

  
}