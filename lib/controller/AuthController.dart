// ignore_for_file: file_names, unused_local_variable

import 'package:get/get.dart';
import 'package:myapp/services/auth_remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  createUser(userInfo) async {
    isLoading.value = true;
    var response = await AuthRemoteServices.createUser(userInfo);
    isLoading.value = false;
    return response;
  }

  login(credentials) async {
    isLoading.value = true;
    var response = await AuthRemoteServices.login(credentials);
    if (response['status']) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", response['token']);
      await prefs.setStringList(
          "userInfo", [response['user']['name'], response['user']['email']]);
    }
    isLoading.value = false;
    return response;
  }
}
