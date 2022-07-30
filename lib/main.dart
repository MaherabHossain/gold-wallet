// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:myapp/screens/HomeScreen.dart';
import 'package:myapp/screens/ProfileScreen.dart';

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
      home: HomeScreen(),
      getPages: [
        GetPage(
          name: '/profile',
          page: () => ProfileSceen(),
        ), // Dynamic route
      ],
    );
  }
}