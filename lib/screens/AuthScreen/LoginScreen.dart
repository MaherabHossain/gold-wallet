// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/AuthController.dart';
import 'package:myapp/screens/AuthScreen/RegisterScreen.dart';
import 'package:myapp/screens/HomeScreen.dart';
import 'package:myapp/utilities/showToastMessage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String token = "";
  checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
    if (token.isNotEmpty) {
      Get.off(HomeScreen());
    }
  }

  @override
  void initState() {
    checkLogin();
    // TODO: implement initState
    super.initState();
  }

  final authController = Get.put(AuthController());
  String email = "";
  String pass = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(
          () => Stack(
            children: [
              Container(),
              Container(
                padding: EdgeInsets.only(left: 35, top: 130),
                child: Text(
                  'Welcome\nBack',
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextField(
                              onChanged: (value) {
                                email = value;
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  fillColor: Color(0xff4c505b),
                                  filled: true,
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              onChanged: (value) {
                                pass = value;
                              },
                              style: TextStyle(),
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Color(0xff4c505b),
                                  filled: true,
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff4c505b)),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: InkWell(
                                    onTap: () async {
                                      if (email.isNotEmpty && pass.isNotEmpty) {
                                        var response =
                                            await authController.login({
                                          "email": email,
                                          "password": pass,
                                        });

                                        if (response['status']) {
                                          showToastMessage(response['message']);
                                          Get.to(HomeScreen());
                                        } else {
                                          showToastMessage(response['message']);
                                        }
                                      } else {
                                        showToastMessage(
                                            "All field are required!");
                                      }
                                    },
                                    child: authController.isLoading.value
                                        ? CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'register');
                                  },
                                  child: Text(
                                    'Sign Up',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 18),
                                  ),
                                  style: ButtonStyle(),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
