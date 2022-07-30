// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:myapp/presentations/TextInfo.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
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
        SizedBox(width: 10),
        Text(
          "29-7-2022",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "2.0 G",
          style: TextStyle(
            fontSize: 20,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "Pending",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 10),
        InkWell(
          onTap: () {},
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              height: 40,
              width: 70,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Center(child: Text("Delete")),
            ),
          ),
        )
      ],
    ),
  );
}
