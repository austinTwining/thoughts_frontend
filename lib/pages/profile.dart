import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:thoughts_frontend/pages/landing.dart';
import 'package:thoughts_frontend/services/Thought.dart';
import 'package:thoughts_frontend/services/http_service.dart';
import 'package:thoughts_frontend/widgets/thought_card.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<ProfilePage> {
  List<Thought> thoughts;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final t = await HttpService.getUserPosts(HttpService.user_id);
    this.setState(() {
      thoughts = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(HttpService.name),
        TextButton(
            onPressed: () async {
              http.Response res = await HttpService.logout();

              if (res.statusCode == 200)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LandingPage()));
              else {
                print(jsonDecode(res.body)['message']);
              }
            },
            child: Text("logout")),
        Expanded(
            child: ListView.builder(
                itemCount: thoughts == null ? 0 : thoughts.length,
                itemBuilder: (context, index) {
                  return ThoughtCard(
                      thoughts[index].content, thoughts[index].name);
                }))
      ],
    );
  }
}
