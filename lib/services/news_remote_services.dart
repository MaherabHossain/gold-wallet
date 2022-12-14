// ignore_for_file: unused_local_variable, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/utilities/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsRemoteServices {
  static var client = http.Client();
  static getNews() async {
    Map data = {};
    final prefs = await SharedPreferences.getInstance();
    var _token = prefs.getString("token");
    String token = "Bearer " + _token!;
    String url = baseUrl + "/news";
    var response = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Authorization": token,
      },
    );
    var jsonString = response.body;
    var jsonData;
    try {
      jsonData = jsonDecode(jsonString);
    } catch (e) {
      jsonData = [];
      data = {
        "status": false,
        "message": "Something went wrong",
      };
      return data;
    }
    // print("LOG:: printing response form news api!");
    // print(response.body);
    if (response.statusCode == 200) {
      if (jsonData['data'] != null) {
        return {
          "status": true,
          "data": jsonData['data'],
        };
      }
    } else if (response.statusCode == 500) {
      return {"status": false, "message": "something went wrong! try again"};
    } else {
      return {"status": false, "message": "something went wrong! try again"};
    }
  }
}
