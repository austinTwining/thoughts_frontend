import 'package:flutter/material.dart';
import 'package:thoughts_frontend/services/Thought.dart';
import 'package:thoughts_frontend/services/http_service.dart';
import '../widgets/thought_card.dart';

class ExplorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExploreState();
  }
}

class ExploreState extends State<ExplorePage> {
  List<Thought> thoughts;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final t = await HttpService.getAllPosts();
    this.setState(() {
      thoughts = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.0),
        child: ListView.builder(
            itemCount: thoughts == null ? 0 : thoughts.length,
            itemBuilder: (context, index) {
              return ThoughtCard(thoughts[index].content, thoughts[index].name);
            }));
  }
}
