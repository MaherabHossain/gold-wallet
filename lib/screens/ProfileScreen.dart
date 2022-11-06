// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace, unused_local_variable, prefer_adjacent_string_concatenation, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/TransactionController.dart';
import 'package:myapp/presentations/TextInfo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final transactionController = Get.put(TransactionController());
  var balance_tk;
  var balance_gold;
  checkBalance() async {
    var response = await transactionController.checkBalance();
    print("Log:: printing response from withdraw sereen!");
    print(response['balance']);
    setState(() {
      balance_tk = response['balance']['balance_tk'];
      balance_gold = response['balance']['balance_gold'];
    });
  }

  @override
  void initState() {
    checkBalance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                      balance_tk != null ? balance_tk + " TK" : "00" + " TK",
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
                      balance_gold != null ? balance_gold + " G" : "00" + " G",
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
            Container(
                padding: EdgeInsets.only(bottom: 100),
                child: Column(
                  children: [
                    Card(context, "Diposit", '/deposit'),
                    Card(context, "Withdraw", '/withdraw'),
                    // Card(context, "Transaction"),
                    Card(context, "News", "/news"),
                    Card(context, "Buy/Sell", "/buy-sell"),
                    // Card(context, "Logout"),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

Widget Card(context, title, page) {
  return InkWell(
    onTap: () {
      print("LOG:: Tapped!");
      Get.toNamed(page);
    },
    child: Container(
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
    ),
  );
}
