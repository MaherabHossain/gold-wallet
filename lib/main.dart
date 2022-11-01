// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:myapp/screens/AuthScreen/LoginScreen.dart';
import 'package:myapp/screens/AuthScreen/RegisterScreen.dart';
import 'package:myapp/screens/DepositScreen.dart';
import 'package:myapp/screens/HomePage.dart';
import 'package:myapp/screens/HomeScreen.dart';
import 'package:myapp/screens/MarketPlaceScreen.dart';
import 'package:myapp/screens/NewsScreen/NewsDetails.dart';
import 'package:myapp/screens/NewsScreen/NewsScreen.dart';

import 'package:myapp/screens/ProfileScreen.dart';
import 'package:myapp/screens/WithdrawScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: Color.fromARGB(255, 25, 44, 61)),
      home: LoginScreen(),
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterScreen(),
        ),
        GetPage(
          name: '/news',
          page: () => NewsScreen(),
        ),
        // GetPage(
        //   name: '/newsDetails',
        //   page: () => NewsDetails(),
        // ),
        GetPage(
          name: '/profile',
          page: () => ProfileScreen(),
        ),
        GetPage(
          name: '/marketplace',
          page: () => MarketPlaceScreen(),
        ), // Dynamic route
        GetPage(
          name: '/deposit',
          page: () => DepositScreen(),
        ),
        GetPage(
          name: '/withdraw',
          page: () => WithdrawScreen(),
        ), // Dynamic route
      ],
    );
  }
}
