// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:myapp/presentations/TextInfo.dart';
import 'package:myapp/screens/BuyScreen.dart';
import 'package:myapp/screens/SellScreen.dart';

class MarketPlaceScreen extends StatefulWidget {
  const MarketPlaceScreen({Key? key}) : super(key: key);

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Marketplace",
                  style: TextStyle(
                    color: basicTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Color.fromARGB(255, 25, 44, 61),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Buy",
              ),
              Tab(
                text: "Sell",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BuyScreen(),
            SellScreen(),
          ],
        ),
      ),
    );
  }
}
