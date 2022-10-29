// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/screens/HomeScreen.dart';
import 'package:myapp/screens/MarketPlaceScreen.dart';
import 'package:myapp/screens/ProfileScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var initialPage = 0;
  final _pages = [
    HomeScreen(),
    MarketPlaceScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: ((value) {
          setState(() {
            initialPage = value;
          });
        }),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 25, 44, 61),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: initialPage,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Marketplace',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: _pages[initialPage],
    );
  }
}
