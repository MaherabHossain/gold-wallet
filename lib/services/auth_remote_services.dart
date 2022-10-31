// ignore_for_file: prefer_interpolation_to_compose_strings, unused_local_variable, prefer_typing_uninitialized_variables, depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:myapp/utilities/api.dart';

class AuthRemoteServices {
  static var client = http.Client();
  static createUser(userInfo) async {
    Map data = {};
    String url = baseUrl + "/user/create";
    var response = await client.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
        },
        body: jsonEncode(userInfo));

    print("LOG:: printing response from create user API!");
    if (response.statusCode == 200) {
      return data = {"status": true, "message": "user created successfully!"};
    } else if (response.statusCode == 500) {
      return data = {
        "status": false,
        "message": "Email or NID already have a account"
      };
    } else {
      return data = {"status": false, "message": "something went wrong!"};
    }
  }

  static login(credentials) async {
    Map data = {};
    String url = baseUrl + "/user/login";
    var response = await client.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
        },
        body: jsonEncode(credentials));
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
    print("LOG:: printing response form login api!");
    print(response.body);
    if (response.statusCode == 200) {
      return {
        "status": true,
        "message": "user loged in successfully!",
        "token": jsonData['token'],
        "user": jsonData['user']
      };
    } else if (response.statusCode == 500) {
      return {"status": false, "message": "invalid credentials"};
    } else {
      return {"status": false, "message": "something went wrong!"};
    }
  }
}
