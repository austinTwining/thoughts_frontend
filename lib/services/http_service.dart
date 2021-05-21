import 'package:http/http.dart' as http;

class HttpService {
  static final String url = "192.168.2.62:3000";

  static String cookie;

  static Future<http.Response> login(String email, String password) async {
    //Map<String, String> reqHeaders = {'Content-type': 'application/json'};
    Map<String, String> reqBody = {'email': email, 'password': password};

    final response = await http.post(Uri.http(url, 'login'), body: reqBody);

    Map resHeader = Map.fromEntries(response.headers.entries);
    //Map resBody = jsonDecode(response.body);
    String c = resHeader['set-cookie'];
    if (c != null) cookie = c;
    print(c);

    return response;
  }
}
