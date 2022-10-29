// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace, unused_local_variable

import 'package:flutter/material.dart';
import 'package:myapp/presentations/TextInfo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(
            right: 20,
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              Text(
                "Profile",
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    CircleAvatar(
                      maxRadius: 50,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Maherab Hossain",
                      style: TextStyle(
                        color: basicTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "BDT",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "64000.00 TK",
                      style: TextStyle(
                        color: basicTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "GOLD",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "4.00 G",
                      style: TextStyle(
                        color: basicTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: basicTextColor),
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Card(context, "Diposit"),
                Card(context, "Withdraw"),
                Card(context, "Reffer"),
                Card(context, "Transaction"),
                Card(context, "News"),
                Card(context, "Logout"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget Card(context, title) {
  return Container(
    padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
    width: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
        border: Border(
      bottom: BorderSide(width: 1, color: basicTextColor),
    )),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 20,
      ),
    ),
  );
}
