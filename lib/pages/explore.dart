import 'package:flutter/material.dart';
import 'package:thoughts_frontend/services/Thought.dart';
import 'package:thoughts_frontend/services/http_service.dart';

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
                  "Explore",
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
            child: Material(
              color: Colors.white,
              child: ListView.builder(
                itemCount: thoughts == null ? 0 : thoughts.length,
                itemBuilder: (context, index) {
                  return _buildThoughtCard(
                      thoughts[index].content, thoughts[index].name);
                },
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildThoughtCard(String content, String name) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xffFAF4FE)))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              content,
              style: TextStyle(
                  color: Color(0xffB59FBF), fontFamily: "Lato", fontSize: 15),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Color(0xff80379A),
                        fontFamily: "Lato",
                        fontSize: 15),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
