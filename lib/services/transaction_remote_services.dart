// ignore_for_file: unused_local_variable, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/utilities/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionRemoteServices {
  static var client = http.Client();
  static trnsaction(transactionData) async {
    Map data = {};
    final prefs = await SharedPreferences.getInstance();
    var _token = prefs.getString("token");
    String token = "Bearer " + _token!;
    String url = baseUrl + "/transaction";
    var response = await client.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          "Authorization": token,
        },
        body: jsonEncode(transactionData));
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
    print("LOG:: printing response form trnasiction api!");
    print(response.body);
    if (response.statusCode == 200) {
      return {
        "status": true,
        "message": "Trnsaction successfully! wait sometimes for admin approval",
      };
    } else if (response.statusCode == 500) {
      return {"status": false, "message": "something went wrong! try again"};
    } else {
      return {"status": false, "message": "something went wrong! try again"};
    }
  }

  static checkBalance() async {
    Map data = {};
    String url = baseUrl + "/balance";
    final prefs = await SharedPreferences.getInstance();
    var _token = prefs.getString("token");
    String token = "Bearer " + _token!;
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
    print("LOG:: printing response form login api!");
    print(response.body);
    if (response.statusCode == 200) {
      return {"status": true, "balance": jsonData['data']};
    } else {
      return {"status": false, "message": "something went wrong!"};
    }
  }
}
