// ignore_for_file: unused_local_variable, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/utilities/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarketPlaceRemoteServices {
  static var client = http.Client();

  static sellGold(info) async {
    Map data = {};
    final prefs = await SharedPreferences.getInstance();
    var _token = prefs.getString("token");
    String token = "Bearer " + _token!;
    String url = baseUrl + "/sell-gold";
    var response = await client.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          "Authorization": token,
        },
        body: jsonEncode(info));
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
    // print("LOG:: printing response form Sell api!");
    // print(response.body);
    if (response.statusCode == 200) {
      if (jsonData['status']) {
        return {
          "status": true,
          "data": jsonData['data'],
        };
      } else {
        return {
          "status": false,
          "data": jsonData['data'],
        };
      }
    } else if (response.statusCode == 500) {
      return {"status": false, "message": "something went wrong! try again"};
    } else {
      return {"status": false, "message": "something went wrong! try again"};
    }
  }

  static buyGold(id) async {
    Map data = {};
    final prefs = await SharedPreferences.getInstance();
    var _token = prefs.getString("token");
    String token = "Bearer " + _token!;
    String url = baseUrl + "/buy/" + id.toString();
    var response = await client.post(
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
    print("LOG:: printing response form buy gold api!");
    print(response.body);
    if (response.statusCode == 200) {
      if (jsonData['status']) {
        return {
          "status": true,
          "data": "success",
        };
      } else {
        return {
          "status": false,
          "data": jsonData['data'],
        };
      }
    } else if (response.statusCode == 500) {
      return {"status": false, "message": "something went wrong! try again"};
    } else {
      return {"status": false, "message": "something went wrong! try again"};
    }
  }

  static getBuyList() async {
    Map data = {};
    final prefs = await SharedPreferences.getInstance();
    var _token = prefs.getString("token");
    String token = "Bearer " + _token!;
    String url = baseUrl + "/market-place";
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
    // print("LOG:: printing response form MARKETPLACE api!");
    print(response.body);
    if (response.statusCode == 200) {
      if (jsonData['status'] != null) {
        return {
          "status": true,
          "data": jsonData['data'],
          "user_id": jsonData['user_id']
        };
      }
    } else if (response.statusCode == 500) {
      return {"status": false, "message": "something went wrong! try again"};
    } else {
      return {"status": false, "message": "something went wrong! try again"};
    }
  }

  static userSell() async {
    Map data = {};
    final prefs = await SharedPreferences.getInstance();
    var _token = prefs.getString("token");
    String token = "Bearer " + _token!;
    String url = baseUrl + "/user-sell";
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
    // print("LOG:: printing response form User Sale api!");
    // print(response.body);
    if (response.statusCode == 200) {
      if (jsonData['status'] != null) {
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

  static deleteSale(id) async {
    Map data = {};
    final prefs = await SharedPreferences.getInstance();
    var _token = prefs.getString("token");
    String token = "Bearer " + _token!;
    String url = baseUrl + "/delete-sell/" + id.toString();
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
    print("LOG:: printing response form User Sale api!");
    print(response.body);
    if (response.statusCode == 200) {
      if (jsonData['status']) {
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
