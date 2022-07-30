// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace, unnecessary_new, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:myapp/presentations/TextInfo.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({Key? key}) : super(key: key);

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: RefreshIndicator(
          onRefresh: () async {},
          color: Colors.green,
          child: ListView(
            children: [
              Card(),
              Card(),
              Card(),
              Card(),
              Card(),
              Card(),
              Card(),
              Card(),
              Card(),
              Card(),
              Card(),
              Card(),
              Card(),
              Card(),
              Card(),
              Card(),
              Card(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Card() {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    height: 59,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: basicTextColor,
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black,
          ),
        ),
        SizedBox(width: 6),
        Text(
          "Maherab Hossain",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 6),
        Text(
          "2.0 G",
          style: TextStyle(
            fontSize: 20,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 6),
        Text(
          "29-7-2022",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 8),
        InkWell(
          onTap: () {},
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              height: 40,
              width: 50,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Center(child: Text("Buy")),
            ),
          ),
        )
      ],
    ),
  );
}
