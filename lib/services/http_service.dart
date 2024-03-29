import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thoughts_frontend/services/Thought.dart';

class HttpService {
  static final String url = "thoughts-beggeekboa-uc.a.run.app";

  static String cookie;
  static String name;
  static String user_id;

  static Future<http.Response> login(String email, String password) async {
    Map<String, String> reqBody = {'email': email, 'password': password};

    final response = await http.post(Uri.https(url, 'login'), body: reqBody);

    Map resHeader = Map.fromEntries(response.headers.entries);
    Map resBody = jsonDecode(response.body);
    cookie = resHeader['set-cookie'];
    name = resBody['name'];
    user_id = resBody['user_id'];
    print(cookie);
    print(name);
    print(user_id);

    return response;
  }

  static Future<http.Response> register(
      String uname, String email, String password) async {
    Map<String, String> reqBody = {
      'name': uname,
      'email': email,
      'password': password
    };

    final response = await http.post(Uri.https(url, 'register'), body: reqBody);

    Map resHeader = Map.fromEntries(response.headers.entries);
    Map resBody = jsonDecode(response.body);
    cookie = resHeader['set-cookie'];
    name = resBody['name'];
    user_id = resBody['user_id'];
    print(cookie);
    print(name);
    print(user_id);

    return response;
  }

  static Future<http.Response> logout() async {
    Map<String, String> reqHeaders = {'cookie': cookie};
    final response =
        await http.post(Uri.https(url, 'logout'), headers: reqHeaders);

    return response;
  }

  static Future<List<Thought>> getAllPosts() async {
    Map<String, String> reqHeaders = {'cookie': cookie};

    final response = await http.get(Uri.http(url, 'show'), headers: reqHeaders);
    //print(response.body);
    return parsePosts(response.body);
  }

  static Future<List<Thought>> getUserPosts(String uid) async {
    Map<String, String> reqHeaders = {'cookie': cookie};
    Map<String, String> reqBody = {'id': uid};

    final response = await http.post(Uri.https(url, 'show/user'),
        body: reqBody, headers: reqHeaders);
    //print(response.body);
    return parsePosts(response.body);
  }

  static List<Thought> parsePosts(String body) {
    final parsed = jsonDecode(body);
    return parsed.map<Thought>((json) => Thought.fromJson(json)).toList();
  }

  static Future<http.Response> sendPost(String content) async {
    Map<String, String> reqHeaders = {'cookie': cookie};
    Map<String, String> reqBody = {'content': content};

    final response = await http.post(Uri.https(url, 'post'),
        body: reqBody, headers: reqHeaders);

    return response;
  }
}
